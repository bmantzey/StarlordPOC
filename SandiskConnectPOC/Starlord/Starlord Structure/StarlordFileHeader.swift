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

        data.append(UnsafeBufferPointer(start: &self.index, count: 1))
        data.append(UnsafeBufferPointer(start: &self.corvairProductID, count: 1))
        data.append(UnsafeBufferPointer(start: &self.headerCRC, count: 1))

        return data
    }
}
