//
//  HomeView.swift
//  Lemming
//
//  Created by Johnathan on 29/06/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "list.bullet")
                        .foregroundColor(.white)
                    Text("Feed")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .foregroundColor(.white)
                    Text("Profile")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .foregroundColor(.white)
                    Text("Settings")
                }
        }
        .toolbarBackground(.black, for: .tabBar)
    }
    
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
