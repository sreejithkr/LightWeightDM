//
//  ResolverTests.swift
//  SampleLightWeightDIL
//
//  Created by Sreejith on 25/03/20.
//

import XCTest
@testable import LightWeightDIL

class ResolverTests: XCTestCase {
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResolverHoldDependencyTypeInformation() {
        let resolver = Resolver.directType(MockDependency.self)
        XCTAssertNotNil(resolver.type as? MockDependency.Type)
    }
}
