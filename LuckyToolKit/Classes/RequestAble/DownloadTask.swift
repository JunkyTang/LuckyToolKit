//
//  DownloadAble.swift
//  LuckyNetWork
//
//  Created by junky on 2022/2/23.
//

import Foundation
import Alamofire

public struct DownloadTask<Param: Codable>: RequestAble {
    
    public typealias ResponseType = URL
    
    public var url: Alamofire.URLConvertible
    public var parameters: Param? = nil
    public var destination: DownloadRequest.Destination? = DownloadRequest.suggestedDownloadDestination(options: [.createIntermediateDirectories, .removePreviousFile])
    
    public var modifer: Session.RequestModifier? = { request in
        request.cachePolicy = .returnCacheDataElseLoad
    }
    
    @discardableResult
    public func download(progressHandler: @escaping Request.ProgressHandler, callback: @escaping CompeleteCallback) -> Request {
        download(downloadDestination: destination, progressHandler: progressHandler, callback: callback)
    }
    
    
    public init(url: Alamofire.URLConvertible, parameters: Param? = nil, destination: DownloadRequest.Destination? = nil, modifer: Session.RequestModifier? = nil) {
        self.url = url
        self.parameters = parameters
        self.destination = destination
        self.modifer = modifer
    }
    
}
