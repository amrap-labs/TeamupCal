//
//  Cacheable.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 20/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

protocol Cacheable {
    
    var lifetime: CacheLifetime { get }
    var identifier: CacheIdentifier { get }
}
