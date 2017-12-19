//
//  Measure.swift
//  OCE
//
//  Created by Volodymyr Kosmirak on 12/14/17.
//  Copyright © 2017 QIMS. All rights reserved.
//

import Foundation

/// Measure and print duration of block executing
///
/// - Parameters:
///   - title: optinal name of block, dafault is empty
///   - block: executing peace of code
/// - Returns: return same value as block, even Void
/// - Throws: throws if block throws
public func measure<T>(_ title: String = "",
                       file: String = #file,
                       function: String = #function,
                       line: UInt = #line,
                       block: () throws -> T) rethrows ->  T {
    
    let start = Date()
    
    defer {
        let end = Date()
        let time = end.timeIntervalSince(start).description.prefix(6)
        let fileName = URL(string: file)?.lastPathComponent.components(separatedBy: ".").first
        let prefix = title.isEmpty ? "" : " " + title
        let message = "Measure:\(prefix) \(time) (\(fileName ?? "") \(function) line \(line))"
        debugPrint(message)
    }
    
    return try block()
}
