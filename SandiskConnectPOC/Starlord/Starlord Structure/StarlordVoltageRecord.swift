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
    var lengthOfRecordData: UInt16
    var crcOfRecordData: UInt16
    /// (V)
    /// Value: 0
    var auxVoltageReadingOffset: Float
    /// Value: 0
    var auxVoltageReadingFactor: Float
    /// Value: 11
    var auxVoltageInput: UInt8
    
    ////// Filler
    let fillerData: UInt16 = 0
    let fillerData2: UInt8 = 0
    /////

    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageReadingOffset, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageReadingFactor, count: 1))
        data.append(UnsafeBufferPointer(start: &self.auxVoltageInput, count: 1))

        // 13 bytes here - need 16
        ///// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 3)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        /////

        return data
    }
}
