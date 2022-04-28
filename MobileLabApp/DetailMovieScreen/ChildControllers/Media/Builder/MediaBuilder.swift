//
//  MediaBuilder.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 31.03.2022.
//

import Foundation

struct MediaBuilder {
    func build(id: Int) -> MediaViewController {
        let view = MediaViewController()
        let presenter = MediaPresenter(id: id, view: view)
        view.presenter = presenter
        
        return view
    }
}
