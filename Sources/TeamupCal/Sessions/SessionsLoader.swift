//
//  SessionsLoader.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

internal enum SessionsLoaderResult {
    case success(sessions: [Session])
    case failure(reason: TeamupCal.FailureReason)
}

internal protocol SessionsLoader: class {
    
    typealias LoadCompletion = (SessionsLoaderResult) -> Void
    
    init(teamup: Teamup)
    
    func loadSessions(for date: Date,
                      completion: @escaping LoadCompletion)
}
