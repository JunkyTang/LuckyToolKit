//
//  UIApplication.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/2.
//

import UIKit


public extension UIApplication {
    
    static var safeAreaInset: UIEdgeInsets {
        var sai = UIEdgeInsets.zero
        guard let delegate = UIApplication.shared.delegate,
              let window = delegate.window,
              let window = window
        else { return sai }
        sai = window.safeAreaInsets
        return sai
    }
}
