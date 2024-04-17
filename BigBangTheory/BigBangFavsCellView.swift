//
//  BigBangFavsCellViewView.swift
//  BigBangTheory
//
//  Created by Yery Castro on 18/3/24.
//

import SwiftUI

struct BigBangFavsCellView: View {
    @EnvironmentObject var vm: BigBangVM
    let episode: BigBang
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("\(episode.episodeInfo): \(episode.name)")
            .font(.subheadline)
    }
    
}

#Preview {
    BigBangFavsCellView(episode: .test)
}
