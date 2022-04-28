//
//  TrailersRepository.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 18.03.2022.
//

import Foundation

protocol TrailersRepositoryProtocol {
    func getData(category: Category, completion: @escaping (Result<[VideoCellModel], Error>) -> Void)
}

class TrailersRepository: TrailersRepositoryProtocol {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getMovieData(category: Category ,completion: @escaping (Result<MovieData, Error>) -> Void) {
        networkEngine.request(endpoint: CategoryEndpoint.getMovieData(category: category), completion: completion)
    }
    
    func getData(category: Category, completion: @escaping (Result<[VideoCellModel], Error>) -> Void) {
        var movieInfo = [MovieDataResult]()
        var videoInfo = [VideoData]()
        var videoCellModel = [VideoCellModel]()
        let group = DispatchGroup()
        getMovieData(category: category) { result in
            switch result {
            case .success(let data):
                movieInfo = data.results
                movieInfo.forEach {
                    group.enter()
                    self.getVideoData(id: $0.id) {result in
                        switch result {
                        case .success(let data):
                            videoInfo.append(data)
                        case .failure(let error):
                            print(error)
                        }
                        group.leave()
                    }
                 }
                group.notify(queue: .main) {
                    for index in 0 ..< videoInfo.count {
                        if index >= movieInfo.count { return }
                        if !videoInfo[index].results.isEmpty {
                            videoCellModel.append(VideoCellModel(movieName: movieInfo[index].title, image: movieInfo[index].backdropPath ?? "", videoId: videoInfo[index].results[0].key))
                        }
                        completion(.success(videoCellModel))
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    func getVideoData(id: Int, completion: @escaping (Result<VideoData, Error>) -> Void) {
        networkEngine.request(endpoint: VideoEndpoint.getMovieData(id: id), completion: completion)
    }
    
}
