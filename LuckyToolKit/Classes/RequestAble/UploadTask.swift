//
//  UploadTask.swift
//  LuckyNetWork
//
//  Created by junky on 2024/2/23.
//

import Foundation
import Alamofire

public struct UploadTask<Param: Codable>: RequestAble {
    
    
    public typealias ResponseType = String
    
    public var url: Alamofire.URLConvertible
    public var parameters: Param? = nil
    public var data: Data
    
    @discardableResult
    public func upload(progressHandler: @escaping Request.ProgressHandler, callback: @escaping CompeleteCallback) -> Request {
        upload(data: data, progressHandler: progressHandler, callback: callback)
    }
    
    public init(url: Alamofire.URLConvertible, parameters: Param? = nil, data: Data) {
        self.url = url
        self.parameters = parameters
        self.data = data
    }
    
}

