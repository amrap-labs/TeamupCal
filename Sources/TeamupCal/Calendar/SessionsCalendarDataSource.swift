//
//  SessionsCalendarDataSource.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal protocol SessionsCalendarDataSource: class {
    
    func calendar(_ calendar: SessionsCalendar,
                  requestDayFor date: Date,
                  completion: @escaping SessionsCalendar.DataRequestCompletion)
}
