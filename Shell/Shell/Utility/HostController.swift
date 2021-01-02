import SwiftUI
import UIKit

class HostController <Content>: UIHostingController<AnyView> where Content : View {
    
    public init(rootView: Content, navigationBarHidden: Bool = true) {
        super.init(rootView: AnyView(rootView.navigationBarHidden(navigationBarHidden)))
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit { print("deinit \(self.classForCoder)") }
}
