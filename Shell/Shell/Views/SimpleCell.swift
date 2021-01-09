//
//  SimpleCell.swift
//  Shell
//
//  Created by Mauro Olivo on 08/01/21.
//

import SwiftUI

struct SimpleCell: View {
    var lbl: String
    var hideRight: Bool = true
    var onTap: (() -> Void)
    
    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            VStack {
                HStack {
                    Text(lbl)
                        .foregroundColor(Colors.text)
                        .padding()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Colors.accent)
                        .padding(.trailing)
                        .isHidden(hideRight)
                }
                Divider()
                 .frame(height: 1)
                    .background(Colors.text)
            }
        })
    }
}

struct SimpleCell_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCell(lbl: "Label", onTap: {})
            .previewLayout(.fixed(width: 414, height: 60))
    }
}
