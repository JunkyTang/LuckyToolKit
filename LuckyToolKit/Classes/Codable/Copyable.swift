//
//  Copyable.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/2.
//

import Foundation


public protocol Copyable: Codable {
    
    func copy() throws -> Self
    
    func copyAdapter() -> Self
}

public extension Copyable {
    
    
    /// 编码再解码成新对象
    /// - Returns: 新对象
    func copy() throws -> Self {
        
        let json = try JSONEncoder().encode(self)
        let new = try JSONDecoder().decode(Self.self, from: json)
        return new.copyAdapter()
    }
    
    /// 生成新对象时需要做的修改
    /// - Returns: 新对象
    func copyAdapter() -> Self {
        return self
    }
}
