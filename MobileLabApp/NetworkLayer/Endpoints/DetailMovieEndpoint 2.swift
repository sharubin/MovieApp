//
//  DetailMovieEndpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.03.2022.
//

import Foundation

enum DetailMovieEndpoint: Endpoint {
    case getMovieData(id: Int)
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
        case .getMovieData(let id):
            return "/3/movie/\(id)"
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
