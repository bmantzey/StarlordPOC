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
}
