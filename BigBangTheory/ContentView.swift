//
//  ContentView.swift
//  BigBangTheory
//
//  Created by Yery Castro on 14/3/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: BigBangVM
    
    var body: some View {
        TabView {
            BigBangView(bigBang: .test)
                .tabItem { Label("DB", systemImage: "movieclapper.fill")}
            BigBangFavsView(episode: .test)
                .tabItem { Label("Favoritos", systemImage: "star")}
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(BigBangVM.preview)
}
