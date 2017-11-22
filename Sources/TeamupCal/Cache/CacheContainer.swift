//
//  CacheContainer.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 21/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import Disk

class CacheContainer {
    
    // MARK: Properties
    
    let path: String
    private(set) weak var parent: CacheContainer?
    
    var fullPath: String {
        return generateFullPath()
    }
    
    // MARK: Init
    
    init(path: String) {
        self.path = path
    }
    
    init(path: String, inside parent: CacheContainer) {
        self.path = path
        self.parent = parent
    }
    
    // MARK: Utility
    
    private func generateFullPath() -> String {
        var fullPath = ""
        var container: CacheContainer = self
        
        while container.parent != nil {
            fullPath.append("\(container.parent!.path)/")
            container = container.parent!
        }
        fullPath.append(path)
        return fullPath
    }
}

extension CacheContainer {
    
    func save<T: Encodable>(data: T,
                            with identifier: CacheIdentifier,
                            completion: ((Error?) -> Void)?) {
        let path = filePath(with: identifier)
        print("CACHE - Writing to \(path)...")
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try Disk.save(data, to: .caches, as: path)
                DispatchQueue.main.async {
                    print("CACHE - Write to \(path) successful")
                    completion?(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    print("CACHE - Write Failed: (\(error.localizedDescription))")
                    completion?(error)
                }
            }
        }
    }
    
    func read<T: Decodable>(dataWith identifier: CacheIdentifier,
                            as type: T.Type,
                            completion: ((T?, Error?) -> Void)?) {
        let path = filePath(with: identifier)
        print("CACHE - Reading from \(path)...")
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let result = try Disk.retrieve(path, from: .caches, as: type)
                DispatchQueue.main.async {
                    print("CACHE - Read from \(path) successful")
                    completion?(result, nil)
                }
            } catch {
                print("CACHE - Read Failed: (\(error.localizedDescription))")
                completion?(nil, error)
            }
        }
    }
    
    func clear(completion: ((Error?) -> Void)?) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try Disk.remove(self.fullPath, from: .caches)
                completion?(nil)
            } catch {
                completion?(error)
            }
        }
    }
    
    // MARK: File path
    
    private func filePath(with identifier: String) -> String {
        return "\(fullPath)/\(identifier).json"
    }
}
