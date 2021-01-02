import SwiftUI

struct Account: View {
    
    var onPrivacy: (() -> Void)
    var onCloseTab: (() -> Void)
    
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
                Button(action: onCloseTab, label: {
                    Text("Back to welcome")
                        .foregroundColor(Colors.accent)
                })
                Spacer()
            }
            
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(onPrivacy: {}, onCloseTab: {})
    }
}
