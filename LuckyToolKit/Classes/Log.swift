//
//  Log.swift
//  LuckyToolKit
//
//  Created by junky on 2024/3/4.
//

import Foundation

public func log(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
    let fileName = URL(fileURLWithPath: file).lastPathComponent
    let logInfo = "\(fileName):\(function) [\(line)]"

    let output = items.map { "\($0)" }.joined(separator: " ")
    print("\(logInfo) - \(output)")
}

