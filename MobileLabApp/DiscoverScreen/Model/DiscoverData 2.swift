//
//  DiscoverData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.04.2022.
//

import Foundation

// MARK: - DiscoverData
struct DiscoverData: Codable {
    let page: Int
    let results: [DiscoverResult]
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct DiscoverResult: Codable {
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
