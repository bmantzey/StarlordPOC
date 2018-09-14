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
    var index: Int32
    /// 2876
    var corvairProductID: UInt16
    /// 0x0000-0xFFFF
    var headerCRC: UInt16
    
    mutating func generateData() -> Data {
        var data = Data()

        let indexData = Data(buffer: UnsafeBufferPointer(start: &self.index, count: 1))
        data.append(indexData)

        let corvairProductIDData = Data(buffer: UnsafeBufferPointer(start: &self.corvairProductID, count: 1))
        data.append(corvairProductIDData)
        
        let headerCRCData = Data(buffer: UnsafeBufferPointer(start: &self.headerCRC, count: 1))
        data.append(headerCRCData)

        return data
    }
}
