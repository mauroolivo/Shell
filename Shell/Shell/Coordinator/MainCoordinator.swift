import UIKit
import SwiftUI

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: NavigationController
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
}

extension MainCoordinator {
    func start() {
        let view = Welcome(showTabBar: {[weak self] in self?.showTabBar()}, onRight: {[weak self] in self?.showAbout()})
        let vc = HostController(rootView: view)
        push(vc)
    }

    func showAbout() {
        let view = About(onRight: {[weak self] in self?.dismiss()})
        let vc = HostController(rootView: view)
        present(vc)
    }
    
    func showTabBar() {
        let tabBarController = TabBarController()
        
        let flow1Coordinator = Flow1Coordinator(navigationController: NavigationController())
        flow1Coordinator.parentCoordinator = self
        addChild(coordinator: flow1Coordinator)
        
        let flow2Coordinator = Flow2Coordinator(navigationController: NavigationController())
        flow2Coordinator.parentCoordinator = self
        addChild(coordinator: flow2Coordinator)
        
        let flow3Coordinator = Flow3Coordinator(navigationController: NavigationController())
        flow3Coordinator.parentCoordinator = self
        addChild(coordinator: flow3Coordinator)
        
        childCoordinators.forEach({ $0.start() })
        tabBarController.viewControllers = childCoordinators.map({ $0.navigationController })
        
        /// tabBarController.selectedViewController = flow2Coordinator.navigationController

        navigationController.pushViewController(tabBarController, animated: true)
        
        /// keep after push viewController
        setBedge(value: "3", index: 2)
    }
    
    func selectLastTab() {
        if let tab = navigationController.viewControllers.last as? TabBarController {
            if let vcs = tab.viewControllers {
                tab.selectedIndex = vcs.count - 1
            }
        }
    }
    
    func setBedge(value: String, index: Int) {
        if let tabBarController = navigationController.viewControllers.last as? TabBarController {
            if let vc = tabBarController.viewControllers?[index] {
                vc.tabBarItem.badgeColor = Colors.uiAccent
                vc.tabBarItem.badgeValue = value
            }
        }

    }
    
    func showComponentDetail(_ n: Int) {
        let view = ComponentDetail(onLeft: {[weak self] in self?.pop()})
        let vc = HostController(rootView: view)
        navigationController.hidesBottomBarWhenPushed = true
        push(vc)
    }
    
    func onCloseTab() {
        childCoordinators = []
        if let _ = navigationController.viewControllers.last as? TabBarController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func onLangChange() {
        onCloseTab()
        navigationController.viewControllers = []
        start()
    }
}


