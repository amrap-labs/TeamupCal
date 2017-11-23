//
//  SessionsCalendarDataProvider.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 23/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

public protocol SessionsCalendarDataProvider {
 
    func day(for date: Date) -> SessionsCalendar.Day?
    
    func week(for date: Date) -> SessionsCalendar.Week?
    
    func month(for date: Date) -> SessionsCalendar.Month?
    
    func year(for date: Date) -> SessionsCalendar.Year?
}
