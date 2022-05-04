//
//  PopularActorRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 21.03.2022.
//

import Foundation

protocol PopularActorRepositoryProtocol {
    func getMovieData(completion: @escaping (Result<ActorData, Error>) -> Void)
}

class PopularActorRepository: PopularActorRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getMovieData(completion: @escaping (Result<ActorData, Error>) -> Void) {
        networkEngine.request(endpoint: ActorEndpoint.getActorData, completion: completion)
    }
    
}
