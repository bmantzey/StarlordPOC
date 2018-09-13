//
//  StarlordFileHeader.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordFileHeader: StarlordBinaryStruct {
    /// Value: 0, Length: 4
    let index: Int32
    /// 2876
    let corvairProductID: UInt16
    /// 0x0000-0xFFFF
    let headerCRC: UInt16
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<Int32>.size + offset
        index = int32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        corvairProductID = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        headerCRC = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
    }
}
