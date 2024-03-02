//
//  Array.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/2.
//

import Foundation

public extension Array {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
