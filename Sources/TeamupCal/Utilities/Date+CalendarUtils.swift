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
    
    static func ...(lhs: Date, rhs: Date) -> [Date] {
        var dates: [Date] = []
        let cal = Calendar.current
        var days = DateComponents()
        var dayCount = 0
        while true {
            days.day = dayCount
            if let date: Date = cal.date(byAdding: days, to: lhs) {
                if date.compare(rhs) == .orderedDescending {
                    break
                }
                dayCount += 1
                dates.append(date)
            } else {
                break
            }
        }
        return dates
    }
}
