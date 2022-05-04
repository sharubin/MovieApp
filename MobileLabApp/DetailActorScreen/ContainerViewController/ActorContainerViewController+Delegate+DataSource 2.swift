//
//  ActorContainerViewController+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 11.04.2022.
//

import Foundation

extension ActorContainerViewController: PresentDetailScreenContainerDelegate {
    func presentDetailContainerController(id: Int) {
        let detailController = DetailContainerViewController(id: id)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
