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
        
        let lengthOfRecordDataData = Data(buffer: UnsafeBufferPointer(start: &self.lengthOfRecordData, count: 1))
        data.append(lengthOfRecordDataData)
        
        let crcOfRecordDataData = Data(buffer: UnsafeBufferPointer(start: &self.crcOfRecordData, count: 1))
        data.append(crcOfRecordDataData)
        
        let resetCauseData = Data(buffer: UnsafeBufferPointer(start: &self.resetCause, count: 1))
        data.append(resetCauseData)
        
        let disableFaultsData = Data(buffer: UnsafeBufferPointer(start: &self.disableFaults, count: 1))
        data.append(disableFaultsData)
        
        let transformerRatioData = Data(buffer: UnsafeBufferPointer(start: &self.transformerRatio, count: 1))
        data.append(transformerRatioData)
                
        return data
    }
}
