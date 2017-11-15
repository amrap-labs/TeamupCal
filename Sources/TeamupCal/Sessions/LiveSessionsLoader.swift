//
//  LiveSessionsLoader.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 14/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

internal class LiveSessionsLoader: SessionsLoader {
    
    // MARK: Properties
    
    private(set) weak var sessions: SessionsController?
    
    // MARK: Init
    
    required init(teamup: Teamup) {
        self.sessions = teamup.sessions
        
    }
}
