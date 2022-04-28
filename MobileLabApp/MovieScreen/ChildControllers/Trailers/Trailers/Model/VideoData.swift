//
//  VideoData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 14.03.2022.
//

import Foundation

// MARK: - VideoData
struct VideoData: Codable {
    let id: Int
    let results: [VideoDataResults]
}

// MARK: - Result
struct VideoDataResults: Codable {
    let name: String
    let key: String
    
    var linkImage: URL? {
        get {
            return URL(string: String(format: Links.imageLinkFromYoutube, key))
        }
    }
}
