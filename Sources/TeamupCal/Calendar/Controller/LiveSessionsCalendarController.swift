//
//  LiveSessionsCalendarController.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal class LiveSessionsCalendarController: SessionsCalendarController {
    
    // MARK: Properties
    
    private(set) var calendar: SessionsCalendar
    private(set) weak var loader: SessionsLoader?
    
    private let cache = CacheManager<SessionsCalendar.Day>()

    // MARK: Init
    
    required init(loader: SessionsLoader) {
        self.calendar = SessionsCalendar()
        self.loader = loader
        
        calendar.dataSource = self
    }
}

extension LiveSessionsCalendarController: SessionsCalendarDataSource {
    
    func calendar(_ calendar: SessionsCalendar,
                  requestSessionsFor date: Date,
                  completion: @escaping SessionsCalendar.DataRequestCompletion) {
        
        // TODO - Use cache
        loader?.loadSessions(for: date, completion: { (result) in
            completion(result)
        })
    }
}
