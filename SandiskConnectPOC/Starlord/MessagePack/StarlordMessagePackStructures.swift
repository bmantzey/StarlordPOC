//
//  StarlordMessagePackStructures.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 11/28/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation
import MessagePack

protocol Packable {
    func messagePackValue() -> MessagePackValue
}

struct PressureInputConfiguration: Packable {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Pascals
    let minimumReading: UInt64
    /// Pascals
    let maximumReading: UInt64
    
    init(analogInputVal: UInt64, minimumReading: UInt64, maximumReading: UInt64) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
    
    func messagePackValue() -> MessagePackValue {
        let analogInputPack: MessagePackValue = .uint(self.analogInput.rawValue)
        let minimumReadingPack: MessagePackValue = .uint(self.minimumReading)
        let maximumReadingPack: MessagePackValue = .uint(self.maximumReading)
        
        let pressureInputArray = [analogInputPack, minimumReadingPack, maximumReadingPack]
        let pressureInputArrayMPV: MessagePackValue = .array(pressureInputArray)
//        let pressureInputPacked = pack(pressureInputArrayMPV)
        
        return pressureInputArrayMPV
    }
}

struct AnalogFlowInputConfiguration: Packable {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Pascals
    let minimumReading: UInt64
    /// Pascals
    let maximumReading: UInt64
    
    init(analogInputVal: UInt64, minimumReading: UInt64, maximumReading: UInt64) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
    
    func messagePackValue() -> MessagePackValue {
        let analogInputPack: MessagePackValue = .uint(self.analogInput.rawValue)
        let minimumReadingPack: MessagePackValue = .uint(self.minimumReading)
        let maximumReadingPack: MessagePackValue = .uint(self.maximumReading)
        
        let analogFlowArray = [analogInputPack, minimumReadingPack, maximumReadingPack]
        let analogFlowArrayMPV: MessagePackValue = .array(analogFlowArray)
        
        return analogFlowArrayMPV
    }
}

struct DigitalFlowInputConfiguration: Packable {
    /// Digital Input Enumeration
    let digitalInput: DigitalInputEnumeration
    /// Trigger Type Enumeration
    let triggerType: TriggerTypeEnumeration
    /// Cubic Centimeters Per Pulse
    let unitsPerPulse: Float
    
    init(digitalInputVal: UInt64, triggerTypeVal: UInt64, unitsPerPulse: Float) {
        self.digitalInput = DigitalInputEnumeration.createInstance(from: digitalInputVal) as! DigitalInputEnumeration
        self.triggerType = TriggerTypeEnumeration.createInstance(from: triggerTypeVal) as! TriggerTypeEnumeration
        self.unitsPerPulse = unitsPerPulse
    }
    
    func messagePackValue() -> MessagePackValue {
        let digitalInputPack: MessagePackValue = .uint(self.digitalInput.rawValue)
        let triggerTypePack: MessagePackValue = .uint(self.triggerType.rawValue)
        let unitsPerPulsePack: MessagePackValue = .float(self.unitsPerPulse)
        
        let digitalFlowArray = [digitalInputPack, triggerTypePack, unitsPerPulsePack]
        let digitalFlowArrayMPV: MessagePackValue = .array(digitalFlowArray)
        
        return digitalFlowArrayMPV
    }
}

struct AccessoryConfiguration: Packable {
    /// Accessory Enumeration
    let accessory: AccessoryEnumeration
    /// Accessory Configuration Enumeration
    let accessoryConfiguration: AccessoryConfigurationEnumeration
    /// Milliseconds
    let startupDelay: UInt64
    /// Milliseconds
    let shutoffDelay: UInt64
    
    init(accessoryVal: UInt64, accessoryConfigurationVal: UInt64, startupDelay: UInt64, shutoffDelay: UInt64) {
        self.accessory = AccessoryEnumeration.createInstance(from: accessoryVal) as! AccessoryEnumeration
        self.accessoryConfiguration = AccessoryConfigurationEnumeration.createInstance(from: accessoryConfigurationVal) as! AccessoryConfigurationEnumeration
        self.startupDelay = startupDelay
        self.shutoffDelay = shutoffDelay
    }
    
