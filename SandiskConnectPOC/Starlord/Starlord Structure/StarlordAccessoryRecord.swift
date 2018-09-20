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
        var type: UInt8
        /// (ms)
        /// Value: 0
        var startupTime: UInt32
        /// (ms)
        /// Value: 0
        var shutoffTime: UInt32
        
        mutating func generateData() -> Data {
            var data = Data()
            
            data.append(UnsafeBufferPointer(start: &self.type, count: 1))
            data.append(UnsafeBufferPointer(start: &self.startupTime, count: 1))
            data.append(UnsafeBufferPointer(start: &self.shutoffTime, count: 1))

            return data
        }        
    }
    
    /// Value: 45
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    /// 5 of them
    var accessoryConfigurations: ContiguousArray<AccessoryConfiguration>
    
    ///// Filler
    let fillerData: UInt64 // 57
    let fillerData2: UInt64 // 65
    let fillerData3: UInt64 // 73
    let fillerData4: UInt64 // 81
    let fillerData5: UInt64 // 89
    let fillerData6: UInt64 // 97
    let fillerData7: UInt16 // 99
    let fillerData8: UInt8  // 100
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

        return data
    }

}
