//
//  SessionsCalendarController.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal protocol SessionsCalendarController: class {
    
    var calendar: SessionsCalendar! { get }
    var loader: SessionsLoader? { get }
    
    init(loader: SessionsLoader, cacheRoot: CacheContainer)
}
