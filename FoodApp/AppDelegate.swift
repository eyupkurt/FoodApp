//
//  AppDelegate.swift
//  FoodApp
//
//  Created by Eyüp Kurt on 26.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)

        // Create your root view controller
        let rootViewController = HomeViewController()

        // Set the root view controller
        window?.rootViewController = rootViewController

        // Make the window key and visible
        window?.makeKeyAndVisible()
        return true
    }

}

