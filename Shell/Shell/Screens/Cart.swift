import SwiftUI

struct Cart: View {
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                Text("cart.title".localized())
                    .foregroundColor(Colors.text)
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
