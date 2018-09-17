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
        let inputReadingOffset: UInt32
        let inputReadingFactor: Float
        let input: UInt8
        let label: UnsafePointer<CChar> // 21 characters

        mutating func generateData() -> Data {
            var data = Data()
            
            data.append(UnsafeBufferPointer(start: &self.inputReadingOffset, count: 1))
            data.append(UnsafeBufferPointer(start: &self.inputReadingFactor, count: 1))
            data.append(UnsafeBufferPointer(start: &self.input, count: 1))
            data.append(UnsafeBufferPointer(start: &self.label.pointee, count: 21))
            
            return data
        }

    }
    struct CustomInputDigital: StarlordBinaryStruct {
        /// (units)
        let unitsPerPulse: Float
        let isAccumulator: Bool
        let input: UInt8
        let activeState: Bool
        let readingTriggerType: UInt8
        let label: UnsafePointer<CChar> // 21 characters
        
        mutating func generateData() -> Data {
            var data = Data()
            
            data.append(UnsafeBufferPointer(start: &self.unitsPerPulse, count: 1))
            data.append(UnsafeBufferPointer(start: &self.isAccumulator, count: 1))
            data.append(UnsafeBufferPointer(start: &self.input, count: 1))
            data.append(UnsafeBufferPointer(start: &self.activeState, count: 1))
            data.append(UnsafeBufferPointer(start: &self.readingTriggerType, count: 1))
            data.append(UnsafeBufferPointer(start: &self.label.pointee, count: 21))
            
            return data
        }
    }
    
    /// Value: 295
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    let customAnalogInputs: ContiguousArray<CustomInputAnalog>
    let customDigitalInputs: ContiguousArray<CustomInputDigital>
    
    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.customAnalogInputs[0], count: 5))
        data.append(UnsafeBufferPointer(start: &self.customAnalogInputs[0], count: 5))
        
        return data
    }
}
