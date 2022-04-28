//
//  ActorData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 21.03.2022.
//

import UIKit

// MARK: - ActorData
struct ActorData: Codable {
    let results: [ActorInfo]
}

// MARK: - Result
struct ActorInfo: Codable {
    let id: Int
    let name: String
    let popularity: Double
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name, popularity
        case profilePath = "profile_path"
    }
}
