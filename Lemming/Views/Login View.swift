//
//  ContentView.swift
//  Lemming
//
//  Created by Johnathan on 29/06/2023.
//

import Foundation
import SwiftUI
import KeychainAccess

struct Login_View: View {
    
    @State var username = "Neuf"
    @State var password = "Test15243="
    @State var instance = "enterprise.lemmy.ml"
    @State var isAuthenticated: Bool = false
    private let keychain = Keychain(service: "com.johnathan.Lemming")
    
    var body: some View {
        if let jwt = keychain["JWT"], !jwt.isEmpty {
            HomeView()
        } else if isAuthenticated {
            HomeView()
        } else {
            VStack() {
                Text("LEMMING")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding(.top, 50)
                    .shadow(radius: 6.0, x: 10, y: 10)
                Text("Lemmy App")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50)
                    .shadow(radius: 6.0, x: 10, y: 10)
                
                Image("lemming-logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 9.0, x: 20, y: 10)
                    .padding(.bottom, 40)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(25.0)
                        .shadow(radius: 10.0, x: 5, y: 10)
                    
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(25.0)
                        .shadow(radius: 10.0, x: 5, y: 10)
                    
                    TextField("Instance", text: $instance)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(25.0)
                        .shadow(radius: 10.0, x: 5, y: 10)
                }
                .padding([.leading, .trailing], 50)
                
                Button(action: {} ) {
                    Text("Forgot password?")
                        .padding([.leading], 150)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    Task {
                        let success = await
                        Authentication().login(user: username, passwd: password, instance: instance)
                        if success {
                            isAuthenticated = true
                        }
                    }
                })
                {Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color(.blue))
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 50)
                
                Spacer()
                HStack {
                    Text("Don't have an account? ")
                        .foregroundColor(.white)
                    Button(action: {}) {
                        Text("Sign Up")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login_View()
    }
}
