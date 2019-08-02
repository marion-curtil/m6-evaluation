//
//  AppDelegate.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 30/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewControllerProvider.root
        window?.makeKeyAndVisible()

        return true
    }
}
