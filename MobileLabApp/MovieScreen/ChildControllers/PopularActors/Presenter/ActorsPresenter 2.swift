//
//  ActorsPresenter.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 23.03.2022.
//

import Foundation

protocol ActorsPresenterProtocol: AnyObject {
    func getMovieData()
}

class ActorsPresenter {
    weak private var view: ActorsViewProtocol?
    private let repository: PopularActorRepositoryProtocol

    init(view: ActorsViewProtocol, repository: PopularActorRepositoryProtocol = PopularActorRepository()) {
        self.view = view
        self.repository = repository
    }
}

extension ActorsPresenter: ActorsPresenterProtocol {

    func getMovieData() {
        repository.getMovieData { result in
            switch result {
            case .success(let data):
                self.view?.setData(data: data.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
