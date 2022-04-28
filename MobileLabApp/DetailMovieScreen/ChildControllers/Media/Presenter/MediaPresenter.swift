//
//  MediaPresenter.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 31.03.2022.
//

import Foundation

protocol MediaPresenterProtocol: AnyObject {
    func getData()
}

class MediaPresenter {
    weak private var view: MediaViewProtocol?
    let repository: MediaRepositoryProtocol
    let id: Int

    init(id: Int, view: MediaViewProtocol, repository: MediaRepositoryProtocol = MediaRepository()) {
        self.view = view
        self.repository = repository
        self.id = id
    }
}

extension MediaPresenter: MediaPresenterProtocol {
    func getData() {
        repository.getImageData(id: id) { result in
            switch result {
            case .success(let data):
                self.view?.setImageData(imageData: data)
            case .failure(let error):
                print(error)
            }
        }
        
        repository.getVideoData(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.setVideoData(videoData: data.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
