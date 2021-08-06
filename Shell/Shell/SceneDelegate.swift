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
    
    let uis = UITraitCollection.current.userInterfaceStyle
    var colorScheme: ColorScheme?
    var systemColorScheme: ColorScheme?
    switch UserDefaults.standard.theme.userInterfaceStyle {
    case .dark:
      colorScheme = .dark
    case .light:
      colorScheme = .light
    default:
      switch uis {
      case .dark:
        colorScheme = .dark
      default:
        colorScheme = .light
      }
    }
    switch uis {
    case .dark:
      systemColorScheme = .dark
    default:
      systemColorScheme = .light
    }
    
    UITableView.appearance().backgroundColor = Color(.bg).uiColor()
    UITableViewCell.appearance().backgroundColor = Color(.bg).uiColor()
    UITableView.appearance().tableFooterView = UIView()
    
    let contentView = HomeView(theColorScheme: colorScheme!, systemColorScheme: systemColorScheme!)
    
    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: contentView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }
  
}

