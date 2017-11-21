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
    
    let item: Item
    
    var identifier: CacheIdentifier {
        return item.cacheIdentifier
    }
    var lifetime: CacheLifetime {
        return item.cacheLifetime
    }
    
    // MARK: Init
    
    init(for item: Item) {
        self.item = item
    }
}

extension CacheItem {
    
    var hashValue: Int {
        return item.hashValue
    }
    
    static func ==(lhs: CacheItem, rhs: CacheItem) -> Bool {
        return lhs.item == rhs.item
    }
}
