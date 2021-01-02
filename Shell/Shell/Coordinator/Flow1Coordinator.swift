import UIKit
import SwiftUI

class Flow1Coordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: NavigationController
    
    weak var parentCoordinator: Coordinator?
    
    var onComplete: ((Coordinator) -> Void)?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    deinit { print("deinit \(self.classForCoder)") }
    
    func start() {
        let view = Components(onCart: {[weak self] in self?.showCart()},
                              onComponentDetail: {[weak self] n in self?.showComponentDetail(n)})
        let vc = HostController(rootView: view)
        vc.tabBarItem = UITabBarItem(title: "Components",
                                     image: UIImage(systemName: "circle.grid.hex.fill"),
                                     tag: 0)
        navigationController.viewControllers = [vc]
    }
    
    func showCart() {
        if let parent = parentCoordinator as? MainCoordinator {
            parent.selectLastTab()
        }
    }
    
    func showComponentDetail(_ n: Int) {
        if let parent = parentCoordinator as? MainCoordinator {
            parent.showComponentDetail(n)
        }
    }
    
}
