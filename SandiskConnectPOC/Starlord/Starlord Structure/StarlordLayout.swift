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
    
    init(withData: Data) {
        let unnecessaryDataCopy = withData.advanced(by: 0)
        
        // fileHeader
        var offset = 0
        var length = MemoryLayout<StarlordFileHeader>.size + offset
        fileHeader = StarlordFileHeader(withData: unnecessaryDataCopy[offset..<length])
        
        // telemetryRecord
        offset = length
        length = MemoryLayout<StarlordTelemetryRecord>.size + offset
        telemetryRecord = StarlordTelemetryRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // productMiscRecord
        offset = length
        length = 50 + offset //MemoryLayout<StarlordProductMiscRecord>.size + offset
        productMiscRecord = StarlordProductMiscRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // waterRecord
        offset = length
        length = 50 + offset //MemoryLayout<StarlordWaterRecord>.size + offset
        waterRecord = StarlordWaterRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // barrierRecord
        offset = length
        length = 100 + offset //MemoryLayout<StarlordBarrierRecord>.size + offset
        barrierRecord = StarlordBarrierRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // accessoryRecord
        offset = length
        length = 100 + offset //MemoryLayout<StarlordAccessoryRecord>.size + offset
        accessoryRecord = StarlordAccessoryRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // faultRecord
        offset = length
        length = 300 + offset //MemoryLayout<StarlordFaultRecord>.size + offset
        faultRecord = StarlordFaultRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // rainRecord
        offset = length
        length = 10 + offset //MemoryLayout<StarlordRainRecord>.size + offset
        rainRecord = StarlordRainRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // temperatureRecord
        offset = length
        length = 16 + offset //MemoryLayout<StarlordTemperatureRecord>.size + offset
        temperatureRecord = StarlordTemperatureRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // voltageRecord
        offset = length
        length = 16 + offset //MemoryLayout<StarlordVoltageRecord>.size + offset
        voltageRecord = StarlordVoltageRecord(withData: unnecessaryDataCopy[offset..<length])
        
        // customInputRecord
        offset = length
        length = 500 + offset //MemoryLayout<StarlordCustomInputRecord>.size + offset
        customInputRecord = StarlordCustomInputRecord(withData: unnecessaryDataCopy[offset..<min(unnecessaryDataCopy.count, length)])
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
