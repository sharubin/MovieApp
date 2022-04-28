//
//  DetailContainer+Delegate.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 27.03.2022.
//

import Foundation

extension DetailContainerViewController: PresentPlayerControllerDelegate {
    func presentPlayerController(id: String) {
        let playerController = PlayerViewController(id: id)
        playerController.modalTransitionStyle = .flipHorizontal
        self.present(playerController, animated: true, completion: nil)
    }
}

extension DetailContainerViewController: PresentDetailScreenContainerDelegate {
    func presentDetailContainerController(id: Int) {
        let detailController = DetailContainerViewController(id: id)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}

extension DetailContainerViewController: PresentActorDetailScreenContainerDelegate {
    func presentActorDetailScreenContainerDelegate(id: Int) {
        let detailController = ActorContainerViewController(id: id)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
