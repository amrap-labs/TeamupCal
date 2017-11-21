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
    
    // MARK: Loading
    
    func item(for identifier: CacheIdentifier,
              completion: @escaping ((ItemType?) -> Void)) {
        
        if let item = map[identifier] {
            guard self.isAValid(item: item) else {
                completion(nil)
                return
            }
            
            completion(item.data)
            
        } else { // fallback to disk
            
            container.read(dataWith: identifier,
                           as: Item.self,
                           completion:
                { (item, error) in
                    guard self.isAValid(item: item) else {
                        completion(nil)
                        return
                    }
                    
                    self.map[identifier] = item
                    completion(item?.data)
            })
        }
    }
    
    private func isAValid(item: Item?) -> Bool {
        guard let item = item else {
            return false
        }
        let isStale = item.isStale
        if isStale {
            map.removeValue(forKey: item.identifier)
        }
        return !isStale
    }
    
    // MARK: Persisting
    
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
