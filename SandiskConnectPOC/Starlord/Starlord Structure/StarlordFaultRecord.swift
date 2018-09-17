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
        
        return data
    }
}
