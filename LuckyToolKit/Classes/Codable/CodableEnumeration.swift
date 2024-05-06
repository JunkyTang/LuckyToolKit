//
//  CodableEnumeration.swift
//  LuckyToolKit
//
//  Created by junky on 2022/3/5.
//

import Foundation



public protocol CodableEnumeration: RawRepresentable, Codable where RawValue: Codable {
    static var unknown: Self { get }
}

public extension CodableEnumeration {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        
        if let value = Self(rawValue: rawValue) {
            self = value
        } else {
            self = .unknown
        }
    }
}


