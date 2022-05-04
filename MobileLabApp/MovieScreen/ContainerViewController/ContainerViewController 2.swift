//
//  ContainerViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 03.03.2022.
//

import UIKit

class ContainerViewController: UIViewController {

    private var rootView: ContainerScreenView {
        self.view as! ContainerScreenView
    }
    private var isAdded = false
    
    override func loadView() {
    
        self.view = ContainerScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
    }
    
    private func addChildViewControllers() {
        for category in Category.allCases {
            let categoryViewController = CategoryViewController(category: category)
            categoryViewController.delegate = self
            addChild(categoryViewController)
            rootView.addView(view: categoryViewController.rootView, size: 350)
            categoryViewController.didMove(toParent: self)
            if !isAdded {
                let vc = TrailersViewController()
                vc.delegate = self
                addChild(vc)
                rootView.addView(view: vc.rootView, size: 350)
                isAdded = true
            }
        }
        let actorsViewController = ActorsViewController()
        actorsViewController.delegate = self
        addChild(actorsViewController)
        rootView.addView(view: actorsViewController.rootView, size: 2050)
        actorsViewController.didMove(toParent: self)
    }
}
