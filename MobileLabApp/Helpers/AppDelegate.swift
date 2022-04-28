//
//  AppDelegate.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 03.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(rootViewController: TabBarViewController())
        window?.rootViewController = navigationController
        
        return true
    }
}

