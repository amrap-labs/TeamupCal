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
    
    private weak var teamup: Teamup?
    
    private let sessionsLoader: SessionsLoader
    private let calendarController: CalendarController
    
    public var calendar: SessionsCalendar {
        return calendarController.calendar
    }
    
    // MARK: Init
    
    public init(with teamup: Teamup) {
        self.teamup = teamup
        
        self.sessionsLoader = LiveSessionsLoader(teamup: teamup)
        self.calendarController = LiveCalendarController(sessionsLoader: sessionsLoader)
        
        sessionsLoader.loadSessions(for: Date()) { (result) in
            switch result {
            case .success(let sessions):
                print("loaded \(sessions.count) sessions")
                
            default:()
            }
        }
    }
}
