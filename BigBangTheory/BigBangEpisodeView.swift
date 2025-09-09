//
//  EpisodeView.swift
//  BigBangTheory
//
//  Created by Yery Castro on 18/3/24.
//

import SwiftUI

struct BigBangEpisodeView: View {
    let episode: BigBang 
    
    var body: some View {
        VStack {
            Image("\(episode.image)")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white.opacity(0.3))
                        .frame(height: 40)
                    Text("\(episode.episodeInfo): \(episode.name)")
                        .font(.headline)
                        .tint(.primary)
                }
                
        }
        .padding()
    }
}

#Preview {
    BigBangEpisodeView(episode: .test)
}
