//
//  SceneDelegate.swift
//  Shell
//
//  Created by Mauro Olivo on 29/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        
        let navController = NavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }

}

