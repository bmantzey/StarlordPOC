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
    var lengthOfRecord: UInt16 // 2
    var crcOfRecordData: UInt16 // 4
    /// Value: 11
    var rainInput: UInt8 // 5
    
    //// Filler
    let fillerData: UInt32 = 0 // 9
    let fillerData2: UInt8 = 0 // 10
    ////
    
    mutating func generateData() -> Data {
        var data = Data()

        data.append(UnsafeBufferPointer(start: &self.lengthOfRecord, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.rainInput, count: 1))
        
        
        ///// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 5)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////
        
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.crcOfRecordData = crc16(bytes: ptr, offset: 4, length: 6)
        }
        
        data.replaceSubrange(2..<4, with: UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        
        return data
    }
}
