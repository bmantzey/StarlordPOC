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
                
                let layout = ConfigLayout(withData: data)

                
                
                print("\(data)")
            } catch {
                print("k")
            }
            
            

        }
    }
    
    func tempWrite() {
        let fileHeader = StarlordFileHeader(index: 1,
                                            corvairProductID: 2,
                                            headerCRC: 3)
        let telemetryRecord = StarlordTelemetryRecord(fillerData: 4,
                                                      fillerData2: 5,
                                                      fillerData3: 6,
                                                      fillerData4: 7,
                                                      fillerData5: 8,
                                                      fillerData6: 9)
        let productMiscRecord = StarlordProductMiscRecord(lengthOfRecordData: 10,
                                                          crcOfRecordData: 11,
                                                          resetCause: 12,
                                                          disableFaults: false,
                                                          transformerRatio: 1.3)
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
        for i in 0..<5 {
            let valueBase = 88
            let barrier = StarlordBarrierRecord.Barrier(holdTime: valueBase + i + 1,
                                                        angle: (Float(valueBase) + Float(i) + 2.0) / 10.0,
                                                        type: valueBase + i + 3,
                                                        action: valueBase + i + 4,
                                                        isEnabled: true)
            barrierConfigurations.append(barrier)
        }
        let barrierRecord = StarlordBarrierRecord(lengthOfRecordData: 29,
                                                  crcOfRecordData: 30,
                                                  barrierConfigurations: barrierConfigurations)
        var accessoryConfigurations = ContiguousArray<StarlordAccessoryRecord.AccessoryConfiguration>()
        for i in 0..<5 {
            let valueBase = 93
            let accessory = StarlordAccessoryRecord.AccessoryConfiguration(type: valueBase + i + 1,
                                                                           startupTime: valueBase + i + 2,
                                                                           shutoffTime: valueBase + i + 3)
            
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
            let testString = "Test String"
            let testStringData = testString.data(using: .utf8)!
            
            // LEFTOFF: Figure out how to convert a Swift string to something that is convertible to binary data to pass into the structs.
            let label: UnsafePointer<CChar> = testStringData.withUnsafeBytes(<#T##body: (UnsafePointer<ContentType>) throws -> ResultType##(UnsafePointer<ContentType>) throws -> ResultType#>)
            let anAnalogInput = StarlordCustomInputRecord.CustomInputAnalog(inputReadingOffset: valueBase + i + 1,
                                                                            inputReadingFactor: (Float(valueBase) + Float(i) + 2.0) / 10.0,
                                                                            input: valueBase + i + 3,
                                                                            label: <#T##UnsafePointer<CChar>#>)
        }
        var customDigitalInputs = ContiguousArray<StarlordCustomInputRecord.CustomInputDigital>()
        let customInputRecord = StarlordCustomInputRecord(lengthOfRecordData: 86,
                                                          crcOfRecordData: 87,
                                                          customAnalogInputs: <#T##ContiguousArray<StarlordCustomInputRecord.CustomInputAnalog>#>,
                                                          customDigitalInputs: <#T##ContiguousArray<StarlordCustomInputRecord.CustomInputDigital>#>)
        
        
        let cLayout = ConfigLayout(fileHeader: fileHeader,
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
        
//        let outputStream = OutputStream(toBuffer: <#T##UnsafeMutablePointer<UInt8>#>, capacity: <#T##Int#>
        /*
         let outputStream: NSOutputStream = ... // the stream that you want to write to
         let bytesWritten = outputStream.write(UnsafePointer(data.bytes), maxLength: data.length)
         */
    }
    
}
