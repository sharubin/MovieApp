//
//  MediaRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 31.03.2022.
//

import Foundation

protocol MediaRepositoryProtocol {
    func getImageData(id: Int,completion: @escaping (Result<MediaImageData, Error>) -> Void)
    func getVideoData(id: Int, completion: @escaping (Result<VideoData, Error>) -> Void)
}

class MediaRepository: MediaRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getImageData(id: Int,completion: @escaping (Result<MediaImageData, Error>) -> Void) {
        networkEngine.request(endpoint: ImageEndpoint.getImageData(id: id), completion: completion)
    }
    
    func getVideoData(id: Int, completion: @escaping (Result<VideoData, Error>) -> Void) {
        networkEngine.request(endpoint: VideoEndpoint.getMovieData(id: id), completion: completion)
    }
    
}
