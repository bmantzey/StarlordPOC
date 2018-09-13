//
//  StarlordTelemetryRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordTelemetryRecord: StarlordBinaryStruct {
    let fillerData: UInt64
    let fillerData2: UInt64
    let fillerData3: UInt64
    let fillerData4: UInt64
    let fillerData5: UInt64
    let fillerData6: UInt16
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt64>.size + offset
        fillerData = uint64Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt64>.size + offset
        fillerData2 = uint64Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt64>.size + offset
        fillerData3 = uint64Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt64>.size + offset
        fillerData4 = uint64Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt64>.size + offset
        fillerData5 = uint64Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        fillerData6 = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
    }
}
