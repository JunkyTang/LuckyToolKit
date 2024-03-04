//
//  LTExampleAPI.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2024/3/2.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import Alamofire

struct LTExampleAPI: LTRequestAble {
    
    typealias Content = String
    
    var path: String {
        return "a path"
    }
    var parameters: String
    
}



class CommomAPI<P: Codable, R: Codable>: LTRequestAble {
    
    typealias Content = R
    
    var path: String
    
    var method: HTTPMethod
    
    var parameters: P
    
    
    init(path: String, method: HTTPMethod, parameters: ParamerterType) {
        self.path = path
        self.method = method
        self.parameters = parameters
    }
    
    static func txt() {
        
        CommomAPI<String, String>(path: "", method: .get, parameters: "").request { resp in
            
        }
    }
    
}
