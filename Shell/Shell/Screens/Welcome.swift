import SwiftUI
import Localize_Swift

struct Welcome: View {
    
    var showTabBar: (() -> Void)
    var onRight: (() -> Void)
    
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                TopBar(title: "welcome.enter".localized(), hideLeft: true, hideRight: false, onRight: onRight)
                    .foregroundColor(Colors.text)
                Spacer()
                Button(action: showTabBar, label: {
                    Text("generic.enter".localized())
                        .foregroundColor(Colors.accent)
                })
                Spacer()
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome(showTabBar: {}, onRight: {})
    }
}
