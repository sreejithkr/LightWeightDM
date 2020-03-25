//
//  RegistryTests.swift
//  SampleLightWeightDIL
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

import XCTest
@testable import LightWeightDIL

class RegistryTests: XCTestCase {
    
    var registry: Registry!

    override func setUp() {
        registry = Registry()
    }

    override func tearDown() {
        registry = nil
    }

    func testAddToStoreAddsToStoreWithCorrectDependecny() {
        let key = RegistryKey.generateKey(for: RegistryTests.self)
        let dependencyResolver = Resolver.directType(MockDependency.self)
        registry.addToStore(with: key, resolverType: dependencyResolver)
        XCTAssertTrue(registry.store.count > 0)
        let dependency:MockDependency.Type? = registry.resolve(for: key) as? MockDependency.Type
        XCTAssertNotNil(dependency)
    }
    
    func testResolveMethodReturnsNilForKeyWithNotDependenycRegistered() {
        let key = RegistryKey.generateKey(for: RegistryTests.self)
        let dependency: Dependency.Type? =  registry.resolve(for: key)
        XCTAssertNil(dependency)
    }
}
