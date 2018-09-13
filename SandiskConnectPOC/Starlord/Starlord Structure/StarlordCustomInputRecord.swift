//
//  StarlordCustomInputRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordCustomInputRecord: StarlordBinaryStruct {
    struct CustomInputAnalog: StarlordBinaryStruct {
        /// (units)
        let inputReadingOffset: UInt32
        let inputReadingFactor: Float
        let input: UInt8
        let label: ContiguousArray<CChar>
        
        init(withData: Data) {
            let unneccessaryDataCopy = withData.advanced(by: 0)

            var offset = 0
            var length = MemoryLayout<UInt32>.size + offset
            inputReadingOffset = uint32Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<Float>.size + offset
            inputReadingFactor = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<UInt8>.size + offset
            input = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)

            var labelArray = ContiguousArray<CChar>()
            for _ in 0..<21 {
                offset = length
                length = MemoryLayout<CChar>.size + offset
                let aChar = charValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
                labelArray.append(aChar)
            }
            label = labelArray
        }
    }
    struct CustomInputDigital: StarlordBinaryStruct {
        /// (units)
        let unitsPerPulse: Float
        let isAccumulator: Bool
        let input: UInt8
        let activeState: Bool
        let readingTriggerType: UInt8
        let label: String
        
        init(withData: Data) {
            let unneccessaryDataCopy = withData.advanced(by: 0)

            var offset = 0
            var length = MemoryLayout<Float>.size + offset
            unitsPerPulse = floatValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<Bool>.size + offset
            isAccumulator = boolValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<UInt8>.size + offset
            input = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<Bool>.size + offset
            activeState = boolValue(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = MemoryLayout<UInt8>.size + offset
            readingTriggerType = uint8Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
            
            offset = length
            length = 21 + offset
            label = String(data: unneccessaryDataCopy[offset..<length], encoding: .utf8) ?? "                     "
        }
    }
    
    /// Value: 295
    let lengthOfRecordData: UInt16
    let crcOfRecordData: UInt16
    let customAnalogInputs: ContiguousArray<CustomInputAnalog>
    let customDigitalInputs: ContiguousArray<CustomInputDigital>
    
    init(withData: Data) {
        let unneccessaryDataCopy = withData.advanced(by: 0)

        var offset = 0
        var length = MemoryLayout<UInt16>.size + offset
        lengthOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        offset = length
        length = MemoryLayout<UInt16>.size + offset
        crcOfRecordData = uint16Value(data: unneccessaryDataCopy[offset..<length], isBigEndian: isBigEndian)
        
        var caInputs = ContiguousArray<CustomInputAnalog>()
        for _ in 0..<5 {
            offset = length
            length = 30 + offset //MemoryLayout<CustomInputAnalog>.size + offset
            let aCA = CustomInputAnalog(withData: unneccessaryDataCopy[offset..<length])
            caInputs.append(aCA)
        }
        customAnalogInputs = caInputs
        
        var cdInputs = ContiguousArray<CustomInputDigital>()
        for _ in 0..<5 {
            offset = length
            length = MemoryLayout<CustomInputDigital>.size + offset
            let aCD = CustomInputDigital(withData: unneccessaryDataCopy[offset..<length])
            cdInputs.append(aCD)
        }
        customDigitalInputs = cdInputs
    }
}
