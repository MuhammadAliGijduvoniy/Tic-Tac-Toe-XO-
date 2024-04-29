//
//  AppDelegate.swift
//  XO_2
//
//  Created by MuhammadAli on 30/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainVCViewController()
        window?.makeKeyAndVisible()

        return true
    }

   
}

