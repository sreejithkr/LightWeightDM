//
//  DependancyManager.swift
//  MockDependencyReplaced
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

import Foundation


public struct DependancyManager {
    public init() {
        registry = Registry()
    }
    private var registry: Registry

    public mutating func register(for key: RegistryKey,
                           with dependency: Resolver,
                           replace: Bool) {
        registry.addToStore(with: key, resolverType: dependency, replace: replace)
    }
    
    public func dependencyType<T>(for key: RegistryKey) -> T.Type? {
        return registry.resolve(for: key) as? T.Type
    }
    
    public func dependency<T>(for key: RegistryKey) -> T?{
        return registry.resolve(for: key)?.create() as? T
    }
}
