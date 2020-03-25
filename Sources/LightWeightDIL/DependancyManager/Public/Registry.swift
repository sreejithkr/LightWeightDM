//
//  Registry.swift
//  MockDependencyReplaced
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

public struct Registry: RegistryProtocol {
    typealias Value = Resolver
    typealias Key = RegistryKey
    var store: [RegistryKey : Resolver] = [:]
    
    public func resolve(for key: RegistryKey) -> Dependency.Type? {
        return  store[key]?.type
    }

   public  mutating func addToStore(with key: RegistryKey,
                    resolverType: Resolver,
                    replace: Bool = false) {
        if store[key] == nil || replace {
            store[key] = resolverType
        }
    }
}
