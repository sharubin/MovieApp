//
//  DiscoverPresenter.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 26.04.2022.
//

import Foundation

protocol DiscoverPresenterProtocol: AnyObject {
    func getData()
}

class DiscoverPresenter {
    
    weak private var view: DiscoverViewProtocol?
    
    let repository: DiscoverRepositoryProtocol
    
    var page = 0

    init(view: DiscoverViewProtocol, repository: DiscoverRepositoryProtocol = DiscoverRepository()) {
        self.view = view
        self.repository = repository
    }
}

extension DiscoverPresenter: DiscoverPresenterProtocol {
    
    func getData() {
        loadMoreData(page: self.page)
    }
    
    private func loadMoreData(page: Int) {
        self.page += 1
        repository.getMovieData(page: String(self.page)) { [weak self] result in
            switch result {
            case .success(let data):
                self?.view?.setData(data: data.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
