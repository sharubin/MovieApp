//
//  ActingBuilder.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 16.04.2022.
//

import Foundation

struct ActingBuilder {
    func build(id: Int) -> ActingViewController {
        let view = ActingViewController()
        let presenter = ActingPresenter(id: id, view: view)
        view.presenter = presenter

        return view
    }
}
