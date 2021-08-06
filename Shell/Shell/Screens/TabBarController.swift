import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = ColorsOld.uiBg
        tabBar.isTranslucent = false
        tabBar.tintColor = ColorsOld.uiAccent
        tabBar.unselectedItemTintColor = ColorsOld.uiText
        tabBar.clipsToBounds = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

