//
//  ActorContainerViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 06.04.2022.
//

import UIKit

class ActorContainerViewController: UIViewController {
    
    private var rootView: ActorContainerView {
        self.view as! ActorContainerView
    }
    
    private let id: Int
    
    override func loadView() {
        super.loadView()
    
        self.view = ActorContainerView()
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
        let headerActorsViewController = HeaderActorBuilder().build(id: id)
        addChild(headerActorsViewController)
        rootView.addView(view: headerActorsViewController.rootView)
        headerActorsViewController.didMove(toParent: self)
        
        let knownForViewController = KnownForBuilder().build(id: id)
        knownForViewController.delegate = self
        addChild(knownForViewController)
        rootView.addView(view: knownForViewController.rootView)
        knownForViewController.didMove(toParent: self)
        
        let actingViewController = ActingBuilder().build(id: id)
        addChild(actingViewController)
        rootView.addView(view: actingViewController.rootView)
        actingViewController.didMove(toParent: self)
    }
}
