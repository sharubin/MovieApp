//
//  RecommendationsEndpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 01.04.2022.
//

import Foundation

enum RecommendationsEndpoint: Endpoint {
    case getRecommendationsData(id: Int)
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
        case .getRecommendationsData(let id):
            return "/3/movie/\(id)/recommendations"
        }
    }

    var parameters: [URLQueryItem] {
        let apiKey = APIResourses.APIClient.apiKey
        let language = NSLocale.current.languageCode
        
        switch self {
        case .getRecommendationsData:
            return [ URLQueryItem(name: "language", value: language),
                     URLQueryItem(name: "api_key", value: apiKey)]
        }
    }

    var method: String {
        switch self {
        case .getRecommendationsData:
            return "GET"
        }
    }
}
