//
//  StarlordTemperatureRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordTemperatureRecord {
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (C )
    let temperatureReadingOffset: Float
    let temperatureReadingFactor: Float
    let temperatureInput: UInt8
}
