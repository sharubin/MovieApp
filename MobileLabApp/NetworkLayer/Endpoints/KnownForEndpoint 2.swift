//
//  KnownForEndpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.04.2022.
//

import Foundation

enum KnownForEndpoint: Endpoint {
    case getKnownForData(id: Int)
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
        case .getKnownForData(let id):
            return "/3/person/\(id)/movie_credits"
        }
    }

    var parameters: [URLQueryItem] {
        let apiKey = APIResourses.APIClient.apiKey
        let language = NSLocale.current.languageCode
        
        switch self {
        case .getKnownForData:
            return [ URLQueryItem(name: "language", value: language),
                     URLQueryItem(name: "api_key", value: apiKey)]
        }
    }

    var method: String {
        switch self {
        case .getKnownForData:
            return "GET"
        }
    }
}
