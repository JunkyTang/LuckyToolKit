//
//  UDStorable.swift
//  Alamofire
//
//  Created by junky on 2024/3/4.
//

import Foundation



extension Encodable {
    
    /// 存
    /// - Parameter suitName: UD的suitName，空为默认ud, key 存储的key
    func save(to suitName:String? = nil, key: String) throws {
        
        var ud = UserDefaults(suiteName: suitName)
        if ud == nil {
            ud = UserDefaults.standard
        }
        
        let json = try JSONEncoder().encode(self)
        ud?.set(json, forKey: key)
    }
}


extension Decodable {
    
    /// 取
    /// - Parameter suitName: UD的suitName，空为默认ud, key 存储的key
    /// - Returns: 返回读取到的数据
    static func read(from suitName:String? = nil, key: String) throws -> Self? {
        
        var ud = UserDefaults(suiteName: suitName)
        if ud == nil {
            ud = UserDefaults.standard
        }
        guard let json = ud?.object(forKey: key) as? Data else { return nil }
        let value = try JSONDecoder().decode(Self.self, from: json)
        return value
    }
}


@propertyWrapper
public struct UDStorable<T: Codable> {
    
    var suitName: String?
    
    var key: String
    
    var defoult: T
    
    public var projectedValue: T? {
        return try? T.read(from: suitName, key: key)
    }
    
    public var wrappedValue: T {
        set{
            try? newValue.save(to: suitName, key: key)
        }
        get{
            if let v = try? T.read(from: suitName, key: key) {
                return v
            }
            return defoult
        }
    }
    
    
    public init(suitName: String? = nil, key: String, defoult: T) {
        self.suitName = suitName
        self.key = key
        self.defoult = defoult
    }
}


