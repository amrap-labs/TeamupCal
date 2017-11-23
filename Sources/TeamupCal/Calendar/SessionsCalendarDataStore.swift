//
//  SessionsCalendarDataStore.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 23/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal class SessionsCalendarDataStore {
    
    // MARK: Types
    
    private typealias WeekNumber = SessionsCalendar.WeekNumber
    private typealias Day = SessionsCalendar.Day
    private typealias Week = SessionsCalendar.Week
    private typealias Month = SessionsCalendar.Month
    
    // MARK: Properties
    
    private var days = [Date: Day]()
    private var weeks = [WeekNumber: Week]()
    
    // MARK: Data
    
    func add(day: SessionsCalendar.Day) {
        self.days[day.date] = day
        
        let weekNumber = day.date.weekNumber
        let week = self.week(for: weekNumber)
    }
    
    // MARK: Utility
    
    private func week(for weekNumber: WeekNumber) -> Week {
        if let week = self.weeks[weekNumber] {
            return week
        }
        
        let week = Week(weekNumber: weekNumber)
        self.weeks[weekNumber] = week
        return week
    }
}

extension SessionsCalendarDataStore: SessionsCalendarDataProvider {
    
    func day(for date: Date) -> SessionsCalendar.Day? {
        return days[date]
    }
    
    func week(for date: Date) -> SessionsCalendar.Week? {
        fatalError()
    }
    
    func month(for date: Date) -> SessionsCalendar.Month? {
        fatalError()
    }
    
    func year(for date: Date) -> SessionsCalendar.Year? {
        fatalError()
    }
}
