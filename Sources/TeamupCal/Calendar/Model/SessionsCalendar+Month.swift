//
//  SessionsMonth.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

public extension SessionsCalendar {
    
    public class Month {
        
        // MARK: Properties
        
        let number: Int
        
        private var rawWeeks = [WeekNumber: WeakContainer<Week>]()
        public var weeks: [Week] {
            return rawWeeks.flatMap({ $0.value.value })
        }
        
        // MARK: Init
        
        internal init(number: Int) {
            self.number = number
        }
        
        // MARK: Data
        
        internal func update(week: Week) {
            rawWeeks[week.number] = WeakContainer(value: week)
        }
    }
}
