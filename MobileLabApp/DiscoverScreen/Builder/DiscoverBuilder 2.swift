//
//  DiscoverBuilder.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 26.04.2022.
//

import Foundation

struct DiscoverBuilder {
    func build() -> DiscoverViewController {
        let view = DiscoverViewController()
        let presenter = DiscoverPresenter(view: view)
        view.presenter = presenter

        return view
    }
}
