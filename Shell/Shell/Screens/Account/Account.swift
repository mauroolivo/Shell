import SwiftUI

struct Account: View {
        
    var onPrivacy: (() -> Void)
    var onLangChange: (() -> Void)
    var onCloseTab: (() -> Void)
    
    var body: some View {
        ZStack
        {
          ColorsOld.bg.edgesIgnoringSafeArea(.all)
            VStack {
                TopBar(title: "account.title".localized())
                ScrollView {
                    
                    SimpleCell(lbl: "account.show.privacy".localized(), hideRight: false, onTap: onPrivacy)
                    SimpleCell(lbl: "account.show.language".localized(), hideRight: false, onTap: onLangChange)
                    SimpleCell(lbl: "account.back.welcome".localized(), onTap: onCloseTab)
                }
            }
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(onPrivacy: {}, onLangChange: {}, onCloseTab: {})
    }
}
