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
    
    // MARK: Init
    
    init() {
        self.calendar = SessionsCalendar()
    }
}