    func messagePackValue() -> MessagePackValue {
        let accessoryPack: MessagePackValue = .uint(self.accessory.rawValue)
        let accessoryConfigurationPack: MessagePackValue = .uint(self.accessoryConfiguration.rawValue)
        let startupDelayPack: MessagePackValue = .uint(self.startupDelay)
        let shutoffDelayPack: MessagePackValue = .uint(self.shutoffDelay)
        
        let accessoryConfigurationArray = [accessoryPack, accessoryConfigurationPack, startupDelayPack, shutoffDelayPack]
        let accessoryConfigurationArrayMPV: MessagePackValue = .array(accessoryConfigurationArray)
        
        return accessoryConfigurationArrayMPV
    }
}

struct RainbucketConfiguration: Packable {
    /// Digital Input Enumeration
    let digitalInput: AccessoryEnumeration
    /// Millimeters per Pulse
    let mmPerPulse: Float
    
    init(accessoryVal: UInt64, mmPerPulse: Float) {
        self.digitalInput = AccessoryEnumeration.createInstance(from: accessoryVal) as! AccessoryEnumeration
        self.mmPerPulse = mmPerPulse
    }
    
    func messagePackValue() -> MessagePackValue {
        let digitalInputPack: MessagePackValue = .uint(self.digitalInput.rawValue)
        let mmPerPulsePack: MessagePackValue = .float(self.mmPerPulse)
        
        let rainBucketConfigurationArray = [digitalInputPack, mmPerPulsePack]
        let rainBucketConfigurationArrayMVP: MessagePackValue = .array(rainBucketConfigurationArray)
        
        return rainBucketConfigurationArrayMVP
    }
}

struct TemperatureConfiguration: Packable {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Degrees Celcius
    let minimumReading: Float
    /// Degrees Celcius
    let maximumReading: Float
    
    init(analogInputVal: UInt64, minimumReading: Float, maximumReading: Float) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
    
    func messagePackValue() -> MessagePackValue {
        let analogInputPack: MessagePackValue = .uint(self.analogInput.rawValue)
        let minimumReadingPack: MessagePackValue = .float(self.minimumReading)
        let maximumReadingPack: MessagePackValue = .float(self.maximumReading)
        
        let temperatureConfigurationArray = [analogInputPack, minimumReadingPack, maximumReadingPack]
        let temperatureConfigurationMPV: MessagePackValue = .array(temperatureConfigurationArray)
        
        return temperatureConfigurationMPV
    }
}

struct VoltageConfiguration: Packable {
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Volts
    let minimumReading: Float
    /// Volts
    let maximumReading: Float
    
    init(analogInputVal: UInt64, minimumReading: Float, maximumReading: Float) {
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
    
    func messagePackValue() -> MessagePackValue {
        let analogInputPack: MessagePackValue = .uint(self.analogInput.rawValue)
        let minimumReadingPack: MessagePackValue = .float(self.minimumReading)
        let maximumReadingPack: MessagePackValue = .float(self.maximumReading)
        
        let voltageConfigurationArray = [analogInputPack, minimumReadingPack, maximumReadingPack]
        let voltageConfigurationMPV: MessagePackValue = .array(voltageConfigurationArray)
        
        return voltageConfigurationMPV
    }
}

struct CustomAnalogInputConfiguration: Packable {
    /// Custom Input Enumeration
    let customInput: CustomInputEnumeration
    /// Analog Input Enumeration
    let analogInput: AnalogInputEnumeration
    /// Minimum Reading Units
    let minimumReading: Float
    /// Maximum Reading Units
    let maximumReading: Float
    
    init(customInputVal: UInt64, analogInputVal: UInt64, minimumReading: Float, maximumReading: Float) {
        self.customInput = CustomInputEnumeration.createInstance(from: customInputVal) as! CustomInputEnumeration
        self.analogInput = AnalogInputEnumeration.createInstance(from: analogInputVal) as! AnalogInputEnumeration
        self.minimumReading = minimumReading
        self.maximumReading = maximumReading
    }
    
    func messagePackValue() -> MessagePackValue {
        let customInputPack: MessagePackValue = .uint(self.customInput.rawValue)
        let analogInputPack: MessagePackValue = .uint(self.analogInput.rawValue)
        let minimumReadingPack: MessagePackValue = .float(self.minimumReading)
        let maximumReadingPack: MessagePackValue = .float(self.maximumReading)
        
        let customAnalogInputArray = [customInputPack, analogInputPack, minimumReadingPack, maximumReadingPack]
        let customAnalogInputMPV: MessagePackValue = .array(customAnalogInputArray)
        
        return customAnalogInputMPV
    }
}

struct CustomDigitalInputGPIOConfiguration: Packable {
    /// Custom Input Enumeration
    let customInput: CustomInputEnumeration
    /// Digital Input Enumeration
    let digitalInput: DigitalInputEnumeration
    /// State when GPIO is Asserted
    let activeState: Bool
    
