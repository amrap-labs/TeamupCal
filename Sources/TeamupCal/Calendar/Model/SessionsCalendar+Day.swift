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
        
        let date: Date
        let sessions: [Session]
        
        // MARK: Init
        
        init(for date: Date, sessions: [Session]) {
            self.date = date
            self.sessions = sessions
        }
    }
}

extension SessionsCalendar.Day {
    
    var cacheLifetime: CacheLifetime {
        return .infinite
    }
    var cacheIdentifier: CacheIdentifier {
        return date.tu_cacheStringFormat
    }
    
    public var hashValue: Int {
        return date.hashValue
    }
    
    public static func ==(lhs: SessionsCalendar.Day, rhs: SessionsCalendar.Day) -> Bool {
        return lhs.date == rhs.date
    }
}
