//
//  StarlordFileHeader.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordFileHeader {
    let index: Int32
    let corvairProductID: UInt16
    let headerCRC: UInt16
}
