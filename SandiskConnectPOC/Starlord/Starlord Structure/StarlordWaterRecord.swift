//
//  StarlordWaterRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordWaterRecord {
    /// Value: 41
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (ms)
    let restartDelayTime: UInt32
    /// (pa)
    let pressureTarget: UInt32
    /// (pa)
    let pressureReadingOffset: UInt32
    let pressureReadingFactor: Float
    /// (pa)
    let auxPressureReadingOffset: UInt32
    let auxPressureReadingFactor: Float
    /// (ccs)
    let flowAnalogReadingOffset: UInt32
    let flowAnalogReadingFactor: Float
    /// (ccs)
    let flowDigitalReadingUnitsPerPulse: Float
    let pressureReadingInput: UInt8
    let auxPressureReadingInput: UInt8
    let flowReadingInput: UInt8
    let flowDigitalReadingTriggerType: UInt8
    let isFlowReadingAnalog: Bool
}
