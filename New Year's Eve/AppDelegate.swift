//
//  AppDelegate.swift
//  New Year's Eve
//
//  Created by Sam Soffes on 12/31/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    // MARK: - Properties
    
	var window: UIWindow?
    
    
    // MARK: - Private
    
    private func configureAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Georgia", size: 18)!,
            NSForegroundColorAttributeName: UIColor.blackColor()
        ]
    }
    
    private func configureSplitViewController() {
        if let splitViewController = window?.rootViewController as? UISplitViewController {
            splitViewController.delegate = self
            if let navigationController = splitViewController.viewControllers.last as? UINavigationController {
                navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
            }
        }
    }

    
    // MARK: - UIApplicationDelegate

	func application(application: UIApplication, didFinishLaunchingWithOptions options: [NSObject: AnyObject]?) -> Bool {
        configureAppearance()
        configureSplitViewController()
		return true
	}


	// MARK: - Split view

	func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController!, ontoPrimaryViewController primaryViewController:UIViewController!) -> Bool {
	    if let secondaryAsNavController = secondaryViewController as? UINavigationController {
	        if let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController {
	            if topAsDetailController.detailItem == nil {
	                // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
	                return true
	            }
	        }
	    }
	    return false
	}

}

