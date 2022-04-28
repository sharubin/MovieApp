//
//  KnownForData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.04.2022.
//

import Foundation

// MARK: - KnownForData
struct KnownForData: Decodable {
    let cast: [KnownForCast]
    let id: Int
}

// MARK: - Cast
struct KnownForCast: Decodable {
    let id: Int
    let posterPath: String?
    let title: String

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
    }
}
