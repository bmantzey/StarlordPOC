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
        // Note that the append isn't here because it's appended after the CRC is calculated.  We can do that in the header because the CRC value is at the end of the structure.
        
        data.withUnsafeBytes { (ptr: UnsafePointer<Int8>) in
            self.headerCRC = compCRC16(bytes: ptr, offset: 0, length: 6)
        }
        
        data.append(UnsafeBufferPointer(start: &self.headerCRC, count: 1))
        
        return data
    }
}
