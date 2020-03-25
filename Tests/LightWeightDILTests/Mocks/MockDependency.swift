//
//  MockDependency.swift
//  SampleLightWeightDIL
//
//  Created by Sreejith on 25/03/20.
//

import Foundation
@testable import LightWeightDIL

final class MockDependency: Dependency {
    static func create() -> MockDependency {
        return MockDependency()
    }
}
