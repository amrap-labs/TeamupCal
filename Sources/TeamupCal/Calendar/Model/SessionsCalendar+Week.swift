//
//  SessionsWeek.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation


public extension SessionsCalendar {
    
    internal typealias WeekNumber = Int

    public class Week {
        
        // MARK: Properties
        
        let number: WeekNumber
        
        private var rawDays = [Date: WeakContainer<Day>]()
        public var days: [Day] {
            return rawDays.flatMap({ $0.value.value })
        }
        
        // MARK: Init
        
        init(weekNumber: WeekNumber) {
            self.number = weekNumber
        }
        
        // MARK: Data
        
        func updateDay(_ day: Day) {
            rawDays[day.date] = WeakContainer(value: day)
        }
    }
}
