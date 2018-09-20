//
//  StarlordCustomInputRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordCustomInputRecord: StarlordBinaryStruct {
    struct CustomInputAnalog: StarlordBinaryStruct {
        /// (units)
        /// Value: 0
        var inputReadingOffset: UInt32
        /// Value: 0
        var inputReadingFactor: Float
        /// Value: 11
        var input: UInt8
        /// Value: <Empty String>
        var label: ContiguousArray<CChar> // 21 characters
        
        
        //// Filler Data
        let fillerData: UInt64 = 0 // 299
        let fillerData1: UInt64 = 0
        let fillerData2: UInt64 = 0
        let fillerData3: UInt64 = 0
        let fillerData4: UInt64 = 0
        let fillerData5: UInt64 = 0
        let fillerData6: UInt64 = 0
        let fillerData7: UInt64 = 0
        let fillerData8: UInt64 = 0
        let fillerData9: UInt64 = 0
        let fillerData10: UInt64 = 0
        let fillerData11: UInt64 = 0
        let fillerData12: UInt64 = 0
        let fillerData13: UInt64 = 0
        let fillerData14: UInt64 = 0
        let fillerData15: UInt64 = 0
        let fillerData16: UInt64 = 0
        let fillerData17: UInt64 = 0
        let fillerData18: UInt64 = 0
        let fillerData19: UInt64 = 0
        let fillerData20: UInt64 = 0
        let fillerData21: UInt64 = 0
        let fillerData22: UInt64 = 0
        let fillerData23: UInt64 = 0
        let fillerData24: UInt64 = 0
        let fillerData25: UInt8 = 0


        mutating func generateData() -> Data {
            var data = Data()
            
            data.append(UnsafeBufferPointer(start: &self.inputReadingOffset, count: 1))
            data.append(UnsafeBufferPointer(start: &self.inputReadingFactor, count: 1))
            data.append(UnsafeBufferPointer(start: &self.input, count: 1))
            data.append(UnsafeBufferPointer(start: &self.label[0], count: 21))
            
            return data
        }

    }
    struct CustomInputDigital: StarlordBinaryStruct {
        /// (units)
        /// Value: 0
        var unitsPerPulse: Float
        /// Value: 0
        var isAccumulator: Bool
        /// Value: 11
        var input: UInt8
        /// Value: 1
        var activeState: Bool
        /// Value: 0
        var readingTriggerType: UInt8
        /// Value: <Empty String>
        var label: ContiguousArray<CChar> // 21 characters
        
        mutating func generateData() -> Data {
            var data = Data()
            
            data.append(UnsafeBufferPointer(start: &self.unitsPerPulse, count: 1))
            data.append(UnsafeBufferPointer(start: &self.isAccumulator, count: 1))
            data.append(UnsafeBufferPointer(start: &self.input, count: 1))
            data.append(UnsafeBufferPointer(start: &self.activeState, count: 1))
            data.append(UnsafeBufferPointer(start: &self.readingTriggerType, count: 1))
            data.append(UnsafeBufferPointer(start: &self.label[0], count: 21))
            
            return data
        }
    }
    
    /// Value: 295
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    var customAnalogInputs: ContiguousArray<CustomInputAnalog>
    var customDigitalInputs: ContiguousArray<CustomInputDigital>
    
    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        
        for i in 0..<5 {
            var aCustomAnalogInput = customAnalogInputs[i]
            let aCustomAnalogData = aCustomAnalogInput.generateData()
            data.append(aCustomAnalogData)
        }
        
        for i in 0..<5 {
            var aCustomDigitalInput = customDigitalInputs[i]
            let aCustomDigitalData = aCustomDigitalInput.generateData()
            data.append(aCustomDigitalData)
        }

        ///// Filler Data
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 201)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////

        
        return data
    }
}
