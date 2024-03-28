//
//  Sanbox.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/4.
//

import UIKit

public enum Sanbox {

    
    static let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let library = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
    
    static let caches = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
    
    static let tmp = FileManager.default.temporaryDirectory
    
}

public protocol SanboxStorable {
    
    static var sanBoxPath: URL { get }
    static var saveDirectory: String { get }
    
}


public extension SanboxStorable where Self: Codable {
    
    func save(as name: String) throws {
        
        var url = Self.sanBoxPath
        url = url.appendingPathComponent(Self.saveDirectory, isDirectory: true)
        var isDirectory: ObjCBool = true
        if FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory) == false {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        }
        url = url.appendingPathComponent(name, isDirectory: false)
        
        let data = try JSONEncoder().encode(self)
        try data.write(to: url)
    }
    
    static func delete(where name: String) throws {
        
        var url = Self.sanBoxPath
        url = url.appendingPathComponent(Self.saveDirectory, isDirectory: true)
        var isDirectory: ObjCBool = true
        if FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory) == false {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        }
        url = url.appendingPathComponent(name, isDirectory: false)
        try FileManager.default.removeItem(at: url)
    }
    
    static func fetchAll() throws -> [Self] {
        var url = Self.sanBoxPath
        url = url.appendingPathComponent(Self.saveDirectory, isDirectory: true)
        let list = try FileManager.default.contentsOfDirectory(atPath: url.path)
        
        var res: [Self] = []
        for content in list {
            let tmpUrl = url.appendingPathComponent(content)
            guard let data = try? Data(contentsOf: tmpUrl) else {
                continue
            }
            let model = try JSONDecoder().decode(Self.self, from: data)
            res.append(model)
        }
        return res
    }
    
    static func fetch(_ name: String) throws -> Self? {
        var url = Self.sanBoxPath
        url = url.appendingPathComponent(Self.saveDirectory, isDirectory: true)
        url = url.appendingPathComponent(name, isDirectory: false)
        
        
        guard let data = try? Data(contentsOf: url) else { return nil }
        let model = try JSONDecoder().decode(Self.self, from: data)
        return model
    }
    
    static func clear() throws {
        var url = Self.sanBoxPath
        url = url.appendingPathComponent(Self.saveDirectory, isDirectory: true)
        try FileManager.default.removeItem(at: url)
    }
    
}
