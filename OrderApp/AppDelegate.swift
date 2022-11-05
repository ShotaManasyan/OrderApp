//
//  AppDelegate.swift
//  OrderApp
//
//  Created by Shota Manasyan on 01.11.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let temporaryDirectory = NSTemporaryDirectory()
        let _ = URLCache(
            memoryCapacity: 25_000_000, 
            diskCapacity: 50_000_000, 
            diskPath: temporaryDirectory)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
 
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication, 
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
    }


}

