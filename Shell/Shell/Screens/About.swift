import SwiftUI

struct About: View {
    
    var onRight: (() -> Void)
    
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                TopBar(title: "About", hideRight: false, onRight: onRight, imgRight:Image(systemName: "multiply"))
                Spacer()
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About(onRight: {})
    }
}
