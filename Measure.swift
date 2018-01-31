//
//  Measure.swift
//  Volodymyr Kosmirak
//
//  Created by Volodymyr Kosmirak on 12/14/17.
//  Copyright © 2017 Volodymyr Kosmirak. All rights reserved.
//

import Foundation

/// Measure and print duration of block executing
///
/// - Parameters:
///   - title: optinal name of block, dafault is empty
///   - block: executing peace of code
/// - Returns: return same value as block, even Void
/// - Throws: throws if block throws
@discardableResult
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

/// Class for advanced measuring
///
/// Example:
///
///     Measure.start("Open screen")
///     Measure.finish("Open screen")
///
///     Measure.start(); defer { Measure.finish() }
///
class Measure {
    
    private static var measureIds = [String: Date]()
    
    static func start(_ id: String = "",
                      file: String = #file,
                      function: String = #function) {
        var id = id
        if id.isEmpty {
            let fileName = URL(string: file)?.lastPathComponent.components(separatedBy: ".").first ?? ""
            id = fileName + " " + function
        }
        measureIds[id] = Date()
    }
    
    static func finish(_ id: String = "",
                       file: String = #file,
                       function: String = #function) {
        var id = id
        if id.isEmpty {
            let fileName = URL(string: file)?.lastPathComponent.components(separatedBy: ".").first ?? ""
            id = fileName + " " + function
        }
        
        guard let start = measureIds[id] else {
            debugPrint("Measure error: \(id) was not started")
            return
        }
        
        measureIds[id] = nil
        
        let end = Date()
        let time = end.timeIntervalSince(start).description.prefix(6)
        let message = "Measure: \(id) \(time)"
        debugPrint(message)
    }
}

