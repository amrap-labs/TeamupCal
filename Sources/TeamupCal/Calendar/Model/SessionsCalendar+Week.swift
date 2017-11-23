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
        let rawDays = [WeakContainer<Day>]()
        
        // MARK: Init
        
        init(weekNumber: WeekNumber) {
            self.number = weekNumber
        }
        
        // MARK: Data
    }
}
