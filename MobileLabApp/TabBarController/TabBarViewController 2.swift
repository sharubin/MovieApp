//
//  TabBarViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let containerViewController = UINavigationController(rootViewController: ContainerViewController().then {
        $0.title = Strings.TabBarController.home
        $0.tabBarItem.image = UIImage(named: "circle")
    })
    
    let discoverViewController = UINavigationController(rootViewController: DiscoverBuilder().build().then {
        $0.title = Strings.TabBarController.discover
        $0.tabBarItem.image = UIImage(named: "circle")
    })

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        self.setViewControllers([containerViewController, discoverViewController], animated: true)
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tabBar.frame = CGRect(x: 0, y: view.safeAreaInsets.bottom + (navigationController?.navigationBar.frame.height ?? 0), width: view.frame.width, height: 50)
    }
}
