//
//  ImageEndpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 31.03.2022.
//

import Foundation

enum ImageEndpoint: Endpoint {
    case getImageData(id: Int)
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
        case .getImageData(let id):
            return "/3/movie/\(id)/images"
        }
    }

    var parameters: [URLQueryItem] {
        let apiKey = APIResourses.APIClient.apiKey
        let language = NSLocale.current.languageCode
        
        switch self {
        case .getImageData:
            return [ URLQueryItem(name: "language", value: language),
                     URLQueryItem(name: "api_key", value: apiKey)]
        }
    }

    var method: String {
        switch self {
        case .getImageData:
            return "GET"
        }
    }
}
