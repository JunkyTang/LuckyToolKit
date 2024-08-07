//
//  XIBButton.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2022/3/4.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit


public class IBButton: UIButton {
    
    
    
    @IBInspectable var bgColorForNormal: UIColor = .clear {
        didSet {
            setBackgroundImage(UIImage(color: bgColorForNormal), for: .normal)
        }
    }
    
    @IBInspectable var bgColorForSelected: UIColor = .clear {
        didSet {
            setBackgroundImage(UIImage(color: bgColorForSelected), for: .selected)
        }
    }
    
    @IBInspectable var bgColorForDisable: UIColor = .clear {
        didSet {
            setBackgroundImage(UIImage(color: bgColorForDisable), for: .disabled)
        }
    }
    
    @IBInspectable var titleColorForNormal: UIColor = .white {
        didSet {
            setTitleColor(titleColorForNormal, for: .normal)
        }
    }
    
    @IBInspectable var titleColorForSelected: UIColor = .white {
        didSet {
            setTitleColor(titleColorForSelected, for: .selected)
        }
    }
    
    @IBInspectable var titleColorForDisable: UIColor = .white {
        didSet {
            setTitleColor(titleColorForDisable, for: .disabled)
        }
    }
    
    @IBInspectable var titleForNormal: String = "" {
        didSet {
            setTitle(titleForNormal.localString(), for: .normal)
        }
    }
    
    @IBInspectable var titleForDisable: String = "" {
        didSet {
            setTitle(titleForDisable.localString(), for: .disabled)
        }
    }
    
    @IBInspectable var titleForSelected: String = "" {
        didSet {
            setTitle(titleForSelected.localString(), for: .selected)
        }
    }
    
    @IBInspectable var imageForNoraml: UIImage? {
        didSet {
            setImage(imageForNoraml, for: .normal)
        }
    }
    
    @IBInspectable var imageForSelected: UIImage? {
        didSet {
            setImage(imageForSelected, for: .selected)
        }
    }
    
    @IBInspectable var imageForDisable: UIImage? {
        didSet {
            setImage(imageForDisable, for: .disabled)
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    
}



public class IBView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
}

public class IBLabel: UILabel {
    
    @IBInspectable var localizedKey: String = "" {
        didSet {
            text = localizedKey.localString()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
}

public class IBTextField: UITextField {
    
    @IBInspectable var localizedKey: String = "" {
        didSet {
            text = localizedKey.localString()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}

public class IBTextView: UITextView {
    
    @IBInspectable var localizedKey: String = "" {
        didSet {
            text = localizedKey.localString()
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}

public class IBImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}


