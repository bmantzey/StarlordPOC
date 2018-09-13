//
//  StarlordProductMiscRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordProductMiscRecord: StarlordBinaryStruct {
    /// Value: 6
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// Value: 0
    let resetCause: UInt8
    /// Value: 0
    let disableFaults: Bool
    let transformerRatio: Float
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)
        
        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt8>.size + offset
        resetCause = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Bool>.size + offset
        disableFaults = boolValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        transformerRatio = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
    }
}
