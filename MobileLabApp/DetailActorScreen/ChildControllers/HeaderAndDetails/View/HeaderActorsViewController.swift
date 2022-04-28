//
//  HeaderActorsViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 06.04.2022.
//

import UIKit

protocol HeaderActorsViewProtocol: AnyObject {
    func setActorDetailData(data: ActorDetailData)
    func setSocialNetworkData(data: ActorSocialNetworkData)
    func hideButtonIfEmpty()
}

class HeaderActorsViewController: UIViewController {
    
    var rootView: HeaderActorView {
        self.view as! HeaderActorView
    }
    
    var socialNetworkDataSource: ActorSocialNetworkData?
    
    var presenter: HeaderActorPresenterProtocol!
    
    override func loadView() {
        super.loadView()
        
        self.view = HeaderActorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.getData()
    }
    
    private func setup() {
        rootView.twitterButton.addTarget(self, action: #selector(twitterButtonTapped), for: .primaryActionTriggered)
        rootView.instagramButton.addTarget(self, action: #selector(instagramButtonTapped), for: .primaryActionTriggered)
    }
    
    @objc private func twitterButtonTapped() {
        guard let twitterURL = URL(string: String(format: Links.twitterLink, socialNetworkDataSource!.twitterID)) else { return }
        UIApplication.shared.open(twitterURL)
    }
    
    @objc private func instagramButtonTapped() {
        guard let instagramURL = URL(string: String(format: Links.instagramLink, socialNetworkDataSource!.instagramID)) else { return }
        UIApplication.shared.open(instagramURL)
    }
    
}

extension HeaderActorsViewController: HeaderActorsViewProtocol {
    func setActorDetailData(data: ActorDetailData) {
        rootView.updatePage(actorData: data)
    }
    
    func setSocialNetworkData(data: ActorSocialNetworkData) {
        socialNetworkDataSource = data
        hideButtonIfEmpty()
    }
    
    func hideButtonIfEmpty() {
        guard let socialNetworkDataSource = socialNetworkDataSource else {
            rootView.instagramButton.isHidden = true
            rootView.twitterButton.isHidden = true
            return
        }
        if socialNetworkDataSource.twitterID.isEmpty {
            rootView.twitterButton.isHidden = true
            return
        }
        if socialNetworkDataSource.instagramID.isEmpty {
            rootView.instagramButton.isHidden = true
            return
        }
    }
}
