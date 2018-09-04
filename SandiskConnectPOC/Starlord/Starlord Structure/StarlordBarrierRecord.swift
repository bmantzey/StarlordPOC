//
//  StarlordBarrierRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordBarrierRecord {
    struct Barrier {
        let holdTime: UInt32
        let angle: Float
        let type: UInt8
        let action: UInt8
        let isEnabled: Bool
    }
    
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// 5 of them
    let barrierConfigurations: [Barrier]
}
