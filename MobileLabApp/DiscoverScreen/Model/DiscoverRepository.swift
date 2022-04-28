//
//  DiscoverRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.04.2022.
//

import Foundation

protocol DiscoverRepositoryProtocol {
    func getMovieData(page: String, completion: @escaping (Result<DiscoverData, Error>) -> Void)
}

class DiscoverRepository: DiscoverRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getMovieData(page: String, completion: @escaping (Result<DiscoverData, Error>) -> Void) {
        networkEngine.request(endpoint: DiscoverEndpoint.getData(page: page), completion: completion)
    }
    
}
