//
//  AppDelegate.swift
//  Bird_Fc
//
//  Created by Thinh Nguyen on 12/12/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().tintColor = UIColor.white
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeVC = HomeViewController()
        let homeNav = BaseNavigationController(rootViewController: homeVC)
        if let window = self.window {
            window.rootViewController = homeNav
            window.makeKeyAndVisible()
        }
        return true
    }

   


}

