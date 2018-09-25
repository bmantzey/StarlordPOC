//
//  StarlordAccessoryRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordAccessoryRecord: StarlordBinaryStruct {
    struct AccessoryConfiguration: StarlordBinaryStruct {
        /// Value: 2
        var type: UInt8 // 1
        /// (ms)
        /// Value: 0
        var startupTime: UInt32 // 5
        /// (ms)
        /// Value: 0
        var shutoffTime: UInt32 // 9
        
        mutating func generateData() -> Data {
            var data = Data()
            
            data.append(UnsafeBufferPointer(start: &self.type, count: 1))
            data.append(UnsafeBufferPointer(start: &self.startupTime, count: 1))
            data.append(UnsafeBufferPointer(start: &self.shutoffTime, count: 1))

            return data
        }        
    }
    
    /// Value: 45
    var lengthOfRecordData: UInt16 // 2
    var crcOfRecordData: UInt16 // 4
    /// 5 of them
    var accessoryConfigurations: ContiguousArray<AccessoryConfiguration> // 9 * 5 = 45 + 4 = [ 49 ]
    
    ///// Filler
    let fillerData: UInt64 = 0 // 57
    let fillerData2: UInt64 = 0 // 65
    let fillerData3: UInt64 = 0 // 73
    let fillerData4: UInt64 = 0 // 81
    let fillerData5: UInt64 = 0 // 89
    let fillerData6: UInt64 = 0 // 97
    let fillerData7: UInt16 = 0 // 99
    let fillerData8: UInt8 = 0  // 100
    /////

    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        
        for i in 0..<5 {
            var anAccessoryConfig = accessoryConfigurations[i]
            let anAccessorData = anAccessoryConfig.generateData()
            data.append(anAccessorData)
        }
        
        ///// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 51)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////

        ///// CRC
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.crcOfRecordData = crc16(bytes: ptr, offset: 4, length: 96)
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
