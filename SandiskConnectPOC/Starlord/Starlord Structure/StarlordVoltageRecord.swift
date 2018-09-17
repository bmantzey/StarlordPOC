//
//  StarlordVoltageRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordVoltageRecord: StarlordBinaryStruct {
    /// Value: 9
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (V)
    let auxVoltageReadingOffset: Float
    let auxVoltageReadingFactor: Float
    let auxVoltageInput: UInt8
    
    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageReadingOffset, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageReadingFactor, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageInput, count: 1))

        return data
    }
}
