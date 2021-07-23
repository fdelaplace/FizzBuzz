//
//  FizzBuzzGame.swift
//  FizzBuzz
//
//  Created by François Delaplace on 05/07/2021.
//

import Foundation

class FizzBuzzGame {
    
    class func fizzBuzz(tuples: [(divider: Int, message: String)], limit: Int) -> [String] {
        var results = [String]()
        for index in 1...limit {
            var result = ""
            for tuple in tuples {
                if let success = divide(dividend: index, tuple: tuple) {
                    result.append(success)
                }
            }
            if result.count == 0 {
                result.append("\(index)")
            }
            results.append(result)
        }
        return results
    }
    
    fileprivate class func divide(dividend: Int, tuple: (divider: Int, message: String)) -> String? {
        return dividend.isMultiple(of: tuple.divider) ? tuple.message : nil
    }
}
