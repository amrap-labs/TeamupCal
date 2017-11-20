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
    
    public var calendar: SessionsCalendar {
        return calendarController.calendar
    }
    
    // MARK: Init
    
    public init(with teamup: Teamup) {
        self.teamup = teamup
        
        self.sessionsLoader = LiveSessionsLoader(sessions: teamup.sessions, auth: teamup.auth)
        self.calendarController = LiveSessionsCalendarController(loader: sessionsLoader)
        
        let date = Date()
        sessionsLoader.loadSessions(for: date) { (result) in
            switch result {
            case .success(let sessions):
                let day = SessionsCalendar.Day(for: date, sessions: sessions)
                print("loaded \(sessions.count) sessions")
                
            default:()
            }
        }
    }
}
