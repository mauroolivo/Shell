//
//  Cart.swift
//  Shell
//
//  Created by Mauro Olivo on 30/12/20.
//

import SwiftUI

struct Cart: View {
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                Text("Cart")
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