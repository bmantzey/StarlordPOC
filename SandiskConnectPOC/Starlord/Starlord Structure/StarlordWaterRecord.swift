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
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    /// (ms)
    var restartDelayTime: UInt32
    /// (pa)
    var pressureTarget: UInt32
    /// (pa)
    var pressureReadingOffset: UInt32
    var pressureReadingFactor: Float
    /// (pa)
    var auxPressureReadingOffset: UInt32
    var auxPressureReadingFactor: Float
    /// (ccs)
    var flowAnalogReadingOffset: UInt32
    var flowAnalogReadingFactor: Float
    /// (ccs)
    var flowDigitalReadingUnitsPerPulse: Float
    var pressureReadingInput: UInt8
    var auxPressureReadingInput: UInt8
    var flowReadingInput: UInt8
    var flowDigitalReadingTriggerType: UInt8
    var isFlowReadingAnalog: Bool

    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.restartDelayTime, count: 1))
        data.append(UnsafeBufferPointer(start: &self.pressureTarget, count: 1))
        data.append(UnsafeBufferPointer(start: &self.pressureReadingOffset, count: 1))
        data.append(UnsafeBufferPointer(start: &self.pressureReadingFactor, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureReadingOffset, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureReadingFactor, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flowAnalogReadingOffset, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flowAnalogReadingFactor, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flowDigitalReadingUnitsPerPulse, count: 1))
        data.append(UnsafeBufferPointer(start: &self.pressureReadingInput, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxPressureReadingInput, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flowReadingInput, count: 1))
        data.append(UnsafeBufferPointer(start: &self.flowDigitalReadingTriggerType, count: 1))
        data.append(UnsafeBufferPointer(start: &self.isFlowReadingAnalog, count: 1))

        return data

    }
}
