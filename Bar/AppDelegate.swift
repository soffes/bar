//
//  AppDelegate.swift
//  Bar
//
//  Created by Sam Soffes on 6/27/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

	// MARK: - Properties

	var window: UIWindow? = {
		let window = UIWindow()
		window.tintColor = UIColor(red: 0.8, green: 0.271, blue: 0.216, alpha: 1)

//		let splitViewController = UISplitViewController()
//		splitViewController.viewControllers = [
//			UINavigationController(rootViewController: UIViewController()),
//			UINavigationController(rootViewController: UIViewController())
//		]
//		window.rootViewController = splitViewController

		window.rootViewController = UINavigationController(rootViewController: MenuViewController())
		return window
	}()
}


extension AppDelegate: UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		application.isIdleTimerDisabled = true
		window?.makeKeyAndVisible()
		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		application.isIdleTimerDisabled = true
	}
}
