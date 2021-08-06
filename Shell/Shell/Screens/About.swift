import SwiftUI

struct About: View {
    
    var onRight: (() -> Void)
    
    var body: some View {
        ZStack
        {
          ColorsOld.bg.edgesIgnoringSafeArea(.all)
            VStack {
                TopBar(title: "about.title".localized(), hideRight: false, onRight: onRight, imgRight:Image(systemName: "multiply"))
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
