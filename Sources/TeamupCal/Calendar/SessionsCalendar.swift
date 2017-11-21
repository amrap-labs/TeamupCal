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
    
    private var years = [Year]()
    
    // MARK: Init
    
    init() {
        
    }
    
    // MARK: Data
    
    private func load(dayFor date: Date,
                      completion: @escaping ((Day) -> Void)) {
        dataSource?.calendar(self, requestDayFor: date, completion: { (result) in
            switch result {
            case .success(let day):
                completion(day)
                
            case .failure:
                // TODO - Post to delegate or something
                print("CALENDAR - Failed to load day for \(date)")
            }
        })
    }
}
