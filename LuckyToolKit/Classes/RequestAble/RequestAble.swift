//
//  RequestAble.swift
//  LuckyNetWork
//
//  Created by junky on 2022/2/23.
//

import Foundation
import Alamofire

public protocol RequestAble {
    
    associatedtype ResponseType: Codable
    associatedtype ParamerterType: Codable
    
    typealias CompeleteCallback = (Result<ResponseType, AFError>) -> Void
    
    
    var session: Alamofire.Session { get }
    
    var url: URLConvertible { get }
    
    var method: HTTPMethod { get }
    
    var parameters: ParamerterType { get }
    
    var encoder: ParameterEncoder { get }
    
    var headers: HTTPHeaders? { get }
    
    var interceptor: RequestInterceptor? { get }
    
    var modifer: Alamofire.Session.RequestModifier? { get }
    
    func request(_ callback: @escaping CompeleteCallback) -> Request
    
    func download(downloadDestination: DownloadRequest.Destination?, progressHandler: @escaping Request.ProgressHandler, callback: @escaping CompeleteCallback) -> Request
    
    func upload(data: Data, progressHandler: @escaping Request.ProgressHandler, callback: @escaping CompeleteCallback) -> Request
    
}

public extension RequestAble {
    
    var session: Alamofire.Session {
        return Session.default
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoder: ParameterEncoder {
        if method == .get {
            return URLEncodedFormParameterEncoder.urlEncodedForm
        }
        return JSONParameterEncoder.json
    }
    
    var headers: HTTPHeaders? {
        return HTTPHeaders.default
    }
    
    var interceptor: RequestInterceptor? {
        // adapter? retrier?
        return nil
    }
    
    var modifer: Alamofire.Session.RequestModifier? {
        // timeout? cachePolicy? other URLRequest properties
        return nil
    }
    
    @discardableResult
    func request(_ callback: @escaping CompeleteCallback) -> Request {
        session.request(url,
                        method: method,
                        parameters: parameters,
                        encoder: encoder,
                        headers: headers,
                        interceptor: interceptor,
                        requestModifier: modifer)
            .responseDecodable(of: ResponseType.self) { resp in
                print(resp.debugDescription)
                callback(resp.result)
            }
    }
    
    @discardableResult
    func download(downloadDestination: DownloadRequest.Destination?, progressHandler: @escaping Request.ProgressHandler, callback: @escaping CompeleteCallback) -> Request {
        session.download(url,
                         method: method,
                         parameters: parameters,
                         encoder: encoder,
                         headers: headers,
                         interceptor: interceptor,
                         requestModifier: modifer,
                         to: downloadDestination)
            .downloadProgress(closure: progressHandler)
            .responseURL(completionHandler: { resp in
                print(resp.debugDescription)
                if let resp = resp.result as? Result<ResponseType, AFError> {
                    callback(resp)
                }else {
                    callback(.failure(AFError.responseSerializationFailed(reason: AFError.ResponseSerializationFailureReason.inputFileNil)))
                }
            })
    }
    
    @discardableResult
    func upload(data: Data, progressHandler: @escaping Request.ProgressHandler, callback: @escaping CompeleteCallback) -> Request {
        session.upload(data,
                       to: url,
                       method: method,
                       headers: headers,
                       interceptor: interceptor,
                       fileManager: FileManager.default,
                       requestModifier: modifer)
            .uploadProgress(closure: progressHandler)
            .responseDecodable(of: ResponseType.self, completionHandler: { resp in
                print(resp.debugDescription)
                callback(resp.result)
        })
    }
}
