//
//  BigBangDetailView.swift
//  BigBangTheory
//
//  Created by Yery Castro on 16/3/24.
//

import SwiftUI

struct BigBangDetailView: View {
    @EnvironmentObject var vm: BigBangVM
    @Environment(\.dismiss) var dismiss
    var episode: BigBang
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Image(episode.image)
                    .resizable()
                    .scaledToFit()
                BigBangCellView(title: "Episode", label: "\(episode.name)")
                BigBangCellView(title: "Airdate", label: "\(episode.airdate)")
                BigBangCellView(title: "Runtime", label: "\(episode.runtime) minutos.")
                BigBangCellView(title: "URL", label: "\(episode.url)")
                BigBangCellView(title: "Summary", label: "\(episode.summary)")
            }
            
        }
        .navigationTitle(episode.episodeInfo)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    
                    if vm.favoriteEpisodes.contains(where: { $0.id == episode.id }) {
                                        vm.removeFromFavorites(episodeToRemove: episode)
                                    } else {
                                        vm.addToFavorites(episode: episode)
                                    }
                    dismiss()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        BigBangDetailView(episode: .test)
            .environmentObject(BigBangVM.preview)
    }
}
