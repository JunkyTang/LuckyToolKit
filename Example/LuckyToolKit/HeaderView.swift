//
//  HeaderView.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2022/3/13.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import LuckyToolKit

class HeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        super.awakeFromNib()
        log(self)
    }
}

extension HeaderView: XibLoadable {}
