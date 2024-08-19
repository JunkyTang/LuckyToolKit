//
//  String.swift
//  LuckyToolKit
//
//  Created by junky on 2022/3/4.
//

import Foundation

public extension String {
    
    func localString() -> String {
    
//        guard let languageList = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String],
//              let path = Bundle.main.path(forResource: languageList.first, ofType: "lproj"),
//              let bundle = Bundle(path: path)
//        else {
//            return NSLocalizedString(self, value: self, comment: "")
//        }
//        return NSLocalizedString(self, bundle: bundle, value: self, comment: "")
        return NSLocalizedString(self, value: self, comment: "")
        
    }
    
    
}
