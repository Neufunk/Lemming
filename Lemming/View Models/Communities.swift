//
//  Communities.swift
//  Lemming
//
//  Created by Johnathan on 01/07/2023.
//

import Foundation
import Lemmy_Swift_Client
import KeychainAccess

class Communities : ObservableObject {
    
    private var jwt = ""
    
    private let keychain = Keychain(service: "com.johnathan.Lemming")
    @Published var communitiesArray: [String] = []
    
    private func GetJsonWebToken() {
        if let jwt = keychain["JWT"] {
            self.jwt = jwt
        }
    }
    
    func getCommunities(type_ : ListingType?) async {
        if let baseUrl = URL(string: "https://enterprise.lemmy.ml/api/v3") {
            let api = LemmyAPI(baseUrl: baseUrl)
            GetJsonWebToken()
            let request = ListCommunitiesRequest(auth: jwt, limit: 30, page: 1,
                                                 sort: .hot, type_: type_)
            do {
                let response = try await api.request(request)
                print(response)
                let communityNames = response.communities.map { $0.community.name }
                DispatchQueue.main.async {
                    self.communitiesArray = communityNames
                }
            } catch {
                print("Unexpected error: \(error).")
            }
        }
    }
    
}
