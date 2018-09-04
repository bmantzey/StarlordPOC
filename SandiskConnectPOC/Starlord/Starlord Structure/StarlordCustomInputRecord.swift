//
//  StarlordCustomInputRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordCustomInputRecord {
    struct CustomInputAnalog {
        /// (units)
        let inputReadingOffset: UInt32
        let inputReadingFactor: Float
        let input: UInt8
        let label: [CChar]
    }
    struct CustomInputDigital {
        /// (units)
        let unitsPerPulse: Float
        let isAccumulator: Bool
        let input: UInt8
        let activeState: Bool
        let readingTriggerType: UInt8
        let label: [CChar]
    }
    
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    let customAnalogInputs: [CustomInputAnalog]
    let customDigitalInputs: [CustomInputDigital]
}
