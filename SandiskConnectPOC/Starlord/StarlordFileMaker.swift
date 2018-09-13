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
                print("\(data)")
            } catch {
                print("k")
            }
            
            var rng = NSRange(location: 0, length: 4)
            var i = [UInt32](repeating: 0, count: 1)

            var values = [UInt8](repeating: 0, count: data!.count)
            data.copyBytes(to: &values, count: data!.count)
            
            let fileHeader = StarlordFileHeader(index: 0, corvairProductID: 1, headerCRC: 2)
            let stride = MemoryLayout<StarlordFileHeader>.stride
            print("stride: \(stride)")
            
//            var buf:[UInt8] = [UInt8](repeating: 0, count: 16)
//            if let input = InputStream(fileAtPath: filePath) {
//                input.open()
//
//                var fileHeader: StarlordFileHeader!
//
//                var index: Int32!
//                var len = input.read(&buf, maxLength: 4)
//                index = Int32(
//                print("\(buf)")
//                len = input.read(&buf, maxLength: 2)
//                print("\(buf)")
//                len = input.read(&buf, maxLength: 2)
//                print("\(buf)")
//
//
//
//
//                input.close()
//            }
        }
    }
}
