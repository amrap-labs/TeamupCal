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
    
    public class Day {
        
        // MARK: Properties
        
        let date: Date
        let sessions: [Session]
        
        init(for date: Date, sessions: [Session]) {
            self.date = date
            self.sessions = sessions
        }
    }
}

extension SessionsCalendar.Day: Cacheable {
    
    var lifetime: CacheLifetime {
        return .infinite
    }
    var identifier: CacheIdentifier {
        return ""
    }
}
