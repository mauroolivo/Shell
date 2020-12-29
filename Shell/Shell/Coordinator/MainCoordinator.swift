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
        let view = Welcome()
        let vc = HostController(rootView: view)
        navigationController.pushViewController(vc, animated: true)
    }
}


