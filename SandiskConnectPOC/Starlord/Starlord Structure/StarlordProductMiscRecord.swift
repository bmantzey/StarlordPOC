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
    /// Value: 4
    var transformerRatio: Float
    /// Value: 60
    var periodOfSpeedCycling: UInt8
    /// Value: 0
    var autoRestartEnabled: Bool
    
    //// Filler
    // Spreadsheet expects 50 bytes, but thsi is only 12 bytes.  Filling in 38 until otherwise instructed.
    let fillerData: UInt64 = 0 // 20
    let fillerData2: UInt64 = 0 // 28
    let fillerData3: UInt64 = 0 // 36
    let fillerData4: UInt64 = 0 // 44
    let fillerData5: UInt32 = 0 // 48
    let fillerData6: UInt8 = 0 // 50
    //////

    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.resetCause, count: 1))
        data.append(UnsafeBufferPointer(start: &self.disableFaults, count: 1))
        data.append(UnsafeBufferPointer(start: &self.transformerRatio, count: 1))
        data.append(UnsafeBufferPointer(start: &self.periodOfSpeedCycling, count: 1))
        data.append(UnsafeBufferPointer(start: &self.autoRestartEnabled, count: 1))

        //// Filler
        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 38)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        //////

        return data
    }
}
