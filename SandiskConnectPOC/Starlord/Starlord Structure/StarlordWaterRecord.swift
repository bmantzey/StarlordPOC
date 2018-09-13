//
//  StarlordWaterRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordWaterRecord: StarlordBinaryStruct {
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
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        restartDelayTime = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        pressureTarget = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        pressureReadingOffset = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        pressureReadingFactor = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        auxPressureReadingOffset = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        auxPressureReadingFactor = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flowAnalogReadingOffset = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flowAnalogReadingFactor = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flowDigitalReadingUnitsPerPulse = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt8>.size + offset
        pressureReadingInput = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt8>.size + offset
        auxPressureReadingInput = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt8>.size + offset
        flowReadingInput = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt8>.size + offset
        flowDigitalReadingTriggerType = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Bool>.size + offset
        isFlowReadingAnalog = boolValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
    }
    
}
