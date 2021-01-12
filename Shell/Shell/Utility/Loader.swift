//
//  Loader.swift
//  Shell
//
//  Created by Mauro Olivo on 11/01/21.
//

import UIKit

class LoaderView: UIView {
    
}

class Loader {
    
//    https://medium.com/@alexxjk_mar/blurring-app-screen-in-ios-multitasking-switcher-ea5bb3eedcd5
    
    static func show() {
        
        let loader = LoaderView()
        loader.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        loader.backgroundColor = .black
        loader.alpha = 0.0
        
        let view = UIActivityIndicatorView()
        view.color = .white
        view.center = loader.center
        view.style = .large
        loader.addSubview(view)
        view.startAnimating()
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(loader)
        UIView.animate(withDuration: 0.2) {
            loader.alpha = 0.6
              }
    }
    
    static func hide() {
        if let loader = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.subviews.filter({ $0 is LoaderView}).first {

            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
                loader.alpha = 0.0
            }, completion: { finished in
                loader.removeFromSuperview()
            })
            
//            loader.removeFromSuperview()
        }
    }
}
