import SwiftUI
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

	// MARK: - Properties

	var window: UIWindow?
}


extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)
        -> Bool
    {
		application.isIdleTimerDisabled = true

        let rootView = NavigationView {
            MenuView()
        }

        let window = UIWindow()
        window.rootViewController = UIHostingController(rootView: rootView)
        window.makeKeyAndVisible()
        self.window = window

		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		application.isIdleTimerDisabled = true
	}
}
