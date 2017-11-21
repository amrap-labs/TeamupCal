//
//  CacheManager.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 15/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation

internal class CacheStore<ItemType : Cacheable> {
    
    private typealias Item = CacheItem<ItemType>
    
    private let container: CacheContainer
    private var map = [Int: Item]()
    
    init(for container: CacheContainer) {
        self.container = container
    }
    
    func item(for identifier: CacheIdentifier, completion: (ItemType?) -> Void) {
        
    }
    
    func persist(_ item: ItemType, completion: ((Bool) -> Void)?) {
        let item = Item(for: item)
        map[item.hashValue] = item
        
        container.save(data: item,
                       with: item.identifier)
        { (result) in
            switch result {
            case .success:
                completion?(true)
            case .failure:
                completion?(false)
            }
        }
    }
}
