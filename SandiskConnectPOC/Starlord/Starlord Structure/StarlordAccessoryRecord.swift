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
        let type: UInt8
        /// (ms)
        let startupTime: UInt32
        /// (ms)
        let shutoffTime: UInt32
        
        init(withData: Data) {
            let unneccessaryDataCopy = withData.advanced(by: 0)

            var offset = 0
            var length = MemoryLayout<UInt8>.size + offset
            type = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<UInt32>.size + offset
            startupTime = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<UInt32>.size + offset
            shutoffTime = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        }
    }
    
    /// Value: 45
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// 5 of them
    let accessoryConfigurations: ContiguousArray<AccessoryConfiguration>
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        var aConfigs = ContiguousArray<AccessoryConfiguration>()
        for _ in 0..<5 {
            offset = length
            length = MemoryLayout<AccessoryConfiguration>.size + offset
            aConfigs.append(AccessoryConfiguration(withData: unneccessaryDataCopy[offset..<length]))
        }
        accessoryConfigurations = aConfigs
    }
}
