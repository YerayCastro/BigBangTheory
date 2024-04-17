//
//  Interactor.swift
//  BigBangTheory
//
//  Created by Yery Castro on 14/3/24.
//

import Foundation

protocol Interactor {
    var urlBundle: URL { get }
    var docURL: URL { get }
    
    func loadData<T>() throws -> T where T: Codable
    func saveData<T>(json: T) throws where T: Codable
}


struct DataInteractor: Interactor {
    let urlBundle = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    let docURL = URL.documentsDirectory.appending(path: "BigBang.json")
    
    
}

extension Interactor {
    func loadData<T>() throws -> T where T: Codable {
        var url = docURL
        if !FileManager.default.fileExists(atPath: url.path()) {
            url = urlBundle
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func saveData<T>(json: T) throws where T: Codable {
        let data = try JSONEncoder().encode(json)
        try data.write(to: docURL, options: .atomic)
    }
}
