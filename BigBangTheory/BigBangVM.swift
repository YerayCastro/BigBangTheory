import SwiftUI

final class BigBangVM: ObservableObject {
    let interactor: Interactor
    
    @Published var bigBang: [BigBang]
    @Published var favoritos: [BigBang] = []
    @Published var favoriteEpisodes: [BigBang] = []
    
    
    
    var seasons: [Int] {
        Array(Set(bigBang.map(\.season))).sorted()
    }
    
    init(interactor: Interactor = DataInteractor()) {
        self.interactor = interactor
        do {
            self.bigBang = try interactor.loadData()
        } catch {
            self.bigBang = []
            print(error)
        }
    }
    
    // Método para obtener los episodios por temporada
    func episodesBy(season: Int) -> [BigBang] {
        bigBang.filter { bb in
            bb.season == season
        }.sorted { bb1, bb2 in
            bb1.number < bb2.number
        }
    }
    
    // Método para obtener un episodio por su id
    func getEpisodeBy(id: Int) -> BigBang? {
        bigBang.first(where: { $0.id == id })
    }
    
//    private func getDocumentsDirectory() -> URL {
//        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//    }
//    
//    func saveFavoritesToFile() async {
//        do {
//            let data = try JSONEncoder().encode(favoritos)
//            let fileURL = getDocumentsDirectory().appendingPathComponent("BigBang.json")
//            try data.write(to: fileURL, options: .atomic)
//        } catch {
//            print("Error al guardar los favoritos: \(error)")
//        }
//    }
//    
//    func addToFavorites(bigBang: BigBang) {
//        withAnimation {
//            if !favoritos.contains(where: { $0.id == bigBang.id }) {
//                favoritos.append(bigBang)
//                Task {
//                    await saveFavoritesToFile()
//                }
//            }
//        }
//    }
//    
//    func loadFavoritesFromFile() {
//        let fileURL = getDocumentsDirectory().appendingPathComponent("BigBang.json")
//        if let data = try? Data(contentsOf: fileURL) {
//            favoritos = (try? JSONDecoder().decode([BigBang].self, from: data)) ?? []
//        }
//    }
//    
//    private func saveMangasToFile() async {
//        do {
//            let data = try JSONEncoder().encode(bigBang)
//            let fileURL = getDocumentsDirectory().appendingPathComponent("bigbang.json")
//            try data.write(to: fileURL, options: .atomic)
//        } catch {
//            print("Error al guardar los mangas: \(error)")
//        }
//    }
    private func getDocumentsDirectory() -> URL {
           FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
       }
       
       func addToFavorites(episode: BigBang) {
           withAnimation {
               if !favoriteEpisodes.contains(where: { $0.id == episode.id }) {
                   favoriteEpisodes.append(episode)
                   saveFavoritesToFile()
               }
           }
       }

       func removeFromFavorites(episodeToRemove: BigBang) {
           withAnimation {
               if let index = favoriteEpisodes.firstIndex(where: { $0.id == episodeToRemove.id }) {
                   favoriteEpisodes.remove(at: index)
                   saveFavoritesToFile()
               }
           }
       }
       
       func loadFavoritesFromFile() {
           let fileURL = getDocumentsDirectory().appendingPathComponent("favoriteEpisodes.json")
           if let data = try? Data(contentsOf: fileURL) {
               favoriteEpisodes = (try? JSONDecoder().decode([BigBang].self, from: data)) ?? []
           }
       }

       func saveFavoritesToFile() {
           let fileURL = getDocumentsDirectory().appendingPathComponent("favoriteEpisodes.json")
           if let data = try? JSONEncoder().encode(favoriteEpisodes) {
               try? data.write(to: fileURL, options: .atomicWrite)
           }
       }
}
//extension BigBangVM {
//    func toggleFavorite(forEpisodeId episodeId: Int) {
//        if favoritos.contains(episodeId) {
//            favoritos.removeAll { $0 == episodeId }
//        } else {
//            favoritos.append(episodeId)
//        }
//    }
//}

