import SwiftUI
import UIKit

class HostController <Content>: UIHostingController<AnyView> where Content : View {
    
    public init(rootView: Content) {
        super.init(rootView: AnyView(rootView.navigationBarHidden(true)))
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit { print("deinit \(self.classForCoder)") }
}
