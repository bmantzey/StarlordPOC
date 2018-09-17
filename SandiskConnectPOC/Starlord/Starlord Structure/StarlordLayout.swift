//
//  StarlordLayout.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct ConfigLayout: StarlordBinaryStruct {
    /// Offset: 0, Length: 8
    let fileHeader: StarlordFileHeader
    /// Offset: 8, Length: 42
    let telemetryRecord: StarlordTelemetryRecord
    /// Offset: 50, Length: 52
    let productMiscRecord: StarlordProductMiscRecord
    /// Offset: 100, Length: 50
    let waterRecord: StarlordWaterRecord
    /// Offset: 150, Length: 100
    let barrierRecord: StarlordBarrierRecord
    /// Offset: 250, Length: 100
    let accessoryRecord: StarlordAccessoryRecord
    /// Offset: 350, Length: 300
    let faultRecord: StarlordFaultRecord
    /// Offset: 650, Length: 10
    let rainRecord: StarlordRainRecord
    /// Offset: 660, Length: 16
    let temperatureRecord: StarlordTemperatureRecord
    /// Offset: 676, Length: 16
    let voltageRecord: StarlordVoltageRecord
    /// Offset: 692, Length: 500
    let customInputRecord: StarlordCustomInputRecord
    
    mutating func generateData() -> Data {
        var data = Data()
        
        // fileHeader
        let fileHeaderData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &fileHeaderData, count: 1))
        
        // telemetryRecord
        let telemetryRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &telemetryRecordData, count: 1))

        // productMiscRecord
        let productMiscRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &productMiscRecordData, count: 1))
        
        // waterRecord
        let waterRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &waterRecordData, count: 1))
        
        // barrierRecord
        let barrierRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &barrierRecordData, count: 1))
        
        // accessoryRecord
        let accessoryRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &accessoryRecordData, count: 1))
        
        // faultRecord
        let faultRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &faultRecordData, count: 1))
        
        // rainRecord
        let rainRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &rainRecordData, count: 1))
        
        // temperatureRecord
        let temperatureRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &temperatureRecordData, count: 1))
        
        // voltageRecord
        let voltageRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &voltageRecordData, count: 1))
        
        // customInputRecord
        let customInputRecordData = fileHeader.generateData()
        data.append(UnsafeBufferPointer(start: &customInputRecordData, count: 1))
    }
}


struct DataLayout {
    /// Offset: 0, Length: 8
    let fileHeader: UInt8
    /// Offset: 8, Length: 400
//    let rainData: StarlordRainData
    /// Offset: 408, Length: 50
//    let manualModeData: StarlordManualModeData
    /// Offset: 458, Length: 10
//    let debugData: StarlordDebugData
    /// Offset: 468, Length: 120
//    let hourMeterData: StarlordHourMeterData
}
