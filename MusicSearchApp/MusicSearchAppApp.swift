//
//  MusicSearchAppApp.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 26/01/2024.
//

import SwiftUI

@main
struct MusicSearchAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SongListViewModel())
        }
    }
}
