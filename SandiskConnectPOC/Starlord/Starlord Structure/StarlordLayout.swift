//
//  StarlordLayout.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct ConfigLayout {
    /// Offset: 0, Length: 8
    let fileHeader: UInt8
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
