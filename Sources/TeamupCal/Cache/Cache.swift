//
//  Cache.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 20/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

typealias CacheIdentifier = String

enum CacheLifetime {
    
    case infinite
    case weeks(count: Int)
    case days(count: Int)
    case hours(count: Int)
    case minutes(count: Int)
    case seconds(count: Int)
    
    var timeInterval: TimeInterval? {
        switch self {
        case .infinite:
            return nil
        case .seconds(let count):
            return TimeInterval(count)
        case .minutes(let count):
            return TimeInterval(count * 60)
        case .hours(let count):
            return TimeInterval(count * 3600)
        case .days(let count):
            return TimeInterval(count * 86400)
        case .weeks(let count):
            return TimeInterval(count * 604800)
        }
    }
}
