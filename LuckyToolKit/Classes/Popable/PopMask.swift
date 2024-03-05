//
//  PopMask.swift
//  LuckyUI
//
//  Created by junky on 2024/2/23.
//

import UIKit

public class PopMask: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.init(white: 0, alpha: 0.4)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSelf))
        tap.delegate = self
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    var didTapSelfCallback: () -> Void = {
        
    }
    
    
//    public override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        
//    }
    
    @objc public func didTapSelf() {
        didTapSelfCallback()
    }
    
    public override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        log("PopMask \(safeAreaInsets)")
    }

    
    
}

extension PopMask: XibLoadable {}

extension PopMask: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let touchLocation = touch.location(in: self)
        
        for subV in subviews {
            if subV.frame.contains(touchLocation) {
                return false
            }
        }
        return true
    }
    
}
