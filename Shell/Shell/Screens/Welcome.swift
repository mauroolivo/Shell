import SwiftUI

struct Welcome: View {
    
    var showLogin: (() -> Void)
    
    var body: some View {
        VStack {
            Text("Welcome to the Shell app")
            Spacer()
            Button(action: showLogin, label: {
                Text("Login")
            })
            Spacer()
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome(showLogin: {})
    }
}
