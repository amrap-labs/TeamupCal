//
//  CacheItem.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 20/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

class CacheItem<Item : Cacheable>: Codable, Hashable {
    
    // MARK: Properties
    
    let data: Item
    
    var identifier: CacheIdentifier {
        return data.cacheIdentifier
    }
    var lifetime: CacheLifetime {
        return data.cacheLifetime
    }
    
    // MARK: Init
    
    init(for item: Item) {
        self.data = item
    }
}

extension CacheItem {
    
    var hashValue: Int {
        return data.hashValue
    }
    
    static func ==(lhs: CacheItem, rhs: CacheItem) -> Bool {
        return lhs.data == rhs.data
    }
}
