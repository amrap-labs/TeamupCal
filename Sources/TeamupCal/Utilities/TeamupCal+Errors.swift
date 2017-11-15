//
//  TeamupCal+Meta.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

public extension TeamupCal {
    
    public enum FailureReason {
        case unauthorized
        case other(error: Error)
        case unknown
    }
}

internal extension TeamupCal.FailureReason {
    
    static func fromError(_ error: Error) -> TeamupCal.FailureReason {
        let error = error as NSError
        switch error.code {
        case 401:
            return .unauthorized
        default:
            return .other(error: error)
        }
    }
}
