//
//  DiscoverEndpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.04.2022.
//

import Foundation

//https://api.themoviedb.org/3/discover/movie?api_key=5aa3960cac883a3b943e4c337fdb0ae7&language=en-US&page=1

enum DiscoverEndpoint: Endpoint {
    case getData(page: String)
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
        case .getData:
            return "/3/discover/movie"
        }
    }

    var parameters: [URLQueryItem] {
        let apiKey = APIResourses.APIClient.apiKey
        let language = NSLocale.current.languageCode
        
        switch self {
        case .getData(let page):
            return [ URLQueryItem(name: "language", value: language),
                     URLQueryItem(name: "api_key", value: apiKey),
                     URLQueryItem(name: "page", value: page)]
        }
    }

    var method: String {
        switch self {
        case .getData:
            return "GET"
        }
    }
}
