//
//  DataModel.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 26/01/2024.
//

import Foundation

// https://itunes.apple.com/search?term=coldplay&entity=song

final class DataModel {
    
    private var dataTask: URLSessionDataTask?
    
    func loadSongs(searchTerm: String, completion: @escaping([Song]) -> Void) {
        dataTask?.cancel()
        
        guard let url = buildUrl(forTerm: searchTerm) else {
            completion([])
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            if let data  {
                
                if let songResponse = try? JSONDecoder().decode(SongResponse.self, from: data) {
                    completion(songResponse.songs)
                } else {
                    completion([])
                }
            } else {
                completion([])
                return
            }
        })
        
        dataTask?.resume()
    }
    
    private func buildUrl(forTerm searchTerm: String) -> URL? {
        guard !searchTerm.isEmpty else { return nil }
        
        let queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: "song")
        ]
        
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = queryItems
        
        return components?.url
    }
}
