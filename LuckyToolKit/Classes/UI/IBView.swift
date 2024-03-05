//
//  XIBButton.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2024/3/4.
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
            setBackgroundImage(UIImage(color: bgColorForSelected), for: .normal)
        }
    }
    
    @IBInspectable var bgColorForDisable: UIColor = .clear {
        didSet {
            setBackgroundImage(UIImage(color: bgColorForDisable), for: .normal)
        }
    }
    
    @IBInspectable var titleColorForNormal: UIColor = .white {
        didSet {
            setTitleColor(titleColorForNormal, for: .normal)
        }
    }
    
    @IBInspectable var titleColorForDisable: UIColor = .white {
        didSet {
            setTitleColor(titleColorForDisable, for: .normal)
        }
    }
    
    @IBInspectable var titleColorForSelected: UIColor = .white {
        didSet {
            setTitleColor(titleColorForSelected, for: .normal)
        }
    }
    
    
    @IBInspectable var titleForNormal: String = "" {
        didSet {
            setTitle(titleForNormal, for: .normal)
        }
    }
    
    @IBInspectable var titleForDisable: String = "" {
        didSet {
            setTitle(titleForDisable, for: .disabled)
        }
    }
    
    @IBInspectable var titleForSelected: String = "" {
        didSet {
            setTitle(titleForSelected, for: .selected)
        }
    }
    
    @IBInspectable var imageForNoraml: UIImage? {
        didSet {
            setImage(imageForNoraml, for: .normal)
        }
    }
    
    @IBInspectable var imageForSelected: UIImage? {
        didSet {
            setImage(imageForSelected, for: .normal)
        }
    }
    
    @IBInspectable var imageForDisable: UIImage? {
        didSet {
            setImage(imageForDisable, for: .normal)
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


