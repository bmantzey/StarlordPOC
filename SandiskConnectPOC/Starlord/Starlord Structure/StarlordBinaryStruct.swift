//
//  StarlordBinaryStruct.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/13/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

let isBigEndian = false

protocol StarlordBinaryStruct {
    mutating func generateData() -> Data
}
