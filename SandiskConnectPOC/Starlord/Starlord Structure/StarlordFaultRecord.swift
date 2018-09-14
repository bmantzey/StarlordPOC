//
//  StarlordFaultRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

// LEFTOFF: Follow the rest of the patterns seen in FileHeader -> AccessoryRecord.

struct StarlordFaultRecord: StarlordBinaryStruct {
    /// Value: 150
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (points)
    let rainfallThreshold: UInt16
    /// (ms)
    let rainfallTimer: UInt32
    /// (ccs)
    let flow2HighThreshold: Float
    /// (ms)
    let flow2HighTime: UInt32
    /// (ccs)
    let flow2HighWarningThreshold: Float
    /// (ms)
    let flow2HighWarningTime: UInt32
    /// (ccs)
    let flow2LowThreshold: Float
    /// (ms)
    let flow2LowTime: UInt32
    /// (ccs)
    let flow2LowWarningThreshold: Float
    /// (ms)
    let flow2LowWarningTime: UInt32
    /// (ccs)
    let flow1HighThreshold: Float
    /// (ms)
    let flow1HighTime: UInt32
    /// (ccs)
    let flow1HighWarningThreshold: Float
    /// (ms)
    let flow1HighWarningTime: UInt32
    /// (ccs)
    let flow1LowThreshold: Float
    /// (ms)
    let flow1LowTime: UInt32
    /// (ccs)
    let flow1LowWarningThreshold: Float
    /// (ms)
    let flow1LowWarningTime: UInt32
    /// (C )
    let temperatureLowThreshold: Float
    /// (ms)
    let temperatureLowTime: UInt32
    /// (pa)
    let auxPressureHighThreshold: Float
    /// (ms)
    let auxPressureHighTime: UInt32
    /// (pa)
    let auxPressureLowThreshold: Float
    /// (ms)
    let auxPressureLowTime: UInt32
    /// (pa)
    let auxPressureLowWarningThreshold: Float
    /// (ms)
    let auxPressureLowWarningTime: UInt32
    /// (ms)
    let pressurizationTime: UInt32
    /// (pa)
    let systemPressureHighThreshold: Float
    /// (ms)
    let systemPressureHighTime: UInt32
    /// (pa)
    let systemPressureLowThreshold: Float
    /// (ms)
    let systemPressureLowTime: UInt32
    /// (pa)
    let systemPressureLowWarningThreshold: Float
    /// (ms)
    let systemPressureLowWarningTime: UInt32
    /// (V)
    let systemVoltageHighThreshold: UInt32
    /// (ms)
    let systemVoltageHighTime: UInt32
    /// (V)
    let systemVoltageLowThreshold: UInt32
    /// (ms)
    let systemVoltageLowTime: UInt32
    /// (ms)
    let stallTime: UInt32
    
    init(withData: Data) {
        let unnecessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecordData = uint16Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        rainfallThreshold = uint16Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        rainfallTimer = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow2HighThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow2HighTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow2HighWarningThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow2HighWarningTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow2LowThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow2LowTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow2LowWarningThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow2LowWarningTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow1HighThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow1HighTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow1HighWarningThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow1HighWarningTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow1LowThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow1LowTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        flow1LowWarningThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        flow1LowWarningTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        temperatureLowThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        temperatureLowTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        auxPressureHighThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        auxPressureHighTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        auxPressureLowThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        auxPressureLowTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        auxPressureLowWarningThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        auxPressureLowWarningTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        pressurizationTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        systemPressureHighThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        systemPressureHighTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        systemPressureLowThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        systemPressureLowTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<Float>.size + offset
        systemPressureLowWarningThreshold = floatValue(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        systemPressureLowWarningTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        systemVoltageHighThreshold = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        systemVoltageHighTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        systemVoltageLowThreshold = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        systemVoltageLowTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt32>.size + offset
        stallTime = uint32Value(data: unnecessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
    }
}
