//
//  RegistryKeyTest.swift
//  SampleLightWeightDIL
//
//  Created by Sreejith on 25/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

import XCTest
@testable import LightWeightDIL

class RegistryKeyTest: XCTestCase {
    
    func testRegistryKeyHasNameWithoutPrefixGenerateMethod() {
        let registryKey  = RegistryKey.generateKey(for: RegistryKeyTest.self)
        XCTAssertEqual(registryKey.name, "RegistryKeyTest")
    }
    
    func testRegistryKeyHasNameWithPrefixGenerateMethod() {
        let registryKey  = RegistryKey.generateKey(for: RegistryKeyTest.self, with: "WithPrefix")
        XCTAssertEqual(registryKey.name, "RegistryKeyTestWithPrefix")
    }
    
}
