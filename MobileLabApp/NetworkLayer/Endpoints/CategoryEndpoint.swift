//
//  TrendingEndpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 11.03.2022.
//

import Foundation

enum CategoryEndpoint: Endpoint {
    case getMovieData(category: Category)
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
        case .getMovieData(let category):
            return "/3/movie/\(category)"
        }
    }

    var parameters: [URLQueryItem] {
        let apiKey = APIResourses.APIClient.apiKey
        let language = NSLocale.current.languageCode
        
        switch self {
        case .getMovieData:
            return [ URLQueryItem(name: "language", value: language),
                     URLQueryItem(name: "api_key", value: apiKey)]
        }
    }

    var method: String {
        switch self {
        case .getMovieData:
            return "GET"
        }
    }
}