    init(customInputVal: UInt64, digitalInputVal: UInt64, activeState: Bool) {
        self.customInput = CustomInputEnumeration.createInstance(from: customInputVal) as! CustomInputEnumeration
        self.digitalInput = DigitalInputEnumeration.createInstance(from: customInputVal) as! DigitalInputEnumeration
        self.activeState = activeState
    }
    
    func messagePackValue() -> MessagePackValue {
        let customInputPack: MessagePackValue = .uint(self.customInput.rawValue)
        let digitalInputPack: MessagePackValue = .uint(self.digitalInput.rawValue)
        let activeStatePack: MessagePackValue = .bool(self.activeState)
        
        let customDigitalInputGPIOConfigurationArray = [customInputPack, digitalInputPack, activeStatePack]
        let customDigitalInputGPIOConfigurationMPV: MessagePackValue = .array(customDigitalInputGPIOConfigurationArray)
        
        return customDigitalInputGPIOConfigurationMPV
    }
}

struct CustomDigitalInputAccumulatorConfiguration: Packable {
    /// Custom Input Enumeration
    let customInput: CustomInputEnumeration
    /// Digital Input Enumeration
    let digitalInput: DigitalInputEnumeration
    /// Trigger Type Enumeration
    let triggerType: TriggerTypeEnumeration
    /// Units Per Pulse
    let unitsPerPulse: Float
    
    init(customInputVal: UInt64, digitalInputVal: UInt64, triggerTypeVal: UInt64, unitsPerPulse: Float) {
        self.customInput = CustomInputEnumeration.createInstance(from: customInputVal) as! CustomInputEnumeration
        self.digitalInput = DigitalInputEnumeration.createInstance(from: digitalInputVal) as! DigitalInputEnumeration
        self.triggerType = TriggerTypeEnumeration.createInstance(from: triggerTypeVal) as! TriggerTypeEnumeration
        self.unitsPerPulse = unitsPerPulse
    }
    
    func messagePackValue() -> MessagePackValue {
        let customInputPack: MessagePackValue = .uint(self.customInput.rawValue)
        let digitalInputPack: MessagePackValue = .uint(self.digitalInput.rawValue)
        let triggerTypePack: MessagePackValue = .uint(self.triggerType.rawValue)
        let unitsPerPulsePack: MessagePackValue = .float(self.unitsPerPulse)
        
        let customDigitalInputAccumulatorConfigurationArray = [customInputPack, digitalInputPack, triggerTypePack, unitsPerPulsePack]
        let customDigitalInputAccumulatorConfigurationMPV: MessagePackValue = .array(customDigitalInputAccumulatorConfigurationArray)
        
        return customDigitalInputAccumulatorConfigurationMPV
    }
}

struct EndgunEnableConfiguration: Packable {
    /// Endgun Enumeration
    let endgun: EndgunEnumeration
    var endgunEnabled: Bool
    
    init(endgunVal: UInt64, endgunEnabled: Bool) {
        self.endgun = EndgunEnumeration.createInstance(from: endgunVal) as! EndgunEnumeration
        self.endgunEnabled = endgunEnabled
    }
    
    func messagePackValue() -> MessagePackValue {
        let endgunPack: MessagePackValue = .uint(self.endgun.rawValue)
        let endgunEnabledPack: MessagePackValue = .bool(self.endgunEnabled)
        
        let endgunEnableConfigurationArray = [endgunPack, endgunEnabledPack]
        let endgunEnableConfigurationMPV: MessagePackValue = .array(endgunEnableConfigurationArray)
        
        return endgunEnableConfigurationMPV
    }
}

struct EndgunAccessoryConfiguration: Packable {
    /// Endgun Enumeration
    let endgun: EndgunEnumeration
    /// Accessory Enumeration
    let endgunAccessory: AccessoryEnumeration
    
