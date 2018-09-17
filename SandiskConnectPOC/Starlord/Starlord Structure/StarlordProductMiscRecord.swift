//
//  StarlordProductMiscRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordProductMiscRecord: StarlordBinaryStruct {
    
    /// Value: 6
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    /// Value: 0
    var resetCause: UInt8
    /// Value: 0
    var disableFaults: Bool
    var transformerRatio: Float
    
    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.resetCause, count: 1))
        data.append(UnsafeBufferPointer(start: &self.disableFaults, count: 1))
        data.append(UnsafeBufferPointer(start: &self.transformerRatio, count: 1))

        return data
    }
}
