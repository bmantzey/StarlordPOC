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
        let fileHeader = StarlordFileHeader(index: 0, corvairProductID: 2876, headerCRC: 0)
        let telemetryRecord = StarlordTelemetryRecord()
        let productMiscRecord = StarlordProductMiscRecord(lengthOfRecordData: 8,
                                                          crcOfRecordData: 0,
                                                          resetCause: 0,
                                                          disableFaults: false,
                                                          transformerRatio: 4,
                                                          periodOfSpeedCycling: 60,
                                                          autoRestartEnabled: false)
        let waterRecord = StarlordWaterRecord(lengthOfRecordData: 41,
                                              crcOfRecordData: 0,
                                              restartDelayTime: 1000,
                                              pressureTarget: 0,
                                              pressureReadingOffset: 0,
                                              pressureReadingFactor: 250,
                                              auxPressureReadingOffset: 0,
                                              auxPressureReadingFactor: 250,
                                              flowAnalogReadingOffset: 0,
                                              flowAnalogReadingFactor: 15,
                                              flowDigitalReadingUnitsPerPulse: 0,
                                              pressureReadingInput: 0,
                                              auxPressureReadingInput: 5,
                                              flowReadingInput: 0,
                                              flowDigitalReadingTriggerType: 0,
                                              isFlowReadingAnalog: false)
        var barrierConfigurations = ContiguousArray<StarlordBarrierRecord.Barrier>()
        for i: UInt8 in 0..<5 {
            let barrier = StarlordBarrierRecord.Barrier(holdTime: 0,
                                                        angle: 0,
                                                        type: i,
                                                        action: 0,
                                                        isEnabled: false)
            barrierConfigurations.append(barrier)
        }
        let barrierRecord = StarlordBarrierRecord(lengthOfRecordData: 55,
                                                  crcOfRecordData: 0,
                                                  barrierConfigurations: barrierConfigurations)

        var accessoryConfigurations = ContiguousArray<StarlordAccessoryRecord.AccessoryConfiguration>()
        for _ in 0..<5 {
            let accessory = StarlordAccessoryRecord.AccessoryConfiguration(type: 2,
                                                                           startupTime: 0,
                                                                           shutoffTime: 0)
            
            accessoryConfigurations.append(accessory)
        }
        let accessoryRecord = StarlordAccessoryRecord(lengthOfRecordData: 55,
                                                      crcOfRecordData: 0,
                                                      accessoryConfigurations: accessoryConfigurations)

        let faultRecord = StarlordFaultRecord(lengthOfRecordData: 150,
                                              crcOfRecordData: 0,
                                              rainfallThreshold: 200,
                                              rainfallTimer: 60000,
                                              flow2HighThreshold: 94635.294,
                                              flow2HighTime: 60000,
                                              flow2HighWarningThreshold: 63090.196,
                                              flow2HighWarningTime: 60000,
                                              flow2LowThreshold: 6309.0196,
                                              flow2LowTime: 60000,
                                              flow2LowWarningThreshold: 12618.039,
                                              flow2LowWarningTime: 60000,
                                              flow1HighThreshold: 94635.294,
                                              flow1HighTime: 60000,
                                              flow1HighWarningThreshold: 63090.196,
                                              flow1HighWarningTime: 60000,
                                              flow1LowThreshold: 6309.0196,
                                              flow1LowTime: 60000,
                                              flow1LowWarningThreshold: 12618.039,
                                              flow1LowWarningTime: 60000,
                                              temperatureLowThreshold: 0,
                                              temperatureLowTime: 60000,
                                              auxPressureHighThreshold: 1034214,
                                              auxPressureHighTime: 60000,
                                              auxPressureLowThreshold: 68947.6,
                                              auxPressureLowTime: 60000,
                                              auxPressureLowWarningThreshold: 103421.4,
                                              auxPressureLowWarningTime: 60000,
                                              pressurizationTime: 60000,
                                              systemPressureHighThreshold: 1034214,
                                              systemPressureHighTime: 60000,
                                              systemPressureLowThreshold: 68947.6,
                                              systemPressureLowTime: 60000,
                                              systemPressureLowWarningThreshold: 103421.4,
                                              systemPressureLowWarningTime: 60000,
                                              systemVoltageHighThreshold: 140,
                                              systemVoltageHighTime: 60000,
                                              systemVoltageLowThreshold: 90,
                                              systemVoltageLowTime: 60000,
                                              stallTime: 60000)
        let rainRecord = StarlordRainRecord(lengthOfRecordData: 1,
                                            crcOfRecordData: 0,
                                            rainInput: 11)
        let temperatureRecord = StarlordTemperatureRecord(lengthOfRecordData: 9,
                                                          crcOfRecordData: 0,
                                                          temperatureReadingOffset: 0,
                                                          temperatureReadingFactor: 0,
                                                          temperatureInput: 11)
        let voltageRecord = StarlordVoltageRecord(lengthOfRecordData: 9,
                                                  crcOfRecordData: 0,
                                                  auxVoltageReadingOffset: 0,
                                                  auxVoltageReadingFactor: 0,
                                                  auxVoltageInput: 11)
        var customAnalogInputs = ContiguousArray<StarlordCustomInputRecord.CustomInputAnalog>()
        for _ in 0..<5 {
            let testString = "01234567890123456789"
            let anAnalogInput = StarlordCustomInputRecord.CustomInputAnalog(inputReadingOffset: 0,
                                                                            inputReadingFactor: 0,
                                                                            input: 0,
                                                                            label: testString.utf8CString)
            customAnalogInputs.append(anAnalogInput)
        }
        var customDigitalInputs = ContiguousArray<StarlordCustomInputRecord.CustomInputDigital>()
        for _ in 0..<5 {
            let testString = "01234567890123456789"
            let aDigitalInput = StarlordCustomInputRecord.CustomInputDigital(unitsPerPulse: 0,
                                                                             isAccumulator: false,
                                                                             input: 0,
                                                                             activeState: false,
                                                                             readingTriggerType: 0,
                                                                             label: testString.utf8CString)
            customDigitalInputs.append(aDigitalInput)

        }
        let customInputRecord = StarlordCustomInputRecord(lengthOfRecordData: 295,
                                                          crcOfRecordData: 0,
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
