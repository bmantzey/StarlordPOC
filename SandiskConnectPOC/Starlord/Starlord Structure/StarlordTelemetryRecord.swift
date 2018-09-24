//
//  StarlordTelemetryRecord.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordTelemetryRecord: StarlordBinaryStruct {
    let fillerData: UInt64 = 0
    let fillerData2: UInt64 = 0
    let fillerData3: UInt64 = 0
    let fillerData4: UInt64 = 0
    let fillerData5: UInt64 = 0
    let fillerData6: UInt16 = 0
    

    func generateData() -> Data {
        var data = Data()

        let pointer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 42)
        
        let bufferData = Data(buffer: pointer)
        data.append(bufferData)
        
        return data
    }
}
