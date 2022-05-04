//
//  HeaderActorBuilder.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 07.04.2022.
//

import Foundation

struct HeaderActorBuilder {
    func build(id: Int) -> HeaderActorsViewController {
        let view = HeaderActorsViewController()
        let presenter = HeaderActorPresenter(id: id, view: view)
        view.presenter = presenter

        return view
    }
}
