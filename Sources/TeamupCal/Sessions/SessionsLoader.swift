//
//  SessionsLoader.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

internal protocol SessionsLoader: class {
    
    typealias LoadCompletion = (SessionsLoadResult) -> Void
    
    init(sessions: SessionsController, auth: AuthenticationController)
    
    func loadSessions(for date: Date,
                      completion: @escaping LoadCompletion)
}
