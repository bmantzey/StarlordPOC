//
//  StarlordRainRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordRainRecord: StarlordBinaryStruct {
    /// Value: 1
    var lengthOfRecordData: UInt16 // 2
    var crcOfRecordData: UInt16 // 4
    /// Value: 11
    var rainInput: UInt8 // 5
    
    //// Filler
    let fillerData: UInt32 = 0 // 9
    let fillerData2: UInt8 = 0 // 10
    ////
    
    mutating func generateData() -> Data {
        var data = Data()

        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.rainInput, count: 1))
        
        ///// Length
        self.lengthOfRecordData = UInt16(data.count - 4)
        data.replaceSubrange(0..<2, with: &self.lengthOfRecordData, count: 2)
        /////

        ///// CRC
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.crcOfRecordData = compCRC16(bytes: ptr, offset: 4, length: data.count - 4)
        }
        data.replaceSubrange(2..<4, with: &self.crcOfRecordData, count: 2)
        /////

        ///// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 5)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////
        
        return data
    }
}
