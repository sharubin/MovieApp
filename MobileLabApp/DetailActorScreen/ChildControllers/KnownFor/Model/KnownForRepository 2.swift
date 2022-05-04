//
//  KnownForRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.04.2022.
//

import Foundation

protocol KnownForRepositoryProtocol {
    func getKnownForData(id: Int, completion: @escaping (Result<KnownForData, Error>) -> Void)
}

class KnownForRepository: KnownForRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getKnownForData(id: Int, completion: @escaping (Result<KnownForData, Error>) -> Void) {
        networkEngine.request(endpoint: KnownForEndpoint.getKnownForData(id: id), completion: completion)
    }
    
}
