//
//  ActorSocialNetworkData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 06.04.2022.
//

import Foundation

struct ActorSocialNetworkData: Decodable {
    let id: Int
    let instagramID, twitterID: String

    enum CodingKeys: String, CodingKey {
        case id
        case instagramID = "instagram_id"
        case twitterID = "twitter_id"
    }
}

