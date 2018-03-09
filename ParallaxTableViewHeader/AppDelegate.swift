//
//  AppDelegate.swift
//  ParallaxTableViewHeader
//
//  Created by Mohammed Ennabah on 09/03/2018.
//  Copyright © 2018 Mohammed Ennabah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        
        return true
    }

}
