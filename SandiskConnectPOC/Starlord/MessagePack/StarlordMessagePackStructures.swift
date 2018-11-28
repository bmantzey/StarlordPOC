//
//  StarlordMessagePackStructures.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 11/28/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation

struct PressureInputConfiguration {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Pascals
    let minimumReading: UInt32
    /// Pascals
    let maximumReading: UInt32
    
    init(analogInputVal: UInt8, minimumReading: UInt32, maximumReading: UInt32) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
}

struct AnalogFlowInputConfiguration {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Pascals
    let minimumReading: UInt32
    /// Pascals
    let maximumReading: UInt32
    
    init(analogInputVal: UInt8, minimumReading: UInt32, maximumReading: UInt32) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
}

struct DigitalFlowInputConfiguration {
    /// Digital Input Enumeration
    let digitalInput: DigitalInputEnumeration
    /// Trigger Type Enumeration
    let triggerType: TriggerTypeEnumeration
    /// Cubic Centimeters Per Pulse
    let unitsPerPulse: Float32
    
    init(digitalInputVal: UInt8, triggerTypeVal: UInt8, unitsPerPulse: Float32) {
        self.digitalInput = DigitalInputEnumeration.createInstance(from: digitalInputVal) as! DigitalInputEnumeration
        self.triggerType = TriggerTypeEnumeration.createInstance(from: triggerTypeVal) as! TriggerTypeEnumeration
        self.unitsPerPulse = unitsPerPulse
    }
}

struct AccessoryConfiguration {
    /// Accessory Enumeration
    let accessory: AccessoryEnumeration
    /// Accessory Configuration Enumeration
    let accessoryConfiguration: AccessoryConfigurationEnumeration
    /// Milliseconds
    let startupDelay: UInt32
    /// Milliseconds
    let shutoffDelay: UInt32
    
    init(accessoryVal: UInt8, accessoryConfigurationVal: UInt8, startupDelay: UInt32, shutoffDelay: UInt32) {
        self.accessory = AccessoryEnumeration.createInstance(from: accessoryVal) as! AccessoryEnumeration
        self.accessoryConfiguration = AccessoryConfigurationEnumeration.createInstance(from: accessoryConfigurationVal) as! AccessoryConfigurationEnumeration
        self.startupDelay = startupDelay
        self.shutoffDelay = shutoffDelay
    }
}

struct RainbucketConfiguration {
    /// Digital Input Enumeration
    let digitalInput: AccessoryEnumeration
    /// Millimeters per Pulse
    let mmPerPulse: Float32
    
    init(accessoryVal: UInt8, mmPerPulse: Float32) {
        self.digitalInput = AccessoryEnumeration.createInstance(from: accessoryVal) as! AccessoryEnumeration
        self.mmPerPulse = mmPerPulse
    }
}

struct TemperatureConfiguration {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Degrees Celcius
    let minimumReading: Float32
    /// Degrees Celcius
    let maximumReading: Float32
    
    init(analogInputVal: UInt8, minimumReading: Float32, maximumReading: Float32) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
}

struct VoltageConfiguration {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Volts
    let minimumReading: Float32
    /// Volts
    let maximumReading: Float32
    
    init(analogInputVal: UInt8, minimumReading: Float32, maximumReading: Float32) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
}

struct CustomAnalogInputConfiguration {
    /// Custom Input Enumeration
    let customInput: CustomInputEnumeration
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Minimum Reading Units
    let minimumReading: Float32
    /// Maximum Reading Units
    let maximumReading: Float32
    
    init(customInputVal: UInt8, analogInputVal: UInt8, minimumReading: Float32, maximumReading: Float32) {
        self.customInput = CustomInputEnumeration.createInstance(from: customInputVal) as! CustomInputEnumeration
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
}

struct CustomDigitalInputGPIOConfiguration {
    /// Custom Input Enumeration
    let customInput: CustomInputEnumeration
    /// Digital Input Enumeration
    let digitalInput: DigitalInputEnumeration
    /// State when GPIO is Asserted
    let activeState: Bool
    
