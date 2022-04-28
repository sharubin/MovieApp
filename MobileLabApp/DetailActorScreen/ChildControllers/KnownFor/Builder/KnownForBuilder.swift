//
//  KnownForBuilder.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 11.04.2022.
//

import Foundation

struct KnownForBuilder {
    func build(id: Int) -> KnownForViewController {
        let view = KnownForViewController()
        let presenter = KnownForPresenter(id: id, view: view)
        view.presenter = presenter

        return view
    }
}
