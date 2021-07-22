//
//  Statistics.swift
//  FizzBuzz
//
//  Created by François Delaplace on 21/07/2021.
//

import Foundation

let statsKey = "FizzBuzzStatistics"

class Statistics {
    
    class func load() -> [String:Any]? {
        let defaults = UserDefaults.standard
        guard let stats = defaults.dictionary(forKey: statsKey) else {
            return nil
        }
        return stats
    }
    
    class func save(parameters: [String]) {
        let defaults = UserDefaults.standard
        var stats = defaults.dictionary(forKey: statsKey)
        if stats == nil {
            defaults.set(Dictionary<String, Any>(), forKey: statsKey)
        }
        for param in parameters {
            if stats![param] == nil {
                stats![param] = 1
            } else {
                stats![param] = stats![param] as! Int + 1
            }
        }
    }
}
