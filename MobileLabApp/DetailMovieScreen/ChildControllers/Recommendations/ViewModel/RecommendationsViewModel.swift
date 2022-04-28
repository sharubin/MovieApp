//
//  RecommendationsViewModel.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 02.04.2022.
//

import Foundation

class RecommendationsViewModel {
    
    var repository: RecommendationsRepositoryProtocol?
    
    var dataSource = [RecommendationDataResult]() {
        didSet {
            dataSourceHandler?(dataSource)
        }
    }
    
    var id: Int
    
    var dataSourceHandler: (([RecommendationDataResult]) -> Void)?
    
    init(id: Int, repository: RecommendationsRepositoryProtocol = RecommendationsRepository()) {
        self.repository = repository
        self.id = id
    }
    
    func getRecommendationsData() {
        repository?.getRecommendationsData(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.dataSource = data.results
            case .failure(let error):
                print(error)
            }
        }
    }
}
