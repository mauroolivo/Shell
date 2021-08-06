import SwiftUI

struct Cart: View {
    var body: some View {
        ZStack
        {
          ColorsOld.bg.edgesIgnoringSafeArea(.all)
            VStack {
                Text("cart.title".localized())
                    .foregroundColor(ColorsOld.text)
                Spacer()
            }
            
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
