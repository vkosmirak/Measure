//: Playground - noun: a place where people can play

import Foundation

/// Measure and print duration of block executing
///
/// - Parameters:
///   - title: optinal name of block, dafault is empty
///   - block: executing peace of code
/// - Returns: return same value as block, even Void
/// - Throws: throws if block throws
func measure<T>(_ title: String = "", block: () throws -> T) rethrows ->  T {
    let start = Date()
    
    defer {
        let end = Date()
        let prefix = title.isEmpty ? "" : title + " "
        debugPrint(prefix + end.timeIntervalSince(start).description.prefix(6))
    }
    
    return try block()
}


// Void function example

func voidFunction() {
    for i in 0..<1000 {
        _ = i * i
    }
}

voidFunction()
//replaced to
measure { voidFunction() }


// Function with return value

func calculateSum() -> Int {
    var all: Int = 0
    for i in 0..<1000 {
        all += i
    }
    return all
}

let x1 = calculateSum()
//replaced to
let x2 = measure("calculateSum") { calculateSum() }



// Throwing functions

struct Account: Decodable {
    let fullName: String
    let id: Int
    let twitter: URL
}

let json = """
{
 "fullName": "Federico Zanetello",
 "id": 123456,
 "twitter": "http://twitter.com/zntfdr"
}
""".data(using: .utf8)! // our data in native (JSON) format

let myStruct1 = try JSONDecoder().decode(Account.self, from: json)
//replaced to
let myStruct2 = try measure("decoding account") { try JSONDecoder().decode(Account.self, from: json) }


