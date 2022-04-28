//
//  RecommendationsRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 01.04.2022.
//

import Foundation

protocol RecommendationsRepositoryProtocol {
    func getRecommendationsData(id: Int,completion: @escaping (Result<RecommendationData, Error>) -> Void)
}

class RecommendationsRepository: RecommendationsRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getRecommendationsData(id: Int,completion: @escaping (Result<RecommendationData, Error>) -> Void) {
        networkEngine.request(endpoint: RecommendationsEndpoint.getRecommendationsData(id: id), completion: completion)
    }
    
}
