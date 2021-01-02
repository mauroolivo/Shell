//
//  Components.swift
//  Shell
//
//  Created by Mauro Olivo on 30/12/20.
//

import SwiftUI

struct Components: View {
    var body: some View {
        ZStack
        {
            Colors.bg.ignoresSafeArea()
            VStack {
                Text("Components")
                    .foregroundColor(Colors.text)
                Spacer()
            }
            
        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}
