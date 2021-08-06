import SwiftUI
import Localize_Swift

struct Welcome: View {
    
    var showTabBar: (() -> Void)
    var onRight: (() -> Void)
    
    var body: some View {
        ZStack
        {
          ColorsOld.bg.edgesIgnoringSafeArea(.all)
            VStack {
                TopBar(title: "welcome.enter".localized(), hideLeft: true, hideRight: false, onRight: onRight)
                    .foregroundColor(ColorsOld.text)
                Spacer()
                Button(action: showTabBar, label: {
                    Text("generic.enter".localized())
                        .foregroundColor(ColorsOld.accent)
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
