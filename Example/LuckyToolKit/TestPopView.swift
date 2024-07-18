//
//  TestPopView.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2022/3/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import LuckyToolKit

class TestPopView: UIView {

    @IBOutlet weak var colorV: UIView!
    
    override var safeAreaInsets: UIEdgeInsets {
        return UIApplication.safeAreaInset
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}

extension TestPopView: Popable, XibLoadable {
    var animation: PopAnimation {
        .move(from: .outScreen(lateral: .fill(padding: -10), longitudinal: .bottom(padding: 0)), to: .inScreen(lateral: .fill(padding: -10), longitudinal: .bottom(padding: 0)))
//        .none(position: .inScreen(lateral: .fill(padding: -10), longitudinal: .bottom(padding: 0)))
    }
}
