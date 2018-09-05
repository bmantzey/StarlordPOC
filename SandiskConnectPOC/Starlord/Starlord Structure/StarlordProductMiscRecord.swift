//
//  StarlordProductMiscRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordProductMiscRecord {
    /// Value: 6
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// Value: 0
    let resetCause: UInt8
    /// Value: 0
    let disableFaults: Bool
    let transformerRatio: Float
}
