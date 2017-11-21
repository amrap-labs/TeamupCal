//
//  SessionsCalendar.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

public class SessionsCalendar {
    
    // MARK: Types
    
    enum CalendarLoadResult {
        case success(day: Day)
        case failure(reason: TeamupCal.FailureReason)
    }
    
    internal typealias DataRequestCompletion = (CalendarLoadResult) -> Void
    
    // MARK: Properties
    
    internal weak var dataSource: SessionsCalendarDataSource?
        
    // MARK: Data
    
    // TODO - Remove
    public func load() {
        dataSource?.calendar(self, requestDayFor: Date(), completion: { (result) in
            
        })
    }
}
