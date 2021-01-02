import SwiftUI

struct Account: View {
    
    var onPrivacy: (() -> Void)
    
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                Text("Account")
                    .foregroundColor(Colors.text)
                Spacer()
                Button(action: onPrivacy, label: {
                    Text("Privacy")
                        .foregroundColor(Colors.accent)
                })
                Spacer()
            }
            
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(onPrivacy: {})
    }
}
