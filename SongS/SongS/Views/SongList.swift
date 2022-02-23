//
//  ContentView.swift
//  SongS
//
//  Created by fulin on 23/1/22.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.songs) {
                    song in
                    Button {
                        print("selected")
                    } label: {
                        Text(song.title).font(.title3).foregroundColor(Color(.label))
                    }
                }
            }.navigationTitle(Text("Songs")).toolbar {
                Button {
                    print("add song")
                } label: {
                    Label("add song", systemImage: "plus.circle")
                }
            }
        }
        .sheet(item: Binding<Ide>, onDismiss: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, content: <#T##(Identifiable) -> View#>)
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("****error: \(error)")
                }
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
