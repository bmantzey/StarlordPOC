//
//  StarlordEnums.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 11/28/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

protocol StarlordUncrashableEnum {
    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum
}

enum BarrierActionEnumeration: UInt64, StarlordUncrashableEnum {
    case stop = 0
    case reverse = 1
    case undefined = 255
    
    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = BarrierActionEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum AnalogInputEnumeration: UInt64, StarlordUncrashableEnum {
    case analog1 = 0
    case analog2 = 1
    case analog3 = 2
    case analog4 = 3
    case analog5 = 4
    case analogGNSS = 5
    case unassigned = 7
    case undefined = 255
    
    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = AnalogInputEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum DigitalInputEnumeration: UInt64, StarlordUncrashableEnum {
    case digital1 = 0
    case digital2 = 1
    case digital3 = 2
    case digital4 = 3
    case digital5 = 4
    case ac1 = 5
    case ac2 = 6
    case ac3 = 7
    case ac4 = 8
    case ac5 = 9
    case unassigned = 11
    case undefined = 255

    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = DigitalInputEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum TriggerTypeEnumeration: UInt64, StarlordUncrashableEnum {
    case levelLow = 8
    case levelHigh = 12
    case edgeRising = 9
    case edgeFalling = 10
    case edgeBoth = 11
    case undefined = 255

    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = TriggerTypeEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum AccessoryEnumeration: UInt64, StarlordUncrashableEnum {
    case accessory1 = 0
    case accessory2 = 1
    case accessory3 = 2
    case accessory4 = 3
    case accessory5 = 4
    case gnssEndgun1 = 5
    case gnssEndgun2 = 6
    case undefined = 255

    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = AccessoryEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum AccessoryConfigurationEnumeration: UInt64, StarlordUncrashableEnum {
    case alwaysOn = 0
    case pivotOn = 1
    case wetOn = 2
    case endgun = 3
    case undefined = 255

    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = AccessoryConfigurationEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum CustomInputEnumeration: UInt64, StarlordUncrashableEnum {
    case customAnalog1 = 0
    case customAnalog2 = 1
    case customAnalog3 = 2
    case customAnalog4 = 3
    case customAnalog5 = 4
    case customDigital1 = 5
    case customDigital2 = 6
    case customDigital3 = 7
    case customDigital4 = 8
    case customDigital5 = 9
    case undefined = 255

    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = CustomInputEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum EndgunEnumeration: UInt64, StarlordUncrashableEnum {
    case endgun1 = 0
    case endgun2 = 1
    case endgun3 = 2
    case endgun4 = 3
    case undefined = 255

    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = EndgunEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}

enum DayEnumeration: UInt64, StarlordUncrashableEnum {
    case sunday = 0
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case undefined = 255

    static func createInstance(from val: UInt64) -> StarlordUncrashableEnum {
        let instance = DayEnumeration(rawValue: val) ?? .undefined
        return instance
    }
}
