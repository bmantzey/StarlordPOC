import Foundation


// Specific Types
public func charValue(data: Data, isBigEndian: Bool) -> CChar {
    let aChar: UInt8 = UInt8(bitPattern: data.withUnsafeBytes( { $0.pointee }))
    return CChar(aChar as UInt8)
}
public func boolValue(data: Data, isBigEndian: Bool) -> Bool {
    let oneByte: UInt8 = UInt8(bitPattern: data.withUnsafeBytes( { $0.pointee }))
    return oneByte != 0
}
public func floatValue(data: Data, isBigEndian: Bool) -> Float {
    if (isBigEndian) {
        return Float(bitPattern: UInt32(littleEndian: data.withUnsafeBytes { $0.pointee } ))
    }
    else {
        return Float(bitPattern: UInt32(bigEndian: data.withUnsafeBytes { $0.pointee }))
    }
}
public func doubleValue(data: Data, isBigEndian: Bool) -> Double {
    
    if (isBigEndian) {
        return Double(bitPattern: UInt64(littleEndian: data.withUnsafeBytes { $0.pointee } ))
    }
    else {
        return Double(bitPattern: UInt64(bigEndian: data.withUnsafeBytes { $0.pointee } ))
    }
}

// 1 byte
public func int8Value(data: Data, isBigEndian: Bool) -> Int8 {
    if (isBigEndian) {
        let temp: Int8 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}
public func uint8Value(data: Data, isBigEndian: Bool) -> UInt8 {
    if (isBigEndian) {
        let temp: UInt8 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}

// 2 bytes
public func int16Value(data: Data, isBigEndian: Bool) -> Int16 {
    
    if (isBigEndian) {
        let temp: Int16 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}
public func uint16Value(data: Data, isBigEndian: Bool) -> UInt16 {
    
    if (isBigEndian) {
        let temp: UInt16 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}

// 4 bytes
public func int32Value(data: Data, isBigEndian: Bool) -> Int32 {
    
    if (isBigEndian) {
        let temp: Int32 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}
public func uint32Value(data: Data, isBigEndian: Bool) -> UInt32 {
    
    if (isBigEndian) {
        let temp: UInt32 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}

// 8 bytes
public func uint64Value(data: Data, isBigEndian: Bool) -> UInt64 {
    
    if (isBigEndian) {
        let temp: UInt64 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}
public func int64Value(data: Data, isBigEndian: Bool) -> Int64 {
    
    if (isBigEndian) {
        let temp: Int64 = data.withUnsafeBytes{ $0.pointee }
        return temp.bigEndian
    }
    else {
        return data.withUnsafeBytes{ $0.pointee }
    }
}
