//
//  MediaImageData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 30.03.2022.
//

import Foundation

struct MediaImageData: Codable {
    let backdrops: [MediaImage]
    let id: Int
    let posters: [MediaImage]
}

struct MediaImage: Codable {

    let voteAverage: Double
    let voteCount: Int
    let filePath: String
    
    var linkImage: URL? {
        get {
            URL(string: String(format: Links.imageLink, filePath))
        }
    }

    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
