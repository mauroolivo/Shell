import SwiftUI

struct ComponentDetail: View {
    
    var onLeft: (() -> Void)
    
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                TopBar(title: "about.title".localized(),
                       hideLeft: false,
                       onLeft: onLeft
                       )
                Spacer()
            }
        }
    }
}

struct ComponentDetail_Previews: PreviewProvider {
    static var previews: some View {
        ComponentDetail(onLeft: {})
    }
}
