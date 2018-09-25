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
    var lengthOfRecordData: UInt16 // 2
    var crcOfRecordData: UInt16 // 4
    /// (ms)
    /// Value: 1000
    var restartDelayTime: UInt32 // 8
    /// (pa)
    /// Value: 0
    var pressureTarget: UInt32 // 12
    /// (pa)
    /// Value: 0
    var pressureReadingOffset: UInt32 // 16
    /// Value: 250
    var pressureReadingFactor: Float // 20
    /// (pa)
    /// Value: 0
    var auxPressureReadingOffset: UInt32 // 24
    /// Value: 250
    var auxPressureReadingFactor: Float // 28
    /// (ccs)
    /// Value: 0
    var flowAnalogReadingOffset: UInt32 // 32
    /// Value: 15
    var flowAnalogReadingFactor: Float // 36
    /// (ccs)
    /// Value: 0
    var flowDigitalReadingUnitsPerPulse: Float // 40
    /// Value: 0
    var pressureReadingInput: UInt8 // 41
    /// Value: 5
    var auxPressureReadingInput: UInt8 // 42
    /// Value: 0
    var flowReadingInput: UInt8 // 43
    /// Value: 0
    var flowDigitalReadingTriggerType: UInt8 // 44
    /// Value: 0
    var isFlowReadingAnalog: Bool // 45
    
    //// Filler
    let fillerData: UInt32 = 0 // 49
    let fillerData2: UInt8 = 0 // 50
    /////

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

        ///// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 5)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        //////
        
        ///// CRC
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.crcOfRecordData = crc16(bytes: ptr, offset: 4, length: 46)
        }        
        data.replaceSubrange(2..<4, with: UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        /////
        
        ///// Length
        self.lengthOfRecordData = UInt16(data.count)
        data.replaceSubrange(0..<2, with: UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        /////

        return data

    }
}
