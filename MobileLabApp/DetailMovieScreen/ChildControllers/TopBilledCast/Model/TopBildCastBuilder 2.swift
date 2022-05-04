//
//  TopBildCastBuilder.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 30.03.2022.
//

import Foundation

struct TopBildCastBuilder {
    func build(id: Int) -> TopBilledCastViewController {
        let view = TopBilledCastViewController()
        let presenter = TopBilledCastPresenter(id: id, view: view)
        view.presenter = presenter
        
        return view
    }
}
