//
//  Pruebas.swift
//  BigBangTheory
//
//  Created by Yery Castro on 16/3/24.
//

import SwiftUI

struct BigBangView: View {
    let bigBang: BigBang
    @EnvironmentObject var vm: BigBangVM
    
    var body: some View {
        NavigationStack{
            ScrollView {
                ForEach(vm.seasons, id: \.self) { season in
                    let imageName = "season\(season)"
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(vm.episodesBy(season: season), id: \.id) { episode in
                                NavigationLink(destination: BigBangDetailView(episode: episode)) {
                                    BigBangEpisodeView(episode: episode)
                                }
                                
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: BigBang.self){ episode in
                BigBangDetailView(episode: episode)
            }
            .navigationTitle("Big Bang Theory")
            
        }
        
    }
}


#Preview {
    BigBangView(bigBang: .test)
        .environmentObject(BigBangVM.preview)
}

//ForEach(vm.episodesBy(season: bigBang.season), id: \.id) { episode in
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 360, height: 300)
//                        .overlay {
//                            Text("Episode: \(episode.number)")
//                                .font(.title2)
//                                .bold()
//                                .foregroundStyle(.white)
//                                .padding(.bottom, 230)
//                            Image(episode.image)
//                                .resizable()
//                                .scaledToFit()
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .padding()
//                            Text(episode.name)
//                                .font(.footnote)
//                                .bold()
//                                .foregroundStyle(.white)
//                                .padding(.top, 250)
//                        }
//                        .padding()
//    
//                        }


//episodio por temporada
//ForEach(vm.episodesBy(season: bigBang.season), id: \.id) { episode in
//    Image(episode.image)
//    }

//Todos los episodios
//ForEach(vm.bigBang, id: \.self) { episode in
//    VStack {
//        Image(episode.image)
//            .resizable()
//            .scaledToFit()
//        Text(episode.name)
//            .font(.caption)
//        Text("\(episode.episodeInfo)")
//    }
//}


//ScrollView(.horizontal) {
//    HStack {
//        ForEach(vm.bigBang, id: \.self) { episode in
//            VStack {
//                Image(episode.image)
//                    .resizable()
//                    .scaledToFit()
//                Text(episode.name)
//                    .font(.caption)
//            }
//        }
//    }
//}


//
//ForEach(vm.covers, id: \.self) { cover in
//
//    Image("\(cover.imageName)")
//    
//    
//    }


//NavigationStack {
//    ScrollView {
//        ZStack {
//            VStack {
//                ScrollView {
//                
//                    ForEach(Array(vm.episodesGroupedBySeason().keys).sorted(), id: \.self) { seasonNumber in
//                                   if let seasonDetails = vm.episodesGroupedBySeason()[seasonNumber] {
//                                       VStack(alignment: .leading) {
//                                           // Muestra la imagen de la portada de la temporada
//                                           NavigationLink(value: bigBang){
//                                               Image(seasonDetails.coverImage)
//                                                   .resizable()
//                                                   .scaledToFit()
//                                                   .frame(height: 200) // Ajusta según necesidad
//                                                   .padding(.bottom)
//                                           }
//                                           
//                                           ScrollView(.horizontal) {
//                                               HStack {
//                                                   ForEach(seasonDetails.episodes, id: \.id) { episode in
//                                                       VStack(alignment: .leading) {
//                                                           
//                                                           // Aquí puedes añadir más detalles sobre el episodio si lo deseas
//                                                           Image(episode.image)
//                                                               .resizable()
//                                                               .scaledToFit()
//                                                               
//                                                               
//                                                       }
//                                                       
//                                                   }
//                                               }
//                                               .padding(.horizontal)
//
//                                               }
//                                           }
//                                       
//                                           
//
//                                   }
//                               }
//                           }
//                
//                        
//                }
//            
//            }
//        }
//}

//        NavigationStack {
//            ScrollView {
//                ZStack {
//                    VStack {
                        
//                        ForEach(vm.seasons, id: \.self) { season in
//                            VStack {
//                                // Genera el nombre de la imagen basado en el número de temporada
//                                let imageName = "season\(season)"
//                                Image(imageName)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 200)
//                                    .padding(.bottom)
//
//                                // Opcional: Muestra el número de temporada
//                                Text("Season \(season)")
//                            }
//
//
//                        }
//            }
//
//
//
//        }
//    }
//}
