//
//  LoginReq.swift
//  Lemming
//
//  Created by Johnathan on 29/06/2023.
//

import Foundation
import Lemmy_Swift_Client
import KeychainAccess

class Authentication {
    
    public let keychain = Keychain(service: "com.johnathan.Lemming")
    
    public func login(user: String, passwd: String, instance: String) async -> Bool {
        var success = false
        if let url = URL(string: "https://" + instance + "/api/v3") {
            let api = LemmyAPI(baseUrl: url)
            let request = LoginRequest(username_or_email: user, password: passwd)
            if let response = try? await api.request(request) {
                keychain["JWT"] = response.jwt
                print("!!! KEY ADDED TO KEYCHAIN !!!")
                success = true
            } else {
                success = false
            }
        }
        return success
    }
    
    public func logout() {
        do {
            try keychain.removeAll()
            print("!!! ALL KEY REMOVED FROM KEYCHAIN !!!")
        } catch {
            print("Error removing Keys")
        }
    }

}
