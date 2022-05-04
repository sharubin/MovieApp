//
//  ActingRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 12.04.2022.
//

import Foundation

protocol ActingRepositoryProtocol {
    func getData(id: Int, completion: @escaping (Result<ActingData, Error>) -> Void)
}

class ActingRepository: ActingRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getData(id: Int, completion: @escaping (Result<ActingData, Error>) -> Void) {
        networkEngine.request(endpoint: KnownForEndpoint.getKnownForData(id: id), completion: completion)
    }
}
