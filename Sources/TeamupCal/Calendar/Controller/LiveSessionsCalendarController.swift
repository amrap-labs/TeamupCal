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
    
    private let cache: CacheStore<SessionsCalendar.Day>

    // MARK: Init
    
    required init(loader: SessionsLoader, cacheRoot: CacheContainer) {
        self.calendar = SessionsCalendar()
        self.loader = loader
        
        let cacheContainer = CacheContainer(path: "Calendar", inside: cacheRoot)
        self.cache = CacheStore<SessionsCalendar.Day>(for: cacheContainer)
        
        calendar.dataSource = self
    }
}

extension LiveSessionsCalendarController: SessionsCalendarDataSource {
    
    func calendar(_ calendar: SessionsCalendar,
                  requestDayFor date: Date,
                  completion: @escaping SessionsCalendar.DataRequestCompletion) {
        
        let identifier = SessionsCalendar.Day.cacheIdentifier(for: date)
        cache.item(for: identifier) { (day) in
            
            if let day = day {
                completion(.success(day: day))
                
            } else {
                
                self.loader?.loadSessions(for: date, completion: { (result) in
                    
                    switch result {
                    case .success(let sessions):
                        let day = SessionsCalendar.Day(for: date, sessions: sessions)
                        self.cache.persist(day, completion: nil)
                        completion(.success(day: day))
                        
                    case .failure(let reason):
                        completion(.failure(reason: reason))
                    }
                })
            }
        }
    }
}
