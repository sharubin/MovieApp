//
//  DetailContainerViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.03.2022.
//

import UIKit

class DetailContainerViewController: UIViewController {

    private var rootView: DetailContainerView {
        self.view as! DetailContainerView
    }
    private let id: Int
    
    override func loadView() {
        super.loadView()
    
        self.view = DetailContainerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
    }
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addChildViewControllers() {
        let overviewViewController = OverviewViewController(id: id)
        overviewViewController.delegate = self
        addChild(overviewViewController)
        rootView.addView(view: overviewViewController.rootView)
        overviewViewController.didMove(toParent: self)
        
        let topBilledCastViewController = TopBildCastBuilder().build(id: id)
        topBilledCastViewController.delegate = self
        addChild(topBilledCastViewController)
        rootView.addView(view: topBilledCastViewController.rootView)
        topBilledCastViewController.didMove(toParent: self)
        
        let mediaViewController = MediaBuilder().build(id: id)
        mediaViewController.delegate = self
        addChild(mediaViewController)
        rootView.addView(view: mediaViewController.rootView)
        mediaViewController.didMove(toParent: self)
        
        let recommendationsViewController = RecommendationsViewController(id: id)
        recommendationsViewController.delegate = self
        addChild(recommendationsViewController)
        rootView.addView(view: recommendationsViewController.rootView)
        recommendationsViewController.didMove(toParent: self)
    }

}
