//
//  OverviewRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.03.2022.
//

import Foundation

protocol OverviewRepositoryProtocol {
    func getMovieData(id: Int, completion: @escaping (Result<DetailMovieData, Error>) -> Void)
    func getVideoData(id: Int, completion: @escaping (Result<VideoData, Error>) -> Void)
    func getCrewData(id: Int, completion: @escaping (Result<CrewData, Error>) -> Void)
}

class OverviewRepository: OverviewRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getMovieData(id: Int, completion: @escaping (Result<DetailMovieData, Error>) -> Void) {
        networkEngine.request(endpoint: DetailMovieEndpoint.getMovieData(id: id), completion: completion)
    }
    
    func getVideoData(id: Int, completion: @escaping (Result<VideoData, Error>) -> Void) {
        networkEngine.request(endpoint: VideoEndpoint.getMovieData(id: id), completion: completion)
    }
    
    func getCrewData(id: Int, completion: @escaping (Result<CrewData, Error>) -> Void) {
        networkEngine.request(endpoint: CrewEndpoint.getCrewData(id: id), completion: completion)
    }
    
}
