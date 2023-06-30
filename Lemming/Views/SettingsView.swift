//
//  SettingsView.swift
//  Lemming
//
//  Created by Johnathan on 29/06/2023.
//

import SwiftUI
import KeychainAccess

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "gearshape")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(Color.gray)
                                .cornerRadius(25)
                            Text("General")
                                .foregroundColor(Color("default-text"))
                        }
                    }
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "paintbrush.fill")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(Color(.blue))
                                .cornerRadius(25)
                            Text("Appearance")
                                .foregroundColor(Color("default-text"))
                        }
                    }
                }
                Button(action: {Authentication().logout()}) {
                    Text("Disconnect all accounts")
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
            VStack {
                Text("Inside next VStack")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


