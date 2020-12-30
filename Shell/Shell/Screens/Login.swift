import SwiftUI

struct Login: View {
    
    var onLogin: (() -> Void)
    var onInfo: (() -> Void)
    
    var body: some View {
        VStack {
            Text("Login")
            Spacer()
            Button(action: onLogin, label: {
                Text("Login")
            })
            Button(action: onInfo, label: {
                Text("Info")
            })
            Spacer()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(onLogin: {}, onInfo: {})
    }
}
