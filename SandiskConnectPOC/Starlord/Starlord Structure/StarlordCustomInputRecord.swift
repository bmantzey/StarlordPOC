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
        var inputReadingOffset: UInt32 // 4
        /// Value: 0
        var inputReadingFactor: Float // 8
        /// Value: 11
        var input: UInt8 // 9
        /// Value: <Empty String>
        /// 21 characters
        var label: ContiguousArray<CChar> // 30
        
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
        var unitsPerPulse: Float // 4
        /// Value: 0
        var isAccumulator: Bool // 5
        /// Value: 11
        var input: UInt8 // 6
        /// Value: 1
        var activeState: Bool // 7
        /// Value: 0
        var readingTriggerType: UInt8 // 8
        /// Value: <Empty String>
        /// 21 characters
        var label: ContiguousArray<CChar> // 29
        
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
    var lengthOfRecordData: UInt16 // 2
    var crcOfRecordData: UInt16 // 4
    var customAnalogInputs: ContiguousArray<CustomInputAnalog> // 30 * 5 = 150 + 4 = 154
    var customDigitalInputs: ContiguousArray<CustomInputDigital> // 29 * 5 = 145 + 154 = 299
    
    //// Filler Data
    let fillerData: UInt64 = 0 // 307
    let fillerData1: UInt64 = 0 // 315
    let fillerData2: UInt64 = 0 // 323
    let fillerData3: UInt64 = 0 // 331
    let fillerData4: UInt64 = 0 // 339
    let fillerData5: UInt64 = 0 // 347
    let fillerData6: UInt64 = 0 // 355
    let fillerData7: UInt64 = 0 // 363
    let fillerData8: UInt64 = 0 // 371
    let fillerData9: UInt64 = 0 // 379
    let fillerData10: UInt64 = 0 // 387
    let fillerData11: UInt64 = 0 // 395
    let fillerData12: UInt64 = 0 // 403
    let fillerData13: UInt64 = 0 // 411
    let fillerData14: UInt64 = 0 // 419
    let fillerData15: UInt64 = 0 // 427
    let fillerData16: UInt64 = 0 // 435
    let fillerData17: UInt64 = 0 // 443
    let fillerData18: UInt64 = 0 // 451
    let fillerData19: UInt64 = 0 // 459
    let fillerData20: UInt64 = 0 // 467
    let fillerData21: UInt64 = 0 // 475
    let fillerData22: UInt64 = 0 // 483
    let fillerData23: UInt64 = 0 // 491
    let fillerData24: UInt64 = 0 // 499
    let fillerData25: UInt8 = 0 // 500

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

        ///// Length
        self.lengthOfRecordData = UInt16(data.count - 4)
        data.replaceSubrange(0..<2, with: UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        /////

        ///// CRC
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.crcOfRecordData = compCRC16(bytes: ptr, offset: 4, length: data.count - 4)
        }
        data.replaceSubrange(2..<4, with: UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        /////

        ///// Filler Data
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 201)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////

        return data
    }
}
