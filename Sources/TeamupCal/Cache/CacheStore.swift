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
    private var map = [CacheIdentifier: Item]()
    
    init(for container: CacheContainer) {
        self.container = container
    }
    
    func item(for identifier: CacheIdentifier,
              completion: @escaping ((ItemType?) -> Void)) {
        
        if let item = map[identifier] {
            completion(item.data)
            
        } else { // fallback to disk
            
            container.read(dataWith: identifier,
                           as: Item.self,
                           completion:
                { (item, error) in
                    completion(item?.data)
            })
        }
    }
    
    func persist(_ item: ItemType, completion: ((Bool) -> Void)?) {
        let item = Item(for: item)
        map[item.identifier] = item
        
        container.save(data: item,
                       with: item.identifier)
        { (error) in
            completion?(error == nil)
        }
    }
}
