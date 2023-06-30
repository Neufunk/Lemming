//
//  FeedView.swift
//  Lemming
//
//  Created by Johnathan on 29/06/2023.
//

import SwiftUI

struct FeedView: View {
    
    @State var testText = "FEED"
    @State var isCommunitiesPresented = false
    
    var body: some View {
        Text("Hello, World!")
            .padding(.horizontal, 20.0)
            .navigationTitle("Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("< Communities") {
                        isCommunitiesPresented = true
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isCommunitiesPresented) {
                Communities_View()
            }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
