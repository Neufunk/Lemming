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
    @State private var selection = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker(selection: $selection, label: Text("")) {
                    Text("SUBSCRIBED").tag(0)
                    Text("LOCAL").tag(1)
                    Text("ALL").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Spacer()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("< Communities") {
                        isCommunitiesPresented = true
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .principal) {
                    Text("Feed")
                        .font(.headline)
                }
            }
            Text("Hello, World!")
                .font(.title)
                .padding(.horizontal, 20.0)
            
                .fullScreenCover(isPresented: $isCommunitiesPresented) {
                    CommunitiesView()
                }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
