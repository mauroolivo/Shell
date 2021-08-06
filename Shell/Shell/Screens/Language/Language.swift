//
//  Language.swift
//  Shell
//
//  Created by Mauro Olivo on 09/01/21.
//

import SwiftUI

struct Language: View {
    
    var viewModel = LanguageViewModel()
    
    var onLeft: (() -> Void)
    var onLangChange: (() -> Void)
    
    var body: some View {
    
            ZStack
            {
              ColorsOld.bg.edgesIgnoringSafeArea(.all)
                VStack {
                    TopBar(title: "language.title".localized(),
                           hideLeft: false,
                           onLeft: onLeft)
                    ScrollView {
                    ForEach(viewModel.langs(), id: \.self) { lang in
                        if lang != "Base" {
                            
                            if viewModel.currentLang() == lang {
                                SimpleCell(lbl: viewModel.langName(lang), onTap: {})

                            } else {
                                SimpleCell(lbl: viewModel.langName(lang), hideRight: false, onTap: {
                                    viewModel.setLang(lang)
                                    onLangChange()
                                })

                            }
                        }
                    }
                    }
                }
            }
        }
    
}

struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language(onLeft: {}, onLangChange: {})
    }
}
