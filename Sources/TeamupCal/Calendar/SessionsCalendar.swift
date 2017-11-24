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
        case success(days: [Day])
        case failure(reason: TeamupCal.FailureReason)
    }
    
    internal typealias DataRequestCompletion = (CalendarLoadResult) -> Void
    
    // MARK: Properties
    
    private weak var dataSource: SessionsCalendarDataSource?
    private let dataStore = SessionsCalendarDataStore()
    
    // MARK: Init
    
    init(with dataSource: SessionsCalendarDataSource) {
        self.dataSource = dataSource
        
    }
    
    // MARK: Data
    
    private func load(daysBetween startDate: Date,
                      and endDate: Date,
                      completion: @escaping (([Day]) -> Void)) {
        dataSource?.calendar(self, requestDaysBetween: startDate, and: endDate, completion: { (result) in
            switch result {
            case .success(let days):
                self.dataStore.add(days: days)
                completion(days)
                
            case .failure:
                // TODO - Post to delegate or something
                print("CALENDAR - Failed to load days for \(startDate) / - \(endDate)")
            }
        })
    }
}
