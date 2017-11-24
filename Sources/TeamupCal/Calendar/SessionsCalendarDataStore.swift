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
    private typealias Year = SessionsCalendar.Year
    
    // MARK: Properties
    
    private var days = [Date: Day]()
    private var weeks = [WeekNumber: Week]()
    private var months = [Int: Month]()
    private var years = [Int: Year]()
    
    // MARK: Data
    
    func add(day: SessionsCalendar.Day) {
        self.days[day.date] = day
        
        let weekNumber = day.date.weekNumber
        let week = self.week(for: weekNumber)
        week.updateDay(day)
        
        let month = self.month(for: day.date.month)
        month.update(week: week)
        
        let year = self.year(for: day.date.year)
        year.update(month: month)
    }
    
    func add(days: [SessionsCalendar.Day]) {
        for day in days {
            add(day: day)
        }
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
    
    private func month(for monthNumber: Int) -> Month {
        if let month = self.months[monthNumber] {
            return month
        }
        
        let month = Month(number: monthNumber)
        self.months[monthNumber] = month
        return month
    }
    
    private func year(for yearNumber: Int) -> Year {
        if let year = self.years[yearNumber] {
            return year
        }
        
        let year = Year(number: yearNumber)
        self.years[yearNumber] = year
        return year
    }
}

extension SessionsCalendarDataStore: SessionsCalendarDataProvider {
    
    func day(for date: Date) -> SessionsCalendar.Day? {
        return days[date]
    }
    
    func week(for date: Date) -> SessionsCalendar.Week? {
        return weeks[date.weekNumber]
    }
    
    func month(for date: Date) -> SessionsCalendar.Month? {
        return months[date.month]
    }
    
    func year(for date: Date) -> SessionsCalendar.Year? {
        return years[date.year]
    }
}
