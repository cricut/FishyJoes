//
//  Primitives.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/9/21.
//

/// <!-- FishyJoes.export(Primitives) -->
public enum Primitives {
    // MARK: - Primitive Values

    /// <!-- FishyJoes.export(falseBool) -->
    public static let falseBool = false
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
    /// <!-- FishyJoes.export(zeroUInt64) -->
    public static let zeroUInt64: UInt64 = 0
    /// <!-- FishyJoes.export(minUInt64) -->
    public static let minUInt64: UInt64 = .min
    /// <!-- FishyJoes.export(maxUInt64) -->
    public static let maxUInt64: UInt64 = .max
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
    /// <!-- FishyJoes.export(zeroInt64) -->
    public static let zeroInt64: Int64 = 0
    /// <!-- FishyJoes.export(minInt64) -->
    public static let minInt64: Int64 = .min
    /// <!-- FishyJoes.export(maxInt64) -->
    public static let maxInt64: Int64 = .max
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

    // MARK: - Arrays of Primitive Values

    /// <!-- FishyJoes.export(manyBool) -->
    public static let manyBool: [Bool] = [false, true]
    /// <!-- FishyJoes.export(manyUInt8) -->
    public static let manyUInt8: [UInt8] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyUInt16) -->
    public static let manyUInt16: [UInt16] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyUInt32) -->
    public static let manyUInt32: [UInt32] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyUInt64) -->
    public static let manyUInt64: [UInt64] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyInt8) -->
    public static let manyInt8: [Int8] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyInt16) -->
    public static let manyInt16: [Int16] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyInt32) -->
    public static let manyInt32: [Int32] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyInt64) -->
    public static let manyInt64: [Int64] = [0, .min, .max]
    /// <!-- FishyJoes.export(manyFloat) -->
    public static let manyFloat: [Float] = [0, -.greatestFiniteMagnitude, .greatestFiniteMagnitude]
    /// <!-- FishyJoes.export(manyDouble) -->
    public static let manyDouble: [Double] = [0, -.greatestFiniteMagnitude, .greatestFiniteMagnitude]

    // MARK: - Arrays of Optional Primitive Values

    /// <!-- FishyJoes.export(manyMaybeBool) -->
    public static let manyMaybeBool: [Bool?] = [nil, false, true]
    /// <!-- FishyJoes.export(manyMaybeUInt8) -->
    public static let manyMaybeUInt8: [UInt8?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeUInt16) -->
    public static let manyMaybeUInt16: [UInt16?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeUInt32) -->
    public static let manyMaybeUInt32: [UInt32?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeUInt64) -->
    public static let manyMaybeUInt64: [UInt64?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeInt8) -->
    public static let manyMaybeInt8: [Int8?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeInt16) -->
    public static let manyMaybeInt16: [Int16?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeInt32) -->
    public static let manyMaybeInt32: [Int32?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeInt64) -->
    public static let manyMaybeInt64: [Int64?] = [nil, 0, .min, .max]
    /// <!-- FishyJoes.export(manyMaybeFloat) -->
    public static let manyMaybeFloat: [Float?] = [nil, 0, -.greatestFiniteMagnitude, .greatestFiniteMagnitude]
    /// <!-- FishyJoes.export(manyMaybeDouble) -->
    public static let manyMaybeDouble: [Double?] = [nil, 0, -.greatestFiniteMagnitude, .greatestFiniteMagnitude]

    // MARK: - Functions Taking / Returning Primitive Types

    /// <!-- FishyJoes.export(echoBool) -->
    public static func echoBool(value: Bool) -> Bool { return value }
    /// <!-- FishyJoes.export(echoUInt8) -->
    public static func echoUInt8(value: UInt8) -> UInt8 { return value }
    /// <!-- FishyJoes.export(echoUInt16) -->
    public static func echoUInt16(value: UInt16) -> UInt16 { return value }
    /// <!-- FishyJoes.export(echoUInt32) -->
    public static func echoUInt32(value: UInt32) -> UInt32 { return value }
    /// <!-- FishyJoes.export(echoUInt64) -->
    public static func echoUInt64(value: UInt64) -> UInt64 { return value }
    /// <!-- FishyJoes.export(echoInt8) -->
    public static func echoInt8(value: Int8) -> Int8 { return value }
    /// <!-- FishyJoes.export(echoInt16) -->
    public static func echoInt16(value: Int16) -> Int16 { return value }
    /// <!-- FishyJoes.export(echoInt32) -->
    public static func echoInt32(value: Int32) -> Int32 { return value }
    /// <!-- FishyJoes.export(echoInt64) -->
    public static func echoInt64(value: Int64) -> Int64 { return value }
    /// <!-- FishyJoes.export(echoFloat) -->
    public static func echoFloat(value: Float) -> Float { return value }
    /// <!-- FishyJoes.export(echoDouble) -->
    public static func echoDouble(value: Double) -> Double { return value }

    // MARK: - Functions Taking / Returning Optional Primitive Types

    /// <!-- FishyJoes.export(maybeEchoBool) -->
    public static func maybeEchoBool(value: Bool?) -> Bool? { return value }
    /// <!-- FishyJoes.export(maybeEchoUInt8) -->
    public static func maybeEchoUInt8(value: UInt8?) -> UInt8? { return value }
    /// <!-- FishyJoes.export(maybeEchoUInt16) -->
    public static func maybeEchoUInt16(value: UInt16?) -> UInt16? { return value }
    /// <!-- FishyJoes.export(maybeEchoUInt32) -->
    public static func maybeEchoUInt32(value: UInt32?) -> UInt32? { return value }
    /// <!-- FishyJoes.export(maybeEchoUInt64) -->
    public static func maybeEchoUInt64(value: UInt64?) -> UInt64? { return value }
    /// <!-- FishyJoes.export(maybeEchoInt8) -->
    public static func maybeEchoInt8(value: Int8?) -> Int8? { return value }
    /// <!-- FishyJoes.export(maybeEchoInt16) -->
    public static func maybeEchoInt16(value: Int16?) -> Int16? { return value }
    /// <!-- FishyJoes.export(maybeEchoInt32) -->
    public static func maybeEchoInt32(value: Int32?) -> Int32? { return value }
    /// <!-- FishyJoes.export(maybeEchoInt64) -->
    public static func maybeEchoInt64(value: Int64?) -> Int64? { return value }
    /// <!-- FishyJoes.export(maybeEchoFloat) -->
    public static func maybeEchoFloat(value: Float?) -> Float? { return value }
    /// <!-- FishyJoes.export(maybeEchoDouble) -->
    public static func maybeEchoDouble(value: Double?) -> Double? { return value }

    // MARK: - Functions Taking Closures with Primitive Types

    /// <!-- FishyJoes.export(valueMapper) -->
    public static func valueMapper(value: UInt8?, _ mapper: (UInt8?) throws -> UInt8?) rethrows -> UInt8? { return try mapper(value) }

    // MARK: - Objects with Primitive Members

    /// <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
    public struct PrimitiveHolder {
        /// <!-- FishyJoes.export(staticProperty) -->
        public static let staticProperty: [UInt8?] = [nil, 0, .min, .max]
        /// <!-- FishyJoes.export(staticMutableProperty) -->
        public static var staticMutableProperty: [UInt8?] = [nil, 0, .min, .max]

        public var b = false
        public var bq: Bool?
        public var ui8: UInt8 = .min
        public var ui8q: UInt8?
        public var ui16: UInt16 = .min
        public var ui16q: UInt16?
        public var ui32: UInt32 = .min
        public var ui32q: UInt32?
        public var ui64: UInt64 = .min
        public var ui64q: UInt64?
        public var i8: Int8 = .min
        public var i8q: Int8?
        public var i16: Int16 = .min
        public var i16q: Int16?
        public var i32: Int32 = .min
        public var i32q: Int32?
        public var i64: Int64 = .min
        public var i64q: Int64?
        public var f: Float = -.greatestFiniteMagnitude
        public var fq: Float?
        public var d: Double = -.greatestFiniteMagnitude
        public var dq: Double?

        public init(b: Bool = false, bq: Bool? = nil, ui8: UInt8 = .min, ui8q: UInt8? = nil, ui16: UInt16 = .min, ui16q: UInt16? = nil, ui32: UInt32 = .min, ui32q: UInt32? = nil, ui64: UInt64 = .min, ui64q: UInt64? = nil, i8: Int8 = .min, i8q: Int8? = nil, i16: Int16 = .min, i16q: Int16? = nil, i32: Int32 = .min, i32q: Int32? = nil, i64: Int64 = .min, i64q: Int64? = nil, f: Float = -.greatestFiniteMagnitude, fq: Float? = nil, d: Double = -.greatestFiniteMagnitude, dq: Double? = nil) {
            self.b = b
            self.bq = bq
            self.ui8 = ui8
            self.ui8q = ui8q
            self.ui16 = ui16
            self.ui16q = ui16q
            self.ui32 = ui32
            self.ui32q = ui32q
            self.ui64 = ui64
            self.ui64q = ui64q
            self.i8 = i8
            self.i8q = i8q
            self.i16 = i16
            self.i16q = i16q
            self.i32 = i32
            self.i32q = i32q
            self.i64 = i64
            self.i64q = i64q
            self.f = f
            self.fq = fq
            self.d = d
            self.dq = dq
        }
    }

    /// <!-- FishyJoes.export(defaultPrimitiveHolder) -->
    public static let defaultPrimitiveHolder = PrimitiveHolder()
}
