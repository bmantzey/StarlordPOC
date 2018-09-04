//
//  StarlordVoltageRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordVoltageRecord {
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (V)
    let auxVoltageReadingOffset: Float
    let auxVoltageReadingFactor: Float
    let auxVoltageInput: UInt8
}
