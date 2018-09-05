//
//  StarlordFaultRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordFaultRecord {
    /// Value: 150
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    /// (points)
    let rainfallThreshold: UInt16
    /// (ms)
    let rainfallTimer: UInt32
    /// (ccs)
    let flow2HighThreshold: Float
    /// (ms)
    let flow2HighTime: UInt32
    /// (ccs)
    let flow2HighWarningThreshold: Float
    /// (ms)
    let flow2HighWarningTime: UInt32
    /// (ccs)
    let flow2LowThreshold: Float
    /// (ms)
    let flow2LowTime: UInt32
    /// (ccs)
    let flow2LowWarningThreshold: Float
    /// (ms)
    let flow2LowWarningTime: UInt32
    /// (ccs)
    let flow1HighThreshold: Float
    /// (ms)
    let flow1HighTime: UInt32
    /// (ccs)
    let flow1HighWarningThreshold: Float
    /// (ms)
    let flow1HighWarningTime: UInt32
    /// (ccs)
    let flow1LowThreshold: Float
    /// (ms)
    let flow1LowTime: UInt32
    /// (ccs)
    let flow1LowWarningThreshold: Float
    /// (ms)
    let flow1LowWarningTime: UInt32
    /// (C )
    let temperatureLowThreshold: Float
    /// (ms)
    let temperatureLowTime: UInt32
    /// (pa)
    let auxPressureHighThreshold: Float
    /// (ms)
    let auxPressureHighTime: UInt32
    /// (pa)
    let auxPressureLowThreshold: Float
    /// (ms)
    let auxPressureLowTime: UInt32
    /// (pa)
    let auxPressureLowWarningThreshold: Float
    /// (ms)
    let auxPressureLowWarningTime: UInt32
    /// (ms)
    let pressurizationTime: UInt32
    /// (pa)
    let systemPressureHighThreshold: Float
    /// (ms)
    let systemPressureHighTime: UInt32
    /// (pa)
    let systemPressureLowThreshold: Float
    /// (ms)
    let systemPressureLowTime: UInt32
    /// (pa)
    let systemPressureLowWarningThreshold: Float
    /// (ms)
    let systemPressureLowWarningTime: UInt32
    /// (V)
    let systemVoltageHighThreshold: UInt32
    /// (ms)
    let systemVoltageHighTime: UInt32
    /// (V)
    let systemVoltageLowThreshold: UInt32
    /// (ms)
    let systemVoltageLowTime: UInt32
    /// (ms)
    let stallTime: UInt32



}
