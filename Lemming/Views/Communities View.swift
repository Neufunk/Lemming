import SwiftUI

struct CommunitiesView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selection = 0
    @StateObject private var comm = Communities()
    
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
                .onChange(of: selection, perform: { value in
                    if value == 0 {
                        Task {
                            await comm.getCommunities(type_: .subscribed)
                        }
                    }
                    if value == 1 {
                        Task {
                            await comm.getCommunities(type_: .local)
                        }
                    }
                    if value == 2 {
                        Task {
                            await comm.getCommunities(type_: .all)
                        }
                    }
                })
                
                List(comm.communitiesArray, id: \.self) { community in
                    Text(community)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Communities")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Back") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await comm.getCommunities(type_: .subscribed)
            }
        }
    }
}

struct CommunitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CommunitiesView()
    }
}
