//
//  StarlordFileHeader.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct StarlordFileHeader {
    /// 0
    let index: Int32
    /// 2876
    let corvairProductID: UInt16
    /// 0x0000-0xFFFF
    let headerCRC: UInt16
}
