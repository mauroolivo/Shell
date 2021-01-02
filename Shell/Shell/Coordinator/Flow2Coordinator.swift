import UIKit
import SwiftUI

class Flow2Coordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: NavigationController
    
    weak var parentCoordinator: Coordinator?
    
    var onComplete: ((Coordinator) -> Void)?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    deinit { print("deinit \(self.classForCoder)") }
    
    func start() {
        let view = Account(onPrivacy: {[weak self] in self?.showPrivacy()})
        let vc = HostController(rootView: view)
        vc.tabBarItem = UITabBarItem(title: "Account",
                                     image: UIImage(systemName: "person.fill"),
                                     tag: 1)
        navigationController.viewControllers = [vc]
    }
 
    func showPrivacy() {
        let view = Privacy()
        let vc = HostController(rootView: view, navigationBarHidden: false)
        vc.title = "Privacy"
        push(vc)
    }
}
