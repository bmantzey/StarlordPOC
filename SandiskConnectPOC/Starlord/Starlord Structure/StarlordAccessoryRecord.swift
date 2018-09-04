//
//  StarlordAccessoryRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordAccessoryRecord {
    struct AccessoryConfiguration {
        let type: UInt8
        /// (ms)
        let startupTime: UInt32
        /// (ms)
        let shutoffTime: UInt32
    }
    
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// 5 of them
    let accessoryConfigurations: [AccessoryConfiguration]
}
