//
//  LTRequestAble.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2024/3/2.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import LuckyToolKit
import Alamofire

protocol LTRequestAble: RequestAble where ResponseType == LTResponse<Content> {
    
    associatedtype Content: Codable
    var path: String { get }
}

extension LTRequestAble {
    
    var url: URLConvertible {
        return "http://www.google.com/" + path
    }
    
}


struct LTResponse<Content: Codable>: Codable {
    
    var code: Int
    
    var msg: String
    
    var data: Content
    
}

