//
//  KnownForPresenter.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 11.04.2022.
//

import Foundation

protocol KnownForPresenterProtocol: AnyObject {
    func getData()
}

class KnownForPresenter {
    weak private var view: KnownForViewProtocol?
    let repository: KnownForRepositoryProtocol
    let id: Int

    init(id: Int, view: KnownForViewProtocol, repository: KnownForRepositoryProtocol = KnownForRepository()) {
        self.view = view
        self.repository = repository
        self.id = id
    }
}

extension KnownForPresenter: KnownForPresenterProtocol {
    func getData() {
        repository.getKnownForData(id: id) { result in
            switch result {
            case .success(let data):
                self.view?.setData(data: data.cast)
            case .failure(let error):
                print(error)
            }
        }
    }
}
