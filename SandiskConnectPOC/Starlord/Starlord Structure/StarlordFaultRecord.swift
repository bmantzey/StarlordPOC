//
//  StarlordFaultRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordFaultRecord: StarlordBinaryStruct {
    /// Value: 150
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    /// (points)
    /// Value: 200
    var rainfallThreshold: UInt16
    /// (ms)
    /// Value: 60000
    var rainfallTimer: UInt32
    /// (ccs)
    /// Value: 94635.29
    var flow2HighThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow2HighTime: UInt32
    /// (ccs)
    /// Value: 63090.2
    var flow2HighWarningThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow2HighWarningTime: UInt32
    /// (ccs)
    /// Value: 6309.02
    var flow2LowThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow2LowTime: UInt32
    /// (ccs)
    /// Value: 12618.03933
    var flow2LowWarningThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow2LowWarningTime: UInt32
    /// (ccs)
    /// Value: 94635.295
    var flow1HighThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow1HighTime: UInt32
    /// (ccs)
    /// Value: 63090.19667
    var flow1HighWarningThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow1HighWarningTime: UInt32
    /// (ccs)
    /// Value: 6309.019667
    var flow1LowThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow1LowTime: UInt32
    /// (ccs)
    /// Value: 12618.03933
    var flow1LowWarningThreshold: Float
    /// (ms)
    /// Value: 60000
    var flow1LowWarningTime: UInt32
    /// (C )
    /// Value: 0
    var temperatureLowThreshold: Float
    /// (ms)
    /// Value: 60000
    var temperatureLowTime: UInt32
    /// (pa)
    /// Value: 1034214
    var auxPressureHighThreshold: Float
    /// (ms)
    /// Value: 60000
    var auxPressureHighTime: UInt32
    /// (pa)
    /// Value: 68947.6
    var auxPressureLowThreshold: Float
    /// (ms)
    /// Value: 60000
    var auxPressureLowTime: UInt32
    /// (pa)
    /// Value: 103421.4
    var auxPressureLowWarningThreshold: Float
    /// (ms)
    /// Value: 60000
    var auxPressureLowWarningTime: UInt32
    /// (ms)
    /// Value: 60000
    var pressurizationTime: UInt32
    /// (pa)
    /// Value: 1034214
    var systemPressureHighThreshold: Float
    /// (ms)
    /// Value: 60000
    var systemPressureHighTime: UInt32
    /// (pa)
    /// Value: 68947.6
    var systemPressureLowThreshold: Float
    /// (ms)
    /// Value: 60000
    var systemPressureLowTime: UInt32
    /// (pa)
    /// Value: 103421.4
    var systemPressureLowWarningThreshold: Float
    /// (ms)
    /// Value: 60000
    var systemPressureLowWarningTime: UInt32
    /// (V)
    /// Value: 140
    var systemVoltageHighThreshold: UInt32
    /// (ms)
    /// Value: 60000
    var systemVoltageHighTime: UInt32
    /// (V)
    /// Value: 90
    var systemVoltageLowThreshold: UInt32
    /// (ms)
    /// Value: 60000
    var systemVoltageLowTime: UInt32
    /// (ms)
    /// Value: 60000
    var stallTime: UInt32
    
    //// Filler
    
    let fillerData: UInt64 = 0 // 162
    let fillerData1: UInt64 = 0 // 170
    let fillerData2: UInt64 = 0 // 178
    let fillerData3: UInt64 = 0 // 186
    let fillerData4: UInt64 = 0 // 194
    let fillerData5: UInt64 = 0 // 202
    let fillerData6: UInt64 = 0 // 210
    let fillerData7: UInt64 = 0 // 218
    let fillerData8: UInt64 = 0 // 226
    let fillerData9: UInt64 = 0 // 234
    let fillerData10: UInt64 = 0 // 242
    let fillerData11: UInt64 = 0 // 250
    let fillerData12: UInt64 = 0 // 258
    let fillerData13: UInt64 = 0 // 266
    let fillerData14: UInt64 = 0 // 274
    let fillerData15: UInt64 = 0 // 282
    let fillerData16: UInt64 = 0 // 290
    let fillerData17: UInt64 = 0 // 298
    let fillerData18: UInt16 = 0 // 300


    
    /////
    
    mutating func generateData() -> Data {
        var data = Data()

        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.rainfallThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.rainfallTimer, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2HighThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2HighTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2HighWarningThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2HighWarningTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2LowThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2LowTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2LowWarningThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow2LowWarningTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1HighThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1HighTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1HighWarningThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1HighWarningTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1LowThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1LowTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1LowWarningThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flow1LowWarningTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.temperatureLowThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.temperatureLowTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureHighThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureHighTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureLowThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureLowTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureLowWarningThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureLowWarningTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.pressurizationTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemPressureHighThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemPressureHighTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemPressureLowThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemPressureLowTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemPressureLowWarningThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemPressureLowWarningTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemVoltageHighThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemVoltageHighTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemVoltageLowThreshold, count: 1))
        data.append(UnsafeBufferPointer(start: &self.systemVoltageLowTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.stallTime, count: 1))
        
        /// 154 bytes here
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 146)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)

        
        return data
    }
}
