//
//  UploadTask.swift
//  LuckyNetWork
//
//  Created by junky on 2022/2/23.
//

import Foundation
import Alamofire

public struct UploadTask<Param: Codable>: RequestAble {
    
    
    public typealias ResponseType = URL
    
    public var url: Alamofire.URLConvertible
    public var method: HTTPMethod = .get
    public var parameters: Param? = nil
    public var data: Data
    
    @discardableResult
    public func upload(progressHandler: @escaping Request.ProgressHandler, callback: @escaping CompeleteCallback) -> Request {
        upload(data: data, progressHandler: progressHandler, callback: callback)
    }
    
    public init(url: Alamofire.URLConvertible, method: HTTPMethod, parameters: Param? = nil, data: Data) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.data = data
    }
    
    
}

