//
//  StarlordRainRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordRainRecord: StarlordBinaryStruct {
    /// Value: 1
    let lengthOfRecord: UInt16
    let crcOfRecordData: UInt16
    let rainInput: UInt8
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecord = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt8>.size + offset
        rainInput = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
    }
}
