//
//  EmptyStateView.swift
//  MusicSearchApp
//
//  Created by Faizan Akbar on 26/01/2024.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: 80))
                .padding(.bottom)
            Text("Start searching for music...")
                .font(.title)
            Spacer()
        }
        .foregroundColor(Color(.systemIndigo))
    }
}

#Preview {
    EmptyStateView()
}
