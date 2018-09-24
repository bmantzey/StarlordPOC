//
//  StarlordFileMaker.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

class StarlordFileMaker {
    // First test reading so that it can be possible to write.
    
    func tempRead() {
        if let filePath = Bundle.main.path(forResource: "CONFIG", ofType: "DAT") {
//            OutputStream
            
            let url = URL(fileURLWithPath: filePath)
            var data: Data!
            do {
                data = try Data.init(contentsOf: url)
                
//                let layout = ConfigLayout(withData: data)

                
                
                print("\(data)")
            } catch {
                print("k")
            }
            
            

        }
    }
    
    func tempWrite() -> Data {
        let fileHeader = StarlordFileHeader(index: 1,
                                            corvairProductID: 2,
                                            headerCRC: 3)
        let telemetryRecord = StarlordTelemetryRecord()
        let productMiscRecord = StarlordProductMiscRecord(lengthOfRecordData: 10,
                                                          crcOfRecordData: 11,
                                                          resetCause: 12,
                                                          disableFaults: false,
                                                          transformerRatio: 1.3,
                                                          periodOfSpeedCycling: 4,
                                                          autoRestartEnabled: true)
        let waterRecord = StarlordWaterRecord(lengthOfRecordData: 14,
                                              crcOfRecordData: 15,
                                              restartDelayTime: 16,
                                              pressureTarget: 17,
                                              pressureReadingOffset: 18,
                                              pressureReadingFactor: 1.9,
                                              auxPressureReadingOffset: 20,
                                              auxPressureReadingFactor: 2.1,
                                              flowAnalogReadingOffset: 22,
                                              flowAnalogReadingFactor: 2.3,
                                              flowDigitalReadingUnitsPerPulse: 2.4,
                                              pressureReadingInput: 25,
                                              auxPressureReadingInput: 26,
                                              flowReadingInput: 27,
                                              flowDigitalReadingTriggerType: 28,
                                              isFlowReadingAnalog: true)
        var barrierConfigurations = ContiguousArray<StarlordBarrierRecord.Barrier>()
        for i: Int in 0..<5 {
            let valueBase: Int = 88
            let barrier = StarlordBarrierRecord.Barrier(holdTime: 1 + 2 + 3, //(valueBase + i + 1),
                                                        angle: (Float(valueBase) + Float(i) + 2.0) / 10.0,
                                                        type: UInt8(valueBase + i + 3),
                                                        action: UInt8(valueBase + i + 4),
                                                        isEnabled: true)
            barrierConfigurations.append(barrier)
        }
        let barrierRecord = StarlordBarrierRecord(lengthOfRecordData: 29,
                                                  crcOfRecordData: 30,
                                                  barrierConfigurations: barrierConfigurations)

        var accessoryConfigurations = ContiguousArray<StarlordAccessoryRecord.AccessoryConfiguration>()
        for i in 0..<5 {
            let valueBase = 93
            let accessory = StarlordAccessoryRecord.AccessoryConfiguration(type: UInt8(valueBase + i + 1),
                                                                           startupTime: UInt32(valueBase + i + 2),
                                                                           shutoffTime: UInt32(valueBase + i + 3))
            
            accessoryConfigurations.append(accessory)
        }
        let accessoryRecord = StarlordAccessoryRecord(lengthOfRecordData: 31,
                                                      crcOfRecordData: 32,
                                                      accessoryConfigurations: accessoryConfigurations)

        let faultRecord = StarlordFaultRecord(lengthOfRecordData: 33,
                                              crcOfRecordData: 34,
                                              rainfallThreshold: 35,
                                              rainfallTimer: 36,
                                              flow2HighThreshold: 3.7,
                                              flow2HighTime: 38,
                                              flow2HighWarningThreshold: 3.9,
                                              flow2HighWarningTime: 40,
                                              flow2LowThreshold: 4.1,
                                              flow2LowTime: 42,
                                              flow2LowWarningThreshold: 4.3,
                                              flow2LowWarningTime: 44,
                                              flow1HighThreshold: 4.5,
                                              flow1HighTime: 46,
                                              flow1HighWarningThreshold: 4.7,
                                              flow1HighWarningTime: 48,
                                              flow1LowThreshold: 4.9,
                                              flow1LowTime: 50,
                                              flow1LowWarningThreshold: 5.1,
                                              flow1LowWarningTime: 52,
                                              temperatureLowThreshold: 5.3,
                                              temperatureLowTime: 54,
                                              auxPressureHighThreshold: 5.5,
                                              auxPressureHighTime: 56,
                                              auxPressureLowThreshold: 5.7,
                                              auxPressureLowTime: 58,
                                              auxPressureLowWarningThreshold: 5.9,
                                              auxPressureLowWarningTime: 60,
                                              pressurizationTime: 61,
                                              systemPressureHighThreshold: 6.2,
                                              systemPressureHighTime: 63,
                                              systemPressureLowThreshold: 6.4,
                                              systemPressureLowTime: 65,
                                              systemPressureLowWarningThreshold: 6.6,
                                              systemPressureLowWarningTime: 67,
                                              systemVoltageHighThreshold: 68,
                                              systemVoltageHighTime: 69,
                                              systemVoltageLowThreshold: 70,
                                              systemVoltageLowTime: 71,
                                              stallTime: 72)
        let rainRecord = StarlordRainRecord(lengthOfRecord: 73,
                                            crcOfRecordData: 74,
                                            rainInput: 75)
        let temperatureRecord = StarlordTemperatureRecord(lengthOfRecordData: 76,
                                                          crcOfRecordData: 77,
                                                          temperatureReadingOffset: 7.8,
                                                          temperatureReadingFactor: 7.9,
                                                          temperatureInput: 80)
        let voltageRecord = StarlordVoltageRecord(lengthOfRecordData: 81,
                                                  crcOfRecordData: 82,
                                                  auxVoltageReadingOffset: 8.3,
                                                  auxVoltageReadingFactor: 8.4,
                                                  auxVoltageInput: 85)
        var customAnalogInputs = ContiguousArray<StarlordCustomInputRecord.CustomInputAnalog>()
        for i in 0..<5 {
            let valueBase = 98
            // NOTE: This may need null termination (0)
            let testString = "Test String Some More"
            let anAnalogInput = StarlordCustomInputRecord.CustomInputAnalog(inputReadingOffset: UInt32(valueBase + i + 10),
                                                                            inputReadingFactor: (Float(valueBase) + Float(i) + 2.0) / 10.0,
                                                                            input: UInt8(valueBase + i + 3),
                                                                            label: testString.utf8CString)
            customAnalogInputs.append(anAnalogInput)
        }
        var customDigitalInputs = ContiguousArray<StarlordCustomInputRecord.CustomInputDigital>()
        for i in 0..<5 {
            let valueBase = 103
            let testString = "Test String Some More"
            let aDigitalInput = StarlordCustomInputRecord.CustomInputDigital(unitsPerPulse: (Float(valueBase) + Float(i) + 1.0) / 10.0,
                                                                             isAccumulator: false,
                                                                             input: UInt8(valueBase + i + 2),
                                                                             activeState: true,
                                                                             readingTriggerType: UInt8(valueBase + i + 3),
                                                                             label: testString.utf8CString)
            customDigitalInputs.append(aDigitalInput)

        }
        let customInputRecord = StarlordCustomInputRecord(lengthOfRecordData: 86,
                                                          crcOfRecordData: 87,
                                                          customAnalogInputs: customAnalogInputs,
                                                          customDigitalInputs: customDigitalInputs)
        
        
        var cLayout = ConfigLayout(fileHeader: fileHeader,
                                   telemetryRecord: telemetryRecord,
                                   productMiscRecord: productMiscRecord,
                                   waterRecord: waterRecord,
                                   barrierRecord: barrierRecord,
                                   accessoryRecord: accessoryRecord,
                                   faultRecord: faultRecord,
                                   rainRecord: rainRecord,
                                   temperatureRecord: temperatureRecord,
                                   voltageRecord: voltageRecord,
                                   customInputRecord: customInputRecord)
        
        let data = cLayout.generateData()
        
        if let filePath = Bundle.main.path(forResource: "CONFIG", ofType: "DAT") {
            let url = URL(fileURLWithPath: filePath)
            do {
                try data.write(to: url)
                print("CONFIG.DAT written at \(filePath)")
            } catch {
                print("FAIL")
            }
        }
        
        return data
    }
}
