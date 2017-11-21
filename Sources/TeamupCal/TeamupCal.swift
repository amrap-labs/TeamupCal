//
//  TeamupCal.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 14/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

public class TeamupCal {
    
    // MARK: Properties
    
    private let teamup: Teamup
    
    private let sessionsLoader: SessionsLoader
    private let calendarController: SessionsCalendarController
    
    private let cacheRoot: CacheContainer
    
    public var calendar: SessionsCalendar {
        return calendarController.calendar
    }
    
    // MARK: Init
    
    public init?(with teamup: Teamup) {
        guard let currentUser = teamup.auth.currentUser else {
            print("TeamupCal could not initialize due to a fault in TeamupKit ☹️.")
            print("Please raise an issue at https://github.com/amrap-labs/TeamupKit.")
            return nil
        }
        
        self.teamup = teamup
        self.cacheRoot = CacheContainer(path: "TeamupCal/\(currentUser.identifier)")
        
        self.sessionsLoader = LiveSessionsLoader(sessions: teamup.sessions,
                                                 auth: teamup.auth)
        self.calendarController = LiveSessionsCalendarController(loader: sessionsLoader,
                                                                 cacheRoot: cacheRoot)
    }
}
