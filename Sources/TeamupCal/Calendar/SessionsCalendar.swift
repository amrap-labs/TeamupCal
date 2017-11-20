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
    
    internal typealias DataRequestCompletion = (SessionsLoadResult) -> Void
    
    // MARK: Properties
    
    internal weak var dataSource: SessionsCalendarDataSource?
        
    // MARK: Data
    
    // TODO - Remove
    public func load() {
        dataSource?.calendar(self, requestSessionsFor: Date(), completion: { (result) in
            dump(result)
        })
    }
}
