//
//  XibLoadable.swift
//  LuckyToolKit
//
//  Created by junky on 2022/3/2.
//

import Foundation
import UIKit


public protocol XibLoadable: UIView {
    static var xibName: String { get }
}

public extension XibLoadable {
    
    typealias S = Self
    
    static var xibName: String {
        return String(describing: self)
    }
    
    static func loadFromXib() -> S {
        
        let bundle = Bundle(for: S.self)
        if let instance = bundle.loadNibNamed(xibName, owner: nil)?.first,
           let view = instance as? Self {
            return view
        }
        return S()
    }
}
