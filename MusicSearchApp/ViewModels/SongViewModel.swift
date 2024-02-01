//
//  SongViewModel.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 29/01/2024.
//

import Foundation
import SwiftUI

final class SongViewModel: Identifiable, ObservableObject {
    let id: Int
    let trackName: String
    let artistName: String
    
    @Published var artwork: Image?
    
    init(song: Song) {
        self.id = song.id
        self.trackName = song.trackName
        self.artistName = song.artistName
    }
}
