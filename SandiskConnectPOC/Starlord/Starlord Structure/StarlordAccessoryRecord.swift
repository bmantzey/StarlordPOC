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
        var type: UInt8
        /// (ms)
        var startupTime: UInt32
        /// (ms)
        var shutoffTime: UInt32
        
        mutating func generateData() -> Data {
            var data = Data()
            
            let typeData = Data(buffer: UnsafeBufferPointer(start: &self.type, count: 1))
            data.append(typeData)
            
            let startupTimeData = Data(buffer: UnsafeBufferPointer(start: &self.startupTime, count: 1))
            data.append(startupTimeData)
            
            let shutoffTimeData = Data(buffer: UnsafeBufferPointer(start: &self.shutoffTime, count: 1))
            data.append(shutoffTimeData)
            
            return data
        }    }
    
    /// Value: 45
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    /// 5 of them
    var accessoryConfigurations: ContiguousArray<AccessoryConfiguration>
    
    mutating func generateData() -> Data {
        var data = Data()
        
        let lengthOfRecordDataData = Data(buffer: UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(lengthOfRecordDataData)
        
        let crcOfRecordDataData = Data(buffer: UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(crcOfRecordDataData)
        
        let accessoryConfigurationsData = Data(buffer: UnsafeBufferPointer(start: &self.accessoryConfigurations, count: 5))
        data.append(accessoryConfigurationsData)
        
        return data
    }

}
