//
//  RegistryKey.swift
//  MockDependencyReplaced
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

public struct RegistryKey: Hashable {
    var name: String

    init(stringLiteral name: String) {
        self.name = name
    }

    public static func generateKey<T>(for type: T.Type, with prefix: String? = nil) -> RegistryKey {
        return RegistryKey(stringLiteral: "\(type)\(prefix ?? "")")
    }

}
