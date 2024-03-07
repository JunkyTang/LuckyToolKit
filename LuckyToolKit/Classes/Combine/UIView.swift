//
//  UIView.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/7.
//

import UIKit
import Combine


public extension UIView {
    
    func publisher(gestureRecognizer: UIGestureRecognizer) -> Publishers.UIGestureRecognizerPublisher {
        addGestureRecognizer(gestureRecognizer)
        return gestureRecognizer.publisher()
    }
    
}
