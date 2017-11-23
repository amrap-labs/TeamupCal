//
//  SessionsCalendar+Year.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 21/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

public extension SessionsCalendar {
    
    public class Year {
        
        // MARK: Properties
        
        let number: Int
        
        private var rawMonths = [Int: WeakContainer<Month>]()
        public var months: [Month] {
            return rawMonths.flatMap({ $0.value.value }).sorted(by: { (month, other) -> Bool in
                return month.number > other.number
            })
        }
        
        // MARK: Init
        
        internal init(number: Int) {
            self.number = number
        }
        
        // MARK: Data
        
        internal func update(month: Month) {
            rawMonths[month.number] = WeakContainer(value: month)
        }
    }
}
