import SwiftUI

struct Account: View {
        
    var viewModel = AccountViewModel()
    var onPrivacy: (() -> Void)
    var onCloseTab: (() -> Void)
    var onLangChange: (() -> Void)
    
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                Text("account.title".localized())
                    .foregroundColor(Colors.text)
                Spacer()
                Button(action: onPrivacy, label: {
                    Text("account.show.privacy".localized())
                        .foregroundColor(Colors.accent)
                })
                Button(action: onCloseTab, label: {
                    Text("account.back.welcome".localized())
                        .foregroundColor(Colors.accent)
                })
//                Button(action: {
//                    viewModel.langs()
//                }, label: {
//                    Text("Lang")
//                        .foregroundColor(Colors.accent)
//                })
                Button(action: {
                    viewModel.setLang("it")
                    onLangChange()
                }, label: {
                    Text("Italiano")
                        .foregroundColor(Colors.accent)
                })
                Button(action: {
                    viewModel.setLang("en")
                    onLangChange()
                }, label: {
                    Text("English")
                        .foregroundColor(Colors.accent)
                })
                Spacer()
            }
            
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(onPrivacy: {}, onCloseTab: {}, onLangChange: {})
    }
}
