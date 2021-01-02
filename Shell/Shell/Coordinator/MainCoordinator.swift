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
        let view = Welcome(showTabBar: {[weak self] in self?.showTabBar()})
        let vc = HostController(rootView: view)
        push(vc)
    }
    
//    func showLogin() {
//        let view = Login(onLogin: {[weak self] in self?.showTabBar()}, onInfo: {[weak self] in self?.showInfo()})
//        let vc = HostController(rootView: view)
//        push(vc)
//    }
//    
//    func showInfo() {
//        let view = Info(onRight: {[weak self] in self?.dismiss()})
//        let vc = HostController(rootView: view)
//        present(vc)
//    }
    
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
        
//        tabBarController.selectedViewController = flow2Coordinator.navigationController
        
        navigationController.pushViewController(tabBarController, animated: true)

    }
}


