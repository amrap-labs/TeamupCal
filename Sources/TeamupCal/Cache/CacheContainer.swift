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
    
    enum CacheOperationResult {
        case success
        case failure(error: Error)
    }
    
    typealias CacheOperationCompletion = (CacheOperationResult) -> Void
    
    func save<T: Encodable>(data: T,
                            with identifier: CacheIdentifier,
                            completion: CacheOperationCompletion?) {
        let path = filePath(with: identifier)
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try Disk.save(data, to: .caches, as: path)
                DispatchQueue.main.async {
                    completion?(.success)
                }
            } catch {
                DispatchQueue.main.async {
                    completion?(.failure(error: error))
                }
            }
        }
    }
    
    // MARK: File path
    
    private func filePath(with identifier: String) -> String {
        return "\(fullPath)/\(identifier).json"
    }
}
