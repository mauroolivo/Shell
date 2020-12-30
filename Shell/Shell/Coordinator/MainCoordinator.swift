import UIKit
import SwiftUI

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension MainCoordinator {
    func start() {
        let view = Welcome(showLogin: {[weak self] in self?.showLogin()})
        let vc = HostController(rootView: view)
        push(vc)
    }
    
    func showLogin() {
        let view = Login(onLogin: {}, onInfo: {[weak self] in self?.showInfo()})
        let vc = HostController(rootView: view)
        push(vc)
    }
    
    func showInfo() {
        let view = Info(onRight: {[weak self] in self?.dismiss()})
        let vc = HostController(rootView: view)
        present(vc)
    }
}


