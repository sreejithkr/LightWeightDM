//
//  MockDependencyReplaced.swift
//  LightWeightDM
//
//  Created by Sreejith on 25/03/20.
//

import Foundation
@testable import LightWeightDM

final class MockManagerReplaced: Dependency {
    static func create() -> MockManagerReplaced {
        return MockManagerReplaced()
    }
}
