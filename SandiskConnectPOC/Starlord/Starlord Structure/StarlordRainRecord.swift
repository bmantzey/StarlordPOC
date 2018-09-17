//
//  StarlordRainRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordRainRecord: StarlordBinaryStruct {
    /// Value: 1
    let lengthOfRecord: UInt16
    let crcOfRecordData: UInt16
    let rainInput: UInt8
    
    mutating func generateData() -> Data {
        var data = Data()

        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.rainInput, count: 1))
        
        return data
    }
}
