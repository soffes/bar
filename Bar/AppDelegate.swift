//
//  AppDelegate.swift
//  Bar
//
//  Created by Sam Soffes on 6/27/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

	// MARK: - Properties

	var window: UIWindow? = {
		let window = UIWindow()
		window.tintColor = UIColor(displayP3Red: 1, green: 0.27, blue: 0.21, alpha: 1)

		let viewController = UINavigationController(rootViewController: MenuViewController())
        viewController.navigationBar.prefersLargeTitles = true
		viewController.navigationBar.barStyle = .blackTranslucent
        window.rootViewController = viewController
        
		return window
	}()
}


extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)
        -> Bool
    {
		application.isIdleTimerDisabled = true
		window?.makeKeyAndVisible()
		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		application.isIdleTimerDisabled = true
	}
}
