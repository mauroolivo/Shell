import SwiftUI

struct Welcome: View {
    
    var showTabBar: (() -> Void)
    var onRight: (() -> Void)
    
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                TopBar(title: "Welcome to the Shell app", hideLeft: true, hideRight: false, onRight: onRight)
                    .foregroundColor(Colors.text)
                Spacer()
                Button(action: showTabBar, label: {
                    Text("ENTER")
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
