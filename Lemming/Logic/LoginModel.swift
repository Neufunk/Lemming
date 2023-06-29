//
//  LoginReq.swift
//  Lemming
//
//  Created by Johnathan on 29/06/2023.
//

import Foundation
import Lemmy_Swift_Client

class LoginModel {
    
    public func login(user: String, passwd: String, instance: String) async -> Bool {
        var success = false
        if let url = URL(string: "https://" + instance + "/api/v3") {
            // Create an instance of the Lemmy API with the base URL of your Lemmy instance
            let api = LemmyAPI(baseUrl: url)
            // Create a SearchRequest object with the `q` parameter
            let request = LoginRequest(username_or_email: user, password: passwd)
            // Send the request to the Lemmy API
            if let response = try? await api.request(request) {
                print(response.jwt)
                success = true
            } else {
                print("Error")
            }
        }
        print(success)
        return success
    } 
}
