//
//  StarlordVoltageRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordVoltageRecord: StarlordBinaryStruct {
    /// Value: 9
    var lengthOfRecordData: UInt16 // 2
    var crcOfRecordData: UInt16 // 4
    /// (V)
    /// Value: 0
    var auxVoltageReadingOffset: Float // 8
    /// Value: 0
    var auxVoltageReadingFactor: Float // 12
    /// Value: 11
    var auxVoltageInput: UInt8 // 13
    
    ////// Filler
    let fillerData: UInt16 = 0 // 15
    let fillerData2: UInt8 = 0 // 16
    /////

    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageReadingOffset, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageReadingFactor, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageInput, count: 1))

        // 13 bytes here - need 16
        ///// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 3)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////
        
        ///// CRC
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.crcOfRecordData = crc16(bytes: ptr, offset: 4, length: 12)
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
