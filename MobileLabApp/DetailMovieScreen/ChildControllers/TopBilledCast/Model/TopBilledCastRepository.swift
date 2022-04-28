//
//  TopBilledCastRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 29.03.2022.
//

import Foundation

protocol TopBilledCastRepositoryProtocol {
    func getCastData(id: Int, completion: @escaping (Result<CrewData, Error>) -> Void)
}

class TopBilledCastRepository: TopBilledCastRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getCastData(id: Int, completion: @escaping (Result<CrewData, Error>) -> Void) {
        networkEngine.request(endpoint: CrewEndpoint.getCrewData(id: id), completion: completion)
    }
    
}
