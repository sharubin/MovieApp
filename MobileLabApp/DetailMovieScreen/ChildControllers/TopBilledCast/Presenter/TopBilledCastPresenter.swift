//
//  TopBilledCastPresenter.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 29.03.2022.
//

import Foundation

protocol TopBilledCastPresenterProtocol: AnyObject {
    func getCastData()
}

class TopBilledCastPresenter {
    weak private var view: TopBilledCastViewProtocol?
    let repository: TopBilledCastRepositoryProtocol
    let id: Int

    init(id: Int, view: TopBilledCastViewProtocol, repository: TopBilledCastRepositoryProtocol = TopBilledCastRepository()) {
        self.view = view
        self.repository = repository
        self.id = id
    }
}

extension TopBilledCastPresenter: TopBilledCastPresenterProtocol {
    func getCastData() {
        repository.getCastData(id: id) { result in
            switch result {
            case .success(let data):
                self.view?.setData(data: data.cast)
            case .failure(let error):
                print(error)
            }
        }
    }
}