    init(customInputVal: UInt8, digitalInputVal: UInt8, activeState: Bool) {
        self.customInput = CustomInputEnumeration.createInstance(from: customInputVal) as! CustomInputEnumeration
        self.digitalInput = DigitalInputEnumeration.createInstance(from: customInputVal) as! DigitalInputEnumeration
        self.activeState = activeState
    }
}

struct CustomDigitalInputAccumulatorConfiguration {
    /// Custom Input Enumeration
    let customInput: CustomInputEnumeration
    /// Digital Input Enumeration
    let digitalInput: DigitalInputEnumeration
    /// Trigger Type Enumeration
    let triggerType: TriggerTypeEnumeration
    /// Units Per Pulse
    let unitsPerPulse: Float32
    
    init(customInputVal: UInt8, digitalInputVal: UInt8, triggerTypeVal: UInt8, unitsPerPulse: Float32) {
        self.customInput = CustomInputEnumeration.createInstance(from: customInputVal) as! CustomInputEnumeration
        self.digitalInput = DigitalInputEnumeration.createInstance(from: digitalInputVal) as! DigitalInputEnumeration
        self.triggerType = TriggerTypeEnumeration.createInstance(from: triggerTypeVal) as! TriggerTypeEnumeration
        self.unitsPerPulse = unitsPerPulse
    }
}

struct EndgunEnableConfiguration {
    /// Endgun Enumeration
    let endgun: EndgunEnumeration
    var endgunEnabled: Bool
    
    init(endgunVal: UInt8, endgunEnabled: Bool) {
        self.endgun = EndgunEnumeration.createInstance(from: endgunVal) as! EndgunEnumeration
        self.endgunEnabled = endgunEnabled
    }
}

struct EndgunAccessoryConfiguration {
    /// Endgun Enumeration
    let endgun: EndgunEnumeration
    /// Accessory Enumeration
    let endgunAccessory: AccessoryEnumeration
    
    init(endgunVal: UInt8, endgunAccessoryVal: UInt8) {
        self.endgun = EndgunEnumeration.createInstance(from: endgunVal) as! EndgunEnumeration
        self.endgunAccessory = AccessoryEnumeration.createInstance(from: endgunAccessoryVal) as! AccessoryEnumeration
    }
}

/// There can be 0-15 sections.
struct EndgunSectionsConfiguration {
    /// Endgun Enumeration
    let endgun: EndgunEnumeration
    /// Degrees X 10
    var sections: [(start: UInt16, end: UInt16)]
    
    init(endgunVal: UInt8, startingSections: [(start: UInt16, end: UInt16)]?) {
        self.endgun = EndgunEnumeration.createInstance(from: endgunVal) as! EndgunEnumeration
        self.sections = [(start: UInt16, end: UInt16)]()
        if startingSections != nil {
            self.sections.append(contentsOf: startingSections!)
        }
    }
    
    mutating public func addEndgun(section: (start: UInt16, end: UInt16)) {
        sections.append(section)
    }
    // NOTE: How about removing items from the array?  Do we need a mutating public func that searches for the passed in value?  Do I need a way to reference an element by index?
}

struct GPSCoordinate {
    let latitude: Float64
    let longitude: Float64
    
    init(latitude: Float64, longitude: Float64) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

struct LoadControlDayConfiguration {
    /// Day Enumeration
    let dayOfWeek: DayEnumeration
    ///
    let enabled: Bool
    /// Minutes
    let startMinuteOfDay: UInt16
    /// Minutes
    let endMinuteOfDay: UInt16
    
    init(dayOfWeekVal: UInt8, enabled: Bool, startMinuteOfDay: UInt16, endMinuteOfDay: UInt16) {
        self.dayOfWeek = DayEnumeration.createInstance(from: dayOfWeekVal) as! DayEnumeration
        self.enabled = enabled
        self.startMinuteOfDay = startMinuteOfDay
        self.endMinuteOfDay = endMinuteOfDay
    }
}
