//
//  SessionsDay.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

public extension SessionsCalendar {
    
    public class Day: Cacheable {
        
        // MARK: Properties
        
        public let date: Date
        public let sessions: [Session]
        
        // MARK: Init
        
        internal init(for date: Date, sessions: [Session]) {
            self.date = date
            self.sessions = sessions
        }
        
        // MARK: Utility
        
        internal class func cacheIdentifier(for date: Date) -> CacheIdentifier {
            let day = Day(for: date, sessions: [])
            return day.cacheIdentifier
        }
    }
}

extension SessionsCalendar.Day {
    
    var cacheLifetime: CacheLifetime {
        return .infinite
    }
    var cacheIdentifier: CacheIdentifier {
        return date.teamUpCacheStringFormat
    }
    
    public var hashValue: Int {
        return date.hashValue
    }
    
    public static func ==(lhs: SessionsCalendar.Day, rhs: SessionsCalendar.Day) -> Bool {
        return lhs.date == rhs.date
    }
}
