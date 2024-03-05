//
//  String.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/4.
//

import Foundation

public extension String {
    
    func localString() -> String {
        return NSLocalizedString(self, value: self, comment: "")
    }
}
