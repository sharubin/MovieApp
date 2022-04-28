//
//  ActorSocialNetworkDataEndpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 06.04.2022.
//

import Foundation

enum ActorSocialNetworkDataEndpoint: Endpoint {
    case getActorData(id: Int)
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }

    var baseURl: String {
        switch self {
        default:
            return "api.themoviedb.org"
        }
    }
 
    var path: String {
        switch self {
        case .getActorData(let id):
            return "/3/person/\(id)/external_ids"
        }
    }

    var parameters: [URLQueryItem] {
        let apiKey = APIResourses.APIClient.apiKey
        let language = NSLocale.current.languageCode
        
        switch self {
        case .getActorData:
            return [ URLQueryItem(name: "language", value: language),
                     URLQueryItem(name: "api_key", value: apiKey)]
        }
    }

    var method: String {
        switch self {
        case .getActorData:
            return "GET"
        }
    }
}
