//
//  DependancyManagerTests.swift
//  SampleLightWeightDIL
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

import XCTest
@testable import LightWeightDIL

class DependancyManagerTests: XCTestCase {
    var dependencyManager: DependancyManager!
    override func setUp() {
        dependencyManager = DependancyManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIfRegisterWillAddDependencyForReplaceFalse() {
        let key = RegistryKey(stringLiteral: "mock_key")
        let resolver = Resolver.directType(MockDependency.self)
        dependencyManager.register(for: key, with: resolver, replace: false)
        XCTAssertNotNil(dependencyManager.dependency(for: key))
    }

    func testIfRegisterWillAddDependencyForReplaceTrue() {
        let key = RegistryKey(stringLiteral: "mock_key")
        let resolver = Resolver.directType(MockDependency.self)
        dependencyManager.register(for: key, with: resolver, replace: true)
        XCTAssertNotNil(dependencyManager.dependency(for: key))
    }
    
    func testIfRegisterdDeppedancyTypeIsReplaced() {
        let key = RegistryKey(stringLiteral: "mock_key")
        let resolver1 = Resolver.directType(MockDependency.self)
        dependencyManager.register(for: key, with: resolver1, replace: true)
        let dependency: MockDependency! = dependencyManager.dependency(for: key)
        XCTAssertNotNil(dependency)
       
        let resolver2 = Resolver.directType(MockManagerReplaced.self)
        dependencyManager.register(for: key, with: resolver2, replace: true)
        let dependencyReplaced: MockManagerReplaced! = dependencyManager.dependency(for: key)
        XCTAssertNotNil(dependencyReplaced)
        XCTAssertNotNil(dependencyManager.dependency(for: key))
    }
    
    func testIfRegisterdDeppedancyTypeIsNotReplaced() {
        let key = RegistryKey(stringLiteral: "mock_key")
        let resolver1 = Resolver.directType(MockDependency.self)
        dependencyManager.register(for: key, with: resolver1, replace: false)
        var dependency: MockDependency! = dependencyManager.dependency(for: key)
        XCTAssertNotNil(dependency)
        let resolver2 = Resolver.directType(MockManagerReplaced.self)
        dependencyManager.register(for: key, with: resolver2, replace: false)
        let dependencyReplaced: MockManagerReplaced! = dependencyManager.dependency(for: key)
        dependency = dependencyManager.dependency(for: key)
        XCTAssertNotNil(dependency)
        XCTAssertNotNil(dependencyManager.dependency(for: key))
        XCTAssertNil(dependencyReplaced)
    }

    func testIfDeppedancyTypeReturnsCorrectRegisterdType() {
        let key = RegistryKey(stringLiteral: "mock_key")
        let resolver = Resolver.directType(MockDependency.self)
        dependencyManager.register(for: key, with: resolver, replace: true)
        let dependency: MockDependency.Type! = dependencyManager.dependencyType(for: key)
        XCTAssertNotNil(dependency)
    }
    
    
    func testIfDeppedancyTypeReplacesDependencyForTrueFlag() {
        let key = RegistryKey(stringLiteral: "mock_key")
        let resolver1 = Resolver.directType(MockDependency.self)
        dependencyManager.register(for: key, with: resolver1, replace: true)
        let dependency: MockDependency.Type! = dependencyManager.dependencyType(for: key)
        XCTAssertNotNil(dependency)
        
        let resolver2 = Resolver.directType(MockManagerReplaced.self)
        dependencyManager.register(for: key, with: resolver2, replace: true)
        let dependencyReplaced: MockManagerReplaced.Type! = dependencyManager.dependency(for: key)
        XCTAssertNil(dependencyReplaced)
    }

    func testIfDeppedancyTypeDoesNotReplacesDependencyForFalseFlag() {
        let key = RegistryKey(stringLiteral: "mock_key")
        let resolver1 = Resolver.directType(MockDependency.self)
        dependencyManager.register(for: key, with: resolver1, replace: false)
        var dependency: MockDependency.Type! = dependencyManager.dependencyType(for: key)
        XCTAssertNotNil(dependency)
        
        let resolver2 = Resolver.directType(MockManagerReplaced.self)
        dependencyManager.register(for: key, with: resolver2, replace: false)
        let dependencyReplaced: MockManagerReplaced.Type! = dependencyManager.dependency(for: key)
        dependency = dependencyManager.dependencyType(for: key)
        XCTAssertNotNil(dependency)
        XCTAssertNotNil(dependencyManager.dependency(for: key))
        XCTAssertNil(dependencyReplaced)
    }
}
