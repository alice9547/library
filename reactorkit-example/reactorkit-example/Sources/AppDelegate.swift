//
//  AppDelegate.swift
//  reactorkit-example
//
//  Created by sogihyeon on 2020/04/20.
//  Copyright © 2020 statios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        
        let viewController = MainViewController()
        window.rootViewController = viewController

        self.window = window
        return true
        
        return true
    }
    
}

