//
//  HeaderActorPresenter.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 07.04.2022.
//

import Foundation

protocol HeaderActorPresenterProtocol: AnyObject {
    func getData()
}

class HeaderActorPresenter {
    weak private var view: HeaderActorsViewProtocol?
    let repository: HeaderActorRepositoryProtocol
    let id: Int

    init(id: Int, view: HeaderActorsViewProtocol, repository: HeaderActorRepositoryProtocol = HeaderActorRepository()) {
        self.view = view
        self.repository = repository
        self.id = id
    }
}

extension HeaderActorPresenter: HeaderActorPresenterProtocol {
    func getData() {
        
        repository.getActorData(id: id) { result in
            switch result {
            case .success(let data):
                self.view?.setActorDetailData(data: data)
            case .failure(let error):
                print(error)
            }
        }
        
        repository.getActorSocialNetworkData(id: id) { result in
            switch result {
            case .success(let data):
                self.view?.setSocialNetworkData(data: data)
            case .failure(let error):
                self.view?.hideButtonIfEmpty()
                print(error)
            }
        }
    }
}
