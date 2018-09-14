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
        
        let lengthOfRecordDataData = Data(buffer: UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(lengthOfRecordDataData)
        
        let crcOfRecordDataData = Data(buffer: UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(crcOfRecordDataData)
        
        let restartDelayTimeData = Data(buffer: UnsafeBufferPointer(start: &self.restartDelayTime, count: 1))
        data.append(restartDelayTimeData)

        let pressureTargetData = Data(buffer: UnsafeBufferPointer(start: &self.pressureTarget, count: 1))
        data.append(pressureTargetData)

        let pressureReadingOffsetData = Data(buffer: UnsafeBufferPointer(start: &self.pressureReadingOffset, count: 1))
        data.append(pressureReadingOffsetData)

        let pressureReadingFactorData = Data(buffer: UnsafeBufferPointer(start: &self.pressureReadingFactor, count: 1))
        data.append(pressureReadingFactorData)

        let auxPressureReadingOffsetData = Data(buffer: UnsafeBufferPointer(start: &self.auxPressureReadingOffset, count: 1))
        data.append(auxPressureReadingOffsetData)

        let auxPressureReadingFactorData = Data(buffer: UnsafeBufferPointer(start: &self.auxPressureReadingFactor, count: 1))
        data.append(auxPressureReadingFactorData)

        let flowAnalogReadingOffsetData = Data(buffer: UnsafeBufferPointer(start: &self.flowAnalogReadingOffset, count: 1))
        data.append(flowAnalogReadingOffsetData)

        let flowAnalogReadingFactorData = Data(buffer: UnsafeBufferPointer(start: &self.flowAnalogReadingFactor, count: 1))
        data.append(flowAnalogReadingFactorData)

        let flowDigitalReadingUnitsPerPulseData = Data(buffer: UnsafeBufferPointer(start: &self.flowDigitalReadingUnitsPerPulse, count: 1))
        data.append(flowDigitalReadingUnitsPerPulseData)

        let pressureReadingInputData = Data(buffer: UnsafeBufferPointer(start: &self.pressureReadingInput, count: 1))
        data.append(pressureReadingInputData)

        let auxPressureReadingInputData = Data(buffer: UnsafeBufferPointer(start: &self.auxPressureReadingInput, count: 1))
        data.append(auxPressureReadingInputData)

        let flowReadingInputData = Data(buffer: UnsafeBufferPointer(start: &self.flowReadingInput, count: 1))
        data.append(flowReadingInputData)

        let flowDigitalReadingTriggerTypeData = Data(buffer: UnsafeBufferPointer(start: &self.flowDigitalReadingTriggerType, count: 1))
        data.append(flowDigitalReadingTriggerTypeData)

        let isFlowReadingAnalogData = Data(buffer: UnsafeBufferPointer(start: &self.isFlowReadingAnalog, count: 1))
        data.append(isFlowReadingAnalogData)

        return data

    }
}
