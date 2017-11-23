//
//  Date+Formatting.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 21/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

extension Date {
    
    static let cacheFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddMMYYYY"
        return dateFormatter
    }()
    
    var teamUpCacheStringFormat: String {
        return Date.cacheFormatter.string(from: self)
    }
}
