//
//  Resolver.swift
//  MockDependencyReplaced
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

public protocol Dependency {
    static func create() -> Self
}
