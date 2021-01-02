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
    
//    func showDetail() {
//        let view = Flow1Detail(onLeft: {[weak self] in self?.pop()},
//                               onClose: {[weak self] in self?.onClose()})
//        let vc = HostController(rootView: view)
////        vc.hidesBottomBarWhenPushed = true
//        navigationController.pushViewController(vc, animated: true)
//    }
//    
//    func showTab(_ index: Int) {
//        if let parent = parentCoordinator as? MainCoordinator {
//            parent.nextTab(index)
//        }
//    }
//    
//    func onClose() {
//        if let parent = parentCoordinator as? MainCoordinator {
//            parent.onCloseTab()
//        }
//    }
    
    //    func childEnd() {
    //        pop()
    //        onComplete?(self)
    //    }
    
}
