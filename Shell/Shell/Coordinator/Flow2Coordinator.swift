import UIKit
import SwiftUI

class Flow2Coordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: Coordinator?
    
    var onComplete: ((Coordinator) -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit { print("deinit \(self.classForCoder)") }
    
    func start() {
        let view = Profile()
        let vc = HostController(rootView: view)
        vc.tabBarItem = UITabBarItem(title: "Profile",
                                     image: UIImage(systemName: "person.fill"),
                                     tag: 1)
        navigationController.viewControllers = [vc]
    }
    
}
