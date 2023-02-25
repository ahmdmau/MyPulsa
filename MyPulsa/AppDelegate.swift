//
//  AppDelegate.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

