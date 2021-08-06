//
//  Components.swift
//  Shell
//
//  Created by Mauro Olivo on 30/12/20.
//

import SwiftUI

struct Components: View {
    
    var onCart: (() -> Void)
    var onComponentDetail: ((Int) -> Void)
    
    var body: some View {
        ZStack
        {
          ColorsOld.bg.edgesIgnoringSafeArea(.all)
            VStack {
                Text("components.title".localized())
                    .foregroundColor(ColorsOld.text)
                Spacer()
                Button(action: onCart, label: {
                    Text("components.show.cart".localized())
                        .foregroundColor(ColorsOld.accent)
                })
                Button(action: { onComponentDetail(2) } , label: {
                    
                    Text("components.show.fullscreen".localized())
                        .foregroundColor(ColorsOld.accent)
                })
                Button(action: {
                    Loader.show()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        Loader.hide()
                    }
                }, label: {
                    Text("show loader")
                })
                Spacer()
            }

        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components(onCart: {}, onComponentDetail: { _ in })
    }
}
