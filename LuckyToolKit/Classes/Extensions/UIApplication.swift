//
//  UIApplication.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/2.
//

import UIKit


extension UIApplication {
    
    public static var safeAreaInset: UIEdgeInsets {
        var sa = UIEdgeInsets.zero
        guard let delegate = UIApplication.shared.delegate,
              let window = delegate.window,
              let window = window
        else { return sa }
        return window.safeAreaInsets
    }
}
