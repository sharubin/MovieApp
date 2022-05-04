//
//  ContainerViewController+Delegate.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 18.03.2022.
//

import UIKit

extension ContainerViewController: TrailersViewControllerDelegate {
    func presentPlayerController(id: String) {
        let playerController = PlayerViewController(id: id)
        playerController.modalTransitionStyle = .flipHorizontal
        self.present(playerController, animated: true, completion: nil)
    }
    
    func presentShareSheetViewController(id: String) {
        let url = URL(string: String(format: Links.videoLink, id))
        let shareSheetViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        parent!.present(shareSheetViewController, animated: true, completion: nil)
    }
}

extension ContainerViewController: PresentDetailScreenContainerDelegate {
    func presentDetailContainerController(id: Int) {
        let detailController = DetailContainerViewController(id: id)
        detailController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ContainerViewController: PresentActorDetailScreenContainerDelegate {
    func presentActorDetailScreenContainerDelegate(id: Int) {
        let detailController = ActorContainerViewController(id: id)
        detailController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
