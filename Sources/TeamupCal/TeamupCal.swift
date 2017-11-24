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
    private let authObserver: TeamupAuthObserver
    
    private let sessionsLoader: SessionsLoader
    private let calendarController: SessionsCalendarController
    
    private let cacheRoot: CacheContainer
    
    public var calendar: SessionsCalendar {
        return calendarController.calendar
    }
    
    // MARK: Init
    
    public init(with teamup: Teamup) {
        self.teamup = teamup
        self.authObserver = TeamupAuthObserver()
        
        self.cacheRoot = CacheContainer(path: "TeamupCal")
        
        self.sessionsLoader = LiveSessionsLoader(sessions: teamup.sessions,
                                                 auth: teamup.auth)
        self.calendarController = LiveSessionsCalendarController(loader: sessionsLoader,
                                                                 cacheRoot: cacheRoot)
        
        authObserver.delegate = self
    }
}

extension TeamupCal: TeamupAuthObserverDelegate {
    
    func authObserver(_ observer: TeamupAuthObserver, didObserveAuthenticationWith user: User) {
        
    }
    
    func authObserver(didObserveSignOut observer: TeamupAuthObserver) {
        self.cacheRoot.clear(completion: nil)
    }
}
