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
        let holdTime: UInt32
        let angle: Float
        let type: UInt8
        let action: UInt8
        let isEnabled: Bool
        
        init(withData: Data) {
            let unneccessaryDataCopy = withData.advanced(by: 0)

            var offset = 0
            var length = MemoryLayout<UInt32>.size + offset
            holdTime = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<Float>.size + offset
            angle = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<UInt8>.size + offset
            type = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<UInt8>.size + offset
            action = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<Bool>.size + offset
            isEnabled = boolValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        }
    }
    
    /// Value: 55
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// 5 of them
    let barrierConfigurations: ContiguousArray<Barrier>
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        var bConfigs = ContiguousArray<Barrier>()
        for _ in 0..<5 {
            offset = length
            length = MemoryLayout<Barrier>.size + offset
            let aBarrier = Barrier(withData: unneccessaryDataCopy[offset..<length])
            bConfigs.append(aBarrier)
        }
        barrierConfigurations = bConfigs
    }
}
