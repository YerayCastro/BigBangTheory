//
//  Model.swift
//  BigBangTheory
//
//  Created by Yery Castro on 14/3/24.
//

import Foundation

struct BigBang: Codable, Hashable, Identifiable {
    let id: Int
    let season: Int
    let number: Int
    let summary: String
    let runtime: Int
    let airdate: String
    let image: String
    let name: String
    let url: String
    
    var episodeInfo: String {
        "\(season.formatted(.number.precision(.integerLength(2))))x\(number.formatted(.number.precision(.integerLength(2))))"
    }
}

