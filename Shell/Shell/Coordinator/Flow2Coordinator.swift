import UIKit
import SwiftUI

class Flow2Coordinator: NSObject, Coordinator {
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
        let view = Account(onPrivacy: {[weak self] in self?.showPrivacy()},
                           onLangChange: {[weak self] in self?.showLanguage()},
                           onCloseTab: {[weak self] in self?.onCloseTab()})
        let vc = HostController(rootView: view)
        vc.tabBarItem = UITabBarItem(title: "tabbar.account".localized(),
                                     image: UIImage(systemName: "person.fill"),
                                     tag: 1)
        navigationController.viewControllers = [vc]
    }
 
    func showPrivacy() {
        let view = Privacy(onLeft: {[weak self] in self?.pop()})
        let vc = HostController(rootView: view)
        push(vc)
    }
    
    func showLanguage() {
        let view = Language(onLeft: {[weak self] in self?.pop()},
                            onLangChange: {[weak self] in self?.onLangChange()})
        let vc = HostController(rootView: view)
        push(vc)
    }
    
    func onCloseTab() {
        if let parent = parentCoordinator as? MainCoordinator {
            parent.onCloseTab()
        }
    }
    
    func onLangChange() {
        if let parent = parentCoordinator as? MainCoordinator {
            parent.onLangChange()
        }
    }
}
