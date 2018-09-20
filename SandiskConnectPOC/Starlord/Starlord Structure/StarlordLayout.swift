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
    var fileHeader: StarlordFileHeader
    /// Offset: 8, Length: 42
    var telemetryRecord: StarlordTelemetryRecord
    /// Offset: 50, Length: 52
    var productMiscRecord: StarlordProductMiscRecord
    /// Offset: 100, Length: 50
    var waterRecord: StarlordWaterRecord
    /// Offset: 150, Length: 100
    var barrierRecord: StarlordBarrierRecord
    /// Offset: 250, Length: 100
    var accessoryRecord: StarlordAccessoryRecord
    /// Offset: 350, Length: 300
    var faultRecord: StarlordFaultRecord
    /// Offset: 650, Length: 10
    var rainRecord: StarlordRainRecord
    /// Offset: 660, Length: 16
    var temperatureRecord: StarlordTemperatureRecord
    /// Offset: 676, Length: 16
    var voltageRecord: StarlordVoltageRecord
    /// Offset: 692, Length: 500
    var customInputRecord: StarlordCustomInputRecord
    
    mutating func generateData() -> Data {
        var data = Data()
        
        // fileHeader
        let fileHeaderData = fileHeader.generateData()
        data.append(fileHeaderData)

        // telemetryRecord
        let telemetryRecordData = telemetryRecord.generateData()
        data.append(telemetryRecordData)

        // productMiscRecord
        let productMiscRecordData = productMiscRecord.generateData()
        data.append(productMiscRecordData)
        
        // waterRecord
        let waterRecordData = waterRecord.generateData()
        data.append(waterRecordData)
        
        // barrierRecord
        let barrierRecordData = barrierRecord.generateData()
        data.append(barrierRecordData)
        
        // accessoryRecord
        let accessoryRecordData = accessoryRecord.generateData()
        data.append(accessoryRecordData)
        
        // faultRecord
        let faultRecordData = faultRecord.generateData()
        data.append(faultRecordData)
        
        // rainRecord
        let rainRecordData = rainRecord.generateData()
        data.append(rainRecordData)
        
        // temperatureRecord
        let temperatureRecordData = temperatureRecord.generateData()
        data.append(temperatureRecordData)
        
        // voltageRecord
        let voltageRecordData = voltageRecord.generateData()
        data.append(voltageRecordData)
        
        // customInputRecord
        let customInputRecordData = customInputRecord.generateData()
        data.append(customInputRecordData)
        
        return data
    }
}


struct DataLayout {
    /// Offset: 0, Length: 8
    var fileHeader: UInt8
    /// Offset: 8, Length: 400
//    var rainData: StarlordRainData
    /// Offset: 408, Length: 50
//    var manualModeData: StarlordManualModeData
    /// Offset: 458, Length: 10
//    var debugData: StarlordDebugData
    /// Offset: 468, Length: 120
//    var hourMeterData: StarlordHourMeterData
}
