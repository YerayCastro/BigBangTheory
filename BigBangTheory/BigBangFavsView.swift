//
//  BigBangFavsView.swift
//  BigBangTheory
//
//  Created by Yery Castro on 18/3/24.
//

import SwiftUI

struct BigBangFavsView: View {
    let episode: BigBang
    @EnvironmentObject var vm: BigBangVM
    let item = GridItem(.adaptive(minimum: 150), alignment: .center)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.favoriteEpisodes) { favorite in
                    NavigationLink(value: favorite) {
                        BigBangFavsCellView(episode: favorite)
                           
                    }
                }
                
            }
            .navigationDestination(for: BigBang.self) { bigbang in
                BigBangDetailView(episode: bigbang)
                
            }
            .navigationTitle("Favoritos")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                vm.loadFavoritesFromFile()
            }
        }
    }
}

#Preview {
    NavigationStack{
        BigBangFavsView(episode: .test)
            .environmentObject(BigBangVM.preview)
    }
}
