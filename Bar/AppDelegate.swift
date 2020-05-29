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

        let window = UIWindow()
        window.tintColor = UIColor(displayP3Red: 1, green: 0.27, blue: 0.21, alpha: 1)

        let viewController = UINavigationController(rootViewController: MenuViewController())
        viewController.navigationBar.prefersLargeTitles = true
        viewController.navigationBar.barStyle = .black
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window

		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		application.isIdleTimerDisabled = true
	}
}
