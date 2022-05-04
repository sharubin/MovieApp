//
//  CrewData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 28.03.2022.
//

import Foundation

enum CrewEndpoint: Endpoint {
    case getCrewData(id: Int)
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
        case .getCrewData(let id):
            return "/3/movie/\(id)/credits"
        }
    }

    var parameters: [URLQueryItem] {
        let apiKey = APIResourses.APIClient.apiKey
        let language = NSLocale.current.languageCode
        
        switch self {
        case .getCrewData:
            return [ URLQueryItem(name: "language", value: language),
                     URLQueryItem(name: "api_key", value: apiKey)]
        }
    }

    var method: String {
        switch self {
        case .getCrewData:
            return "GET"
        }
    }
}

