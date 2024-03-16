//
//  XIBButton.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2024/3/4.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit


public class IBButton: UIButton {
    
    @objc public enum ImageAlignType: Int {
        case left
        case right
        case top
        case bottom
    }
    
    @IBInspectable public var imageAlign: ImageAlignType = .left
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let imgView = imageView,
              let titleLab = titleLabel
        else {
            return
        }
        
        let imgSize = imgView.bounds.size
        let titleSize = titleLab.bounds.size
        let paddingH = min(imgSize.width, titleSize.width) / 2
        let paddingV = min(imgSize.height, titleSize.height) / 2
        
        switch imageAlign {
        case .left:
            imageEdgeInsets = .zero
            titleEdgeInsets = .zero
            semanticContentAttribute = .forceLeftToRight
        case .right:
            imageEdgeInsets = .zero
            titleEdgeInsets = .zero
            semanticContentAttribute = .forceRightToLeft
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -paddingV, left: paddingH, bottom: paddingV, right: -paddingH)
            titleEdgeInsets = UIEdgeInsets(top: paddingV, left: -paddingH, bottom: -paddingV, right: paddingH)
            semanticContentAttribute = .forceLeftToRight
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: paddingV, left: paddingH, bottom: -paddingV, right: -paddingH)
            titleEdgeInsets = UIEdgeInsets(top: -paddingV, left: -paddingH, bottom: paddingV, right: paddingH)
            semanticContentAttribute = .forceLeftToRight
        }
    }
    
    
    
    
    @IBInspectable var bgColorForNormal: UIColor = .clear {
        didSet {
            setBackgroundImage(UIImage(color: bgColorForNormal), for: .normal)
            contentVerticalAlignment = .top
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