    init(endgunVal: UInt64, endgunAccessoryVal: UInt64) {
        self.endgun = EndgunEnumeration.createInstance(from: endgunVal) as! EndgunEnumeration
        self.endgunAccessory = AccessoryEnumeration.createInstance(from: endgunAccessoryVal) as! AccessoryEnumeration
    }
    
    func messagePackValue() -> MessagePackValue {
        let endgunPack: MessagePackValue = .uint(self.endgun.rawValue)
        let endgunAccessoryPack: MessagePackValue = .uint(self.endgunAccessory.rawValue)
        
        let endgunAccessoryConfigurationArray = [endgunPack, endgunAccessoryPack]
        let endgunAccessoryConfigurationMPV: MessagePackValue = .array(endgunAccessoryConfigurationArray)
        
        return endgunAccessoryConfigurationMPV
    }
}

/// There can be 0-15 sections.
struct EndgunSectionsConfiguration: Packable {
    /// Endgun Enumeration
    let endgun: EndgunEnumeration
    /// Degrees X 10
    var sections: [(start: UInt64, end: UInt64)]
    
    init(endgunVal: UInt64, startingSections: [(start: UInt64, end: UInt64)]?) {
        self.endgun = EndgunEnumeration.createInstance(from: endgunVal) as! EndgunEnumeration
        self.sections = [(start: UInt64, end: UInt64)]()
        if startingSections != nil {
            self.sections.append(contentsOf: startingSections!)
        }
    }
    
    mutating public func addEndgun(section: (start: UInt64, end: UInt64)) {
        sections.append(section)
    }
    // NOTE: How about removing items from the array?  Do we need a mutating public func that searches for the passed in value?  Do I need a way to reference an element by index?
    
    func messagePackValue() -> MessagePackValue {
        var endgunsSectionsConfigurationArray = [MessagePackValue]()
        
        let endgunPack: MessagePackValue = .uint(self.endgun.rawValue)
        endgunsSectionsConfigurationArray.append(endgunPack)
        
        for aSection in self.sections {
            let aSectionStartPack: MessagePackValue = .uint(aSection.start)
            let aSectionEndPack: MessagePackValue = .uint(aSection.end)
            
            let sectionArray = [aSectionStartPack, aSectionEndPack]
            let sectionArrayMPV: MessagePackValue = .array(sectionArray)
            
            endgunsSectionsConfigurationArray.append(sectionArrayMPV)
        }
        
        let endgunsSectionConfigurationArrayMPV: MessagePackValue = .array(endgunsSectionsConfigurationArray)
        return endgunsSectionConfigurationArrayMPV
    }
}

struct GPSCoordinate: Packable {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func messagePackValue() -> MessagePackValue {
        let latitudePack: MessagePackValue = .double(self.latitude)
        let longitudePack: MessagePackValue = .double(self.longitude)
        
        let gpsCoordinateArray = [latitudePack, longitudePack]
        let gpsCoordinateMPV: MessagePackValue = .array(gpsCoordinateArray)
        
        return gpsCoordinateMPV
    }
}

struct LoadControlDayConfiguration: Packable {
    /// Day Enumeration
    let dayOfWeek: DayEnumeration
    ///
    let enabled: Bool
    /// Minutes
    let startMinuteOfDay: UInt64
    /// Minutes
    let endMinuteOfDay: UInt64
    
    init(dayOfWeekVal: UInt64, enabled: Bool, startMinuteOfDay: UInt64, endMinuteOfDay: UInt64) {
        self.dayOfWeek = DayEnumeration.createInstance(from: dayOfWeekVal) as! DayEnumeration
        self.enabled = enabled
        self.startMinuteOfDay = startMinuteOfDay
        self.endMinuteOfDay = endMinuteOfDay
    }
    
    func messagePackValue() -> MessagePackValue {
        let dayOfWeekPack: MessagePackValue = .uint(self.dayOfWeek.rawValue)
        let enabledPack: MessagePackValue = .bool(self.enabled)
        let startMinuteOfDayPack: MessagePackValue = .uint(self.startMinuteOfDay)
        let endMinuteOfDayPack: MessagePackValue = .uint(self.endMinuteOfDay)
        
        let loadControlDayConfigurationArray = [dayOfWeekPack, enabledPack, startMinuteOfDayPack, endMinuteOfDayPack]
        let loadControlDayConfigurationMPV: MessagePackValue = .array(loadControlDayConfigurationArray)
        
        return loadControlDayConfigurationMPV
    }
}
