//
//  StarlordProductMiscRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordProductMiscRecord {
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    let resetCause: UInt8
    let disableFaults: Bool
    let transformerRatio: Float
}
