import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  //    var coordinator: MainCoordinator?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    //        guard let windowScene = scene as? UIWindowScene else { return }
    //
    //        let navController = NavigationController()
    //        coordinator = MainCoordinator(navigationController: navController)
    //        coordinator?.start()
    //
    //        let window = UIWindow(windowScene: windowScene)
    //        window.rootViewController = navController
    //        self.window = window
    //        window.makeKeyAndVisible()
    
    let contentView = HomeView()
    
    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: contentView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }
  
}

