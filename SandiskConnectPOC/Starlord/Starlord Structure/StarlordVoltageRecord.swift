//
//  StarlordVoltageRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordVoltageRecord: StarlordBinaryStruct {
    /// Value: 9
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (V)
    let auxVoltageReadingOffset: Float
    let auxVoltageReadingFactor: Float
    let auxVoltageInput: UInt8
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        auxVoltageReadingOffset = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        auxVoltageReadingFactor = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt8>.size + offset
        auxVoltageInput = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)    }
}
