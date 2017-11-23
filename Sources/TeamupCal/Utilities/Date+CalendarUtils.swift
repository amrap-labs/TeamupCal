//
//  Date+CalendarUtils.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

extension Date {
    
    private var calendar: Calendar {
        return Calendar.current
    }
    
    var startOfDay: Date? {
        return calendar.startOfDay(for: self)
    }
    
    var endOfDay: Date? {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return calendar.date(byAdding: components, to: self)
    }
    
    var weekNumber: Int {
        return calendar.component(.weekOfYear, from: self)
    }
    
    var month: Int {
        return calendar.component(.month, from: self)
    }
    var year: Int {
        return calendar.component(.year, from: self)
    }
}
