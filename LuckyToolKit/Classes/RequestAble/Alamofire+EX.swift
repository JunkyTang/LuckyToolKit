//
//  Alamofire+EX.swift
//  LuckyNetWork
//
//  Created by junky on 2024/2/23.
//

import Foundation
import Alamofire

public extension URLCache {
    
    /// cache in tmp
    static var cacheWhichSaveInTmp = URLCache(memoryCapacity: 20 * 1024 * 1024, diskCapacity: 100 * 1024 * 1024, diskPath: NSTemporaryDirectory())
}

public extension Alamofire.URLSessionConfiguration {
    
    /// which cache in tmp
    static var sessionConfigurationWhichCacheInTmp: URLSessionConfiguration {
        let cfg = URLSessionConfiguration.default
        cfg.urlCache = URLCache.cacheWhichSaveInTmp
        return cfg
    }
}

public extension Alamofire.Session {
    
    /// which cache in tmp
    static var sessionWhichCacheInTmp: Session = Session(configuration: .sessionConfigurationWhichCacheInTmp)
}





