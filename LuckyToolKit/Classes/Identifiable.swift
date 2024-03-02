//
//  Identifiable.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/2.
//

import Foundation


extension Identifiable where ID: Equatable, Self: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
