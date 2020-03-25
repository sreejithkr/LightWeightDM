//
//  RegistryProtocol.swift
//  
//
//  Created by Sreejith on 14/03/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

protocol RegistryProtocol {
    associatedtype Key: Hashable
    associatedtype Value
    var store: [Key: Value] { get }
    init()
}
