//
//  CacheManager.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal class CacheManager<ItemType : Cacheable> {
    
    private typealias Item = CacheItem<ItemType>
    
    private var map = [Int : CacheItem<ItemType>]()
    
    func item(for identifier: CacheIdentifier, completion: (ItemType?) -> Void) {
        
    }
    
    func persist(_ item: ItemType, completion: ((Bool) -> Void)?) {
        
    }
}
