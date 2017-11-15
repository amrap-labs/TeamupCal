//
//  SessionsLoader.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

internal protocol SessionsLoader {
    
    var sessions: SessionsController? { get }
    
    init(teamup: Teamup)
}
