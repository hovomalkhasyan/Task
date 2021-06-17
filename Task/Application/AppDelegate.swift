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
