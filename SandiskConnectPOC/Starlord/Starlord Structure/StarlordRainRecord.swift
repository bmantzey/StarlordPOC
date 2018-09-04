//
//  StarlordRainRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordRainRecord {
    let lengthOfRecord: UInt16
    let crcOfRecordData: UInt16
    let rainInput: UInt8
}
