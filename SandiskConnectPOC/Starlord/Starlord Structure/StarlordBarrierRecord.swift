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
        var holdTime: UInt32
        var angle: Float
        var type: UInt8
        var action: UInt8
        var isEnabled: Bool
        
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
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    /// 5 of them
    var barrierConfigurations: ContiguousArray<Barrier>
    
    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.barrierConfigurations, count: 5))

        return data
    }
}
