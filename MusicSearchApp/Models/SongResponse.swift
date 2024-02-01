//
//  SongResponse.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 29/01/2024.
//

import Foundation

struct SongResponse: Decodable {
    let songs: [Song]
    
    enum CodingKeys: String, CodingKey {
        case songs = "results"
    }
}

struct Song: Decodable {
    let id: Int
    let trackName: String
    let artistName: String
    let artworkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case artworkUrl = "artworkUrl60"
    }
}
