//
//  Results.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 20/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

internal enum SessionsLoadResult {
    case success(sessions: [Session])
    case failure(reason: TeamupCal.FailureReason)
}
