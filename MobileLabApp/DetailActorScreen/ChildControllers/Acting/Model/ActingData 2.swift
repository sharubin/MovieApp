//
//  ActingData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 12.04.2022.
//

import Foundation

// MARK: - KnownForData
struct ActingData: Decodable {
    let cast: [ActingResult]
    let crew: [ActingResult]
    let id: Int
}

// MARK: - Cast
struct ActingResult: Decodable {
    let id: Int
    let title: String
    let releaseDate: String?
    let character: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case title
        case id
        case character
        case job
    }
}
