//
//  SessionsLoader.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 14/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

internal class SessionsLoader {
    
    // MARK: Properties
    
    private weak var sessions: SessionsController?
    
    // MARK: Init
    
    init(teamup: Teamup) {
        self.sessions = teamup.sessions
    }
}
