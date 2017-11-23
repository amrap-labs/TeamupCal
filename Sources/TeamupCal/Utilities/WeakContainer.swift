//
//  WeakContainer.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 23/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal class WeakContainer<T> {
    
    private weak var rawValue: AnyObject?
    
    var value: T? {
        return rawValue as? T
    }
    
    init(value: T) {
        self.rawValue = value as AnyObject
    }
}
