//
//  StarlordBarrierRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordBarrierRecord: StarlordBinaryStruct {
    struct Barrier: StarlordBinaryStruct {
        /// Value: 0, 0, 0, 0, 0
        var holdTime: UInt32 // 4
        /// Value: 0, 0, 0, 0, 0
        var angle: Float // 8
        /// Value: 0, 1, 2, 3, 4
        var type: UInt8 // 9
        /// Value: 0, 0, 0, 0, 0
        var action: UInt8 // 10
        /// Value: 0, 0, 0, 0, 0
        var isEnabled: Bool // 11
        
        mutating func generateData() -> Data {
            var data = Data()
            
            data.append(UnsafeBufferPointer(start: &self.holdTime, count: 1))
            data.append(UnsafeBufferPointer(start: &self.angle, count: 1))
            data.append(UnsafeBufferPointer(start: &self.type, count: 1))
            data.append(UnsafeBufferPointer(start: &self.action, count: 1))
            data.append(UnsafeBufferPointer(start: &self.isEnabled, count: 1))
            
            return data
        }
    }
    
    /// Value: 55
    var lengthOfRecordData: UInt16 // 2
    var crcOfRecordData: UInt16 // 4
    /// 5 of them
    var barrierConfigurations: ContiguousArray<Barrier> // 11 * 5 = 55 + 4 = [ 59 ]
    
    ///// Filler
    let fillerData: UInt64 = 0 // 67
    let fillerData2: UInt64 = 0 // 75
    let fillerData3: UInt64 = 0 // 83
    let fillerData4: UInt64 = 0 // 91
    let fillerData5: UInt64 = 0 // 99
    let fillerData6: UInt8 = 0 // 100
    /////
    
    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        
        for i in 0..<5 {
            var aBarrierConfig = barrierConfigurations[i]
            let aBarrierData = aBarrierConfig.generateData()
            data.append(aBarrierData)
        }
        
        ///// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 41)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////
        
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.crcOfRecordData = crc16(bytes: ptr, offset: 4, length: 96)
        }
        
        data.replaceSubrange(2..<4, with: UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))

        return data
    }
}
