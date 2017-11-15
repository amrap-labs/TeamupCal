//
//  LiveCalendarController.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal class LiveCalendarController: CalendarController {
    
    // MARK: Properties
    
    private(set) var calendar: SessionsCalendar
    private(set) weak var sessionsLoader: SessionsLoader?
    
    // MARK: Init
    
    required init(sessionsLoader: SessionsLoader) {
        self.calendar = SessionsCalendar()
        self.sessionsLoader = sessionsLoader
        
        calendar.dataSource = self
    }
}

extension LiveCalendarController: SessionsCalendarDataSource {
    
}
