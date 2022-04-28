//
//  MovieScreenRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 05.03.2022.
//

import Foundation

protocol MovieScreenRepositoryProtocol {
    func getData(category: Category, completion: @escaping (Result<[MovieCellModel], Error>) -> Void)
    func getVideoData(id: Int, completion: @escaping (Result<VideoData, Error>) -> Void)
}

class MovieScreenRepository: MovieScreenRepositoryProtocol {
    private let networkEngine: NetworkEngine

    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }

    func getMovieData(category: Category ,completion: @escaping (Result<MovieData, Error>) -> Void) {
        networkEngine.request(endpoint: CategoryEndpoint.getMovieData(category: category), completion: completion)
    }
    
    func getData(category: Category, completion: @escaping (Result<[MovieCellModel], Error>) -> Void) {
        var cellModels = [MovieCellModel]()
        getMovieData(category: category) { result in
            switch result {
            case .success(let data):
                cellModels = data.results.map { MovieCellModel(model: $0) }
                completion(.success(cellModels))
            case .failure(let error):
                print(error)
            }
        }
    }
        func getVideoData(id: Int, completion: @escaping (Result<VideoData, Error>) -> Void) {
            networkEngine.request(endpoint: VideoEndpoint.getMovieData(id: id), completion: completion)
        }
}
