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

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: Text("hi"))
        self.window = window
        window.makeKeyAndVisible()
    }
}
