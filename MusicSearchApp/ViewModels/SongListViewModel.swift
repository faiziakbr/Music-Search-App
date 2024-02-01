//
//  SongListViewModel.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 26/01/2024.
//

import Foundation
import SwiftUI
import Combine

final class SongListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published private(set) var songs: [SongViewModel] = []
    @Published private(set) var isSearching = false
    
    private let dataModel = DataModel()
    private let artworkLoader = ArtworkLoader()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .sink(receiveValue: loadSongs(searchTerm:))
            .store(in: &cancellables)
    }
    
    private func loadSongs(searchTerm: String) {
        isSearching = true
        songs.removeAll()
        artworkLoader.reset()
        
        dataModel.loadSongs(searchTerm: searchTerm) { [weak self] songs in
            guard let self else { return }
            DispatchQueue.main.async {
                self.isSearching = false
            }
            
            songs.forEach {
                self.appendSong(song: $0)
            }
        }
    }
    
    private func appendSong(song: Song) {
        let songViewModel = SongViewModel(song: song)
        
        DispatchQueue.main.async {
            self.songs.append(songViewModel)
        }
        
        artworkLoader.loadArtwork(forSong: song) { image in
            DispatchQueue.main.async {
                songViewModel.artwork = image
            }
        }
    }
}
