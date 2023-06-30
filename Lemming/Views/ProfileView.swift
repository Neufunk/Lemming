//
//  ProfileView.swift
//  Lemming
//
//  Created by Johnathan on 29/06/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                        .foregroundColor(Color("default-text"))
                    Image(systemName: "person")
                }
                Text("Inside Form")
            }
            .navigationTitle("Profile")
            VStack {
                Text("Inside next VStack")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
