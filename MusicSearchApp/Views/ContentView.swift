//
//  ContentView.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 26/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: SongListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchTerm: $viewModel.searchTerm)
                if viewModel.isSearching {
                    LoadingView()
                } else if viewModel.songs.isEmpty {
                    EmptyStateView()
                } else {
                    List(viewModel.songs) { song in
                        SongView(song: song)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Music Search")
        }
        .navigationViewStyle(.stack)
    }
}

struct SongView: View {
    
    @ObservedObject var song: SongViewModel
    
    var body: some View {
        HStack {
            ArtworkView(image: song.artwork)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct ArtworkView: View {
    let image: Image?
    
    var body: some View {
        ZStack {
            if image != nil {
                image
            } else {
                Color(.systemIndigo)
                Image(systemName: "music.note")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 50, height: 50)
        .shadow(radius: 5)
        .padding(.trailing, 5)
    }
}

#Preview {
    ContentView(viewModel: SongListViewModel())
}
