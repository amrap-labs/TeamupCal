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
    
    // MARK: Types
    
    // MARK: Properties
    
    private weak var sessions: SessionsController?
    private weak var auth: AuthenticationController?
    
    // MARK: Init
    
    required init(sessions: SessionsController, auth: AuthenticationController) {
        self.sessions = sessions
        self.auth = auth
    }
    
    // MARK: Loading
    
    func loadSessions(for date: Date,
                      completion: @escaping LoadCompletion) {
        
        guard let startDate = date.startOfDay, let endDate = date.endOfDay else {
            completion(.failure(reason: .unknown))
            return
        }
        guard auth?.isAuthenticated == true else {
            completion(.failure(reason: .unauthorized))
            return
        }
            
        loadAllSessions(between: startDate,
                        and: endDate,
                        completion: completion)
    }
    
    private func loadAllSessions(between startDate: Date,
                                 and endDate: Date,
                                 page: Int? = nil,
                                 sessions: [Session]? = nil,
                                 completion: @escaping LoadCompletion) {
        self.sessions?.load(between: startDate,
                            and: endDate,
                            includeRegistrationDetails: true,
                            includeNonActive: true,
                            page: page,
                            success:
            { (results) in
                var sessions = sessions
                if sessions == nil {
                    sessions = [Session]()
                }
                
                sessions?.append(contentsOf: results.results)
                
                if let nextPage = results.nextPage {
                    self.loadAllSessions(between: startDate,
                                         and: endDate,
                                         page: nextPage,
                                         sessions: sessions,
                                         completion: completion)
                } else {
                    guard let sessions = sessions else {
                        return
                    }
                    completion(.success(sessions: sessions))
                }
        },
                            failure:
            { (error, details) in
                completion(.failure(reason: .fromError(error)))
        })
    }
}
