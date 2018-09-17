//
//  StarlordTemperatureRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordTemperatureRecord: StarlordBinaryStruct {
    /// Value: 9
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (C )
    let temperatureReadingOffset: Float
    let temperatureReadingFactor: Float
    let temperatureInput: UInt8
    
    mutating func generateData() -> Data {
        var data = Data()
        
        data.append(UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(UnsafeBufferPointer(start: &self.temperatureReadingOffset, count: 1))
        data.append(UnsafeBufferPointer(start: &self.temperatureReadingFactor, count: 1))
        data.append(UnsafeBufferPointer(start: &self.temperatureInput, count: 1))

        return data
    }
}
