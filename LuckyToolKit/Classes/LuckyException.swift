//
//  LuckyException.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/2.
//

import Foundation

public struct LuckyException: Error {
    
    public var msg: String
    
    public init(msg: String) {
        self.msg = msg
    }
}



open class LuckyExceptionHandler {
    
    
    public static let shared = LuckyExceptionHandler()
    
    /// 统一异常处理
    /// - Parameter throwable: 可抛异常的操作
    public func handler(_ throwable: () throws -> Void) {
        do {
            try throwable()
        }
        catch {
            catchException(error)
        }
    }
    
    
    /// 捕获到异常时处理，按需设置
    public var catchException: (Error) -> Void = { err in
        
    }
    
}


