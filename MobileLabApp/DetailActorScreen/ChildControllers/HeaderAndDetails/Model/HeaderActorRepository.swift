//
//  HeaderActorRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 06.04.2022.
//

import Foundation

protocol HeaderActorRepositoryProtocol {
    func getActorData(id: Int, completion: @escaping (Result<ActorDetailData, Error>) -> Void)
    func getActorSocialNetworkData(id: Int, completion: @escaping (Result<ActorSocialNetworkData, Error>) -> Void)
}

class HeaderActorRepository: HeaderActorRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getActorData(id: Int, completion: @escaping (Result<ActorDetailData, Error>) -> Void) {
        networkEngine.request(endpoint: ActorDetailEndpoint.getActorData(id: id), completion: completion)
    }
    
    func getActorSocialNetworkData(id: Int, completion: @escaping (Result<ActorSocialNetworkData, Error>) -> Void) {
        networkEngine.request(endpoint: ActorSocialNetworkDataEndpoint.getActorData(id: id), completion: completion)
    }
}
