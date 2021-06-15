//
//  AppDelegate.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}

extension AppDelegate {
    // MARK: Setup root controller
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = AlbumsViewController.create(AlbumsViewModel())
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
