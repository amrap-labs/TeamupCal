//
//  SessionsCalendar.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

public class SessionsCalendar {
    
    // MARK: Properties
    
    internal weak var dataSource: SessionsCalendarDataSource?
    
    private let cache = CacheManager<SessionsCalendar.Day>()
}
