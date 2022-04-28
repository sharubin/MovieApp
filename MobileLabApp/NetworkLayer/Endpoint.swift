//
//  Endpoint.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 11.03.2022.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var baseURl: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
}
