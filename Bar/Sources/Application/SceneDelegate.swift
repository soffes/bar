import UIKit
import SwiftUI

final class SceneDelegate: UIResponder {

    // MARK: - Properties

    var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        let data = try! Data(contentsOf: Bundle.main.url(forResource: "Menu", withExtension: "json")!)
        let menu = try! JSONDecoder().decode([MenuSection].self, from: data)

        let view = NavigationView {
            MenuView(sections: menu)
        }

        let window = UIWindow(windowScene: windowScene)
        window.tintColor = UIColor(displayP3Red: 1, green: 0.27, blue: 0.21, alpha: 1)
        window.rootViewController = UIHostingController(rootView: view)
        self.window = window
        window.makeKeyAndVisible()
    }
}
