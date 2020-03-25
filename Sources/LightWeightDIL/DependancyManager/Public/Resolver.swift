//
//  ResolverType.swift
//  MockDependencyReplaced
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

public enum Resolver {
    case directType(Dependency.Type)
    var type: Dependency.Type {
        switch self {
        case .directType(let type):
            return type
        }
    }
}
