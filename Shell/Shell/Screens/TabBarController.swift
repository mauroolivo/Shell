import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = Colors.uiBg
        tabBar.isTranslucent = false
        tabBar.tintColor = Colors.uiAccent
        tabBar.unselectedItemTintColor = Colors.uiText
        tabBar.clipsToBounds = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

