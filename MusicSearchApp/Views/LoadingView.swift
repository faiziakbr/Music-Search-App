//
//  LoadingView.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 29/01/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView("Loading music...")
            Spacer()
        }
    }
}

#Preview {
    LoadingView()
}
