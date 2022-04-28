//
//  RecommendationsData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 01.04.2022.
//

import Foundation

// MARK: - RecommendationData
struct RecommendationData: Codable {
    let results: [RecommendationDataResult]
}

// MARK: - Result
struct RecommendationDataResult: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let mediaType: MediaType
    let title: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var linkImage: URL? {
        get {
            return URL(string: String(format: Links.imageLink, backdropPath))
        }
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case title
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}
