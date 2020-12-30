//
//  Info.swift
//  Shell
//
//  Created by Mauro Olivo on 30/12/20.
//

import SwiftUI

struct Info: View {
    
    var onRight: (() -> Void)
    
    var body: some View {
        VStack {
            TopBar(title: "Info", hideRight: false, onRight: onRight, imgRight:Image(systemName: "xmark"))
            Spacer()
        }
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info(onRight: {})
    }
}
