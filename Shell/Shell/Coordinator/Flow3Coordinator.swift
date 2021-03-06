import UIKit
import SwiftUI

class Flow3Coordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: NavigationController
    
    weak var parentCoordinator: Coordinator?
    
    var onComplete: ((Coordinator) -> Void)?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    deinit { print("deinit \(self.classForCoder)") }
    
    func start() {
        let view = Cart()
        let vc = HostController(rootView: view)
        vc.tabBarItem = UITabBarItem(title: "tabbar.cart".localized(),
                                     image: UIImage(systemName: "cart.fill"),
                                     tag: 2)
        navigationController.viewControllers = [vc]
    }
    
}
