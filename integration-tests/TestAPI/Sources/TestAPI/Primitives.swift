//
//  Primitives.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/9/21.
//

/// <!-- FishyJoes.export(Primitives) -->
public enum Primitives {
    /// <!-- FishyJoes.export(falseBool) -->
    public static let falseBool: Bool = false
    /// <!-- FishyJoes.export(trueBool) -->
    public static let trueBool = true
    /// <!-- FishyJoes.export(zeroUInt8) -->
    public static let zeroUInt8: UInt8 = 0
    /// <!-- FishyJoes.export(minUInt8) -->
    public static let minUInt8: UInt8 = .min
    /// <!-- FishyJoes.export(maxUInt8) -->
    public static let maxUInt8: UInt8 = .max
    /// <!-- FishyJoes.export(zeroUInt16) -->
    public static let zeroUInt16: UInt16 = 0
    /// <!-- FishyJoes.export(minUInt16) -->
    public static let minUInt16: UInt16 = .min
    /// <!-- FishyJoes.export(maxUInt16) -->
    public static let maxUInt16: UInt16 = .max
    /// <!-- FishyJoes.export(zeroUInt32) -->
    public static let zeroUInt32: UInt32 = 0
    /// <!-- FishyJoes.export(minUInt32) -->
    public static let minUInt32: UInt32 = .min
    /// <!-- FishyJoes.export(maxUInt32) -->
    public static let maxUInt32: UInt32 = .max
    // TODO: UInt64
//    /// <!-- FishyJoes.export(zeroUInt64) -->
//    public static let zeroUInt64: UInt64 = 0
//    /// <!-- FishyJoes.export(minUInt64) -->
//    public static let minUInt64: UInt64 = .min
//    /// <!-- FishyJoes.export(maxUInt64) -->
//    public static let maxUInt64: UInt64 = .max
    /// <!-- FishyJoes.export(zeroInt8) -->
    public static let zeroInt8: Int8 = 0
    /// <!-- FishyJoes.export(minInt8) -->
    public static let minInt8: Int8 = .min
    /// <!-- FishyJoes.export(maxInt8) -->
    public static let maxInt8: Int8 = .max
    /// <!-- FishyJoes.export(zeroInt16) -->
    public static let zeroInt16: Int16 = 0
    /// <!-- FishyJoes.export(minInt16) -->
    public static let minInt16: Int16 = .min
    /// <!-- FishyJoes.export(maxInt16) -->
    public static let maxInt16: Int16 = .max
    /// <!-- FishyJoes.export(zeroInt32) -->
    public static let zeroInt32: Int32 = 0
    /// <!-- FishyJoes.export(minInt32) -->
    public static let minInt32: Int32 = .min
    /// <!-- FishyJoes.export(maxInt32) -->
    public static let maxInt32: Int32 = .max
    // TODO: Int64
//    /// <!-- FishyJoes.export(zeroInt64) -->
//    public static let zeroInt64: Int64 = 0
//    /// <!-- FishyJoes.export(minInt64) -->
//    public static let minInt64: Int64 = .min
//    /// <!-- FishyJoes.export(maxInt64) -->
//    public static let maxInt64: Int64 = .max
    /// <!-- FishyJoes.export(zeroInt) -->
    public static let zeroInt: Int = 0
    /// <!-- FishyJoes.export(minInt) -->
    public static let minInt: Int = .min
    /// <!-- FishyJoes.export(maxInt) -->
    public static let maxInt: Int = .max
    /// <!-- FishyJoes.export(zeroFloat) -->
    public static let zeroFloat: Float = 0
    /// <!-- FishyJoes.export(minFloat) -->
    public static let minFloat: Float = -.greatestFiniteMagnitude
    /// <!-- FishyJoes.export(maxFloat) -->
    public static let maxFloat: Float = .greatestFiniteMagnitude
    /// <!-- FishyJoes.export(zeroDouble) -->
    public static let zeroDouble: Double = 0
    /// <!-- FishyJoes.export(minDouble) -->
    public static let minDouble: Double = -.greatestFiniteMagnitude
    /// <!-- FishyJoes.export(maxDouble) -->
    public static let maxDouble: Double = .greatestFiniteMagnitude
    
    /// <!-- FishyJoes.export(echoBool) -->
    public static func echoBool(value: Bool) -> Bool { return value }
    /// <!-- FishyJoes.export(echoUInt8) -->
    public static func echoUInt8(value: UInt8) -> UInt8 { return value }
    /// <!-- FishyJoes.export(echoUInt16) -->
    public static func echoUInt16(value: UInt16) -> UInt16 { return value }
    /// <!-- FishyJoes.export(echoUInt32) -->
    public static func echoUInt32(value: UInt32) -> UInt32 { return value }
//    /// <!-- FishyJoes.export(echoUInt64) -->
//    public static func echoUInt64(value: UInt64) -> UInt64 { return value }
    /// <!-- FishyJoes.export(echoInt8) -->
    public static func echoInt8(value: Int8) -> Int8 { return value }
    /// <!-- FishyJoes.export(echoInt16) -->
    public static func echoInt16(value: Int16) -> Int16 { return value }
    /// <!-- FishyJoes.export(echoInt32) -->
    public static func echoInt32(value: Int32) -> Int32 { return value }
//    /// <!-- FishyJoes.export(echoInt64) -->
//    public static func echoInt64(value: Int64) -> Int64 { return value }
    /// <!-- FishyJoes.export(echoFloat) -->
    public static func echoFloat(value: Float) -> Float { return value }
    /// <!-- FishyJoes.export(echoDouble) -->
    public static func echoDouble(value: Double) -> Double { return value }
}
