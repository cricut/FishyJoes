/// These are proxy types for hanging protocols off of. They do conversions to/from their associated SwiftType. See also the `NodeConverter` and `JavaConverter` subprotocols.
public protocol Converter {
    associatedtype SwiftType = Self
}

// Many concrete types can be their own converters
extension Bool: Converter {}
extension UInt8: Converter {}
extension UInt16: Converter {}
extension UInt32: Converter {}
extension UInt64: Converter {}
extension UInt: Converter {}
extension Int8: Converter {}
extension Int16: Converter {}
extension Int32: Converter {}
extension Int64: Converter {}
extension Int: Converter {}
extension Float: Converter {}
extension Double: Converter {}
extension String: Converter {}

// Void, tuples, and functions are unextendable; they need separate converters
public enum VoidConverter: Converter {
    public typealias SwiftType = Void
}

public enum Tuple2Converter<T0: Converter, T1: Converter>: Converter {
    public typealias SwiftType = (T0.SwiftType, T1.SwiftType)
}

public enum Tuple3Converter<T0: Converter, T1: Converter, T2: Converter>: Converter {
    public typealias SwiftType = (T0.SwiftType, T1.SwiftType, T2.SwiftType)
}

public enum Tuple4Converter<T0: Converter, T1: Converter, T2: Converter, T3: Converter>: Converter {
    public typealias SwiftType = (T0.SwiftType, T1.SwiftType, T2.SwiftType, T3.SwiftType)
}

public enum Tuple5Converter<T0: Converter, T1: Converter, T2: Converter, T3: Converter, T4: Converter>: Converter {
    public typealias SwiftType = (T0.SwiftType, T1.SwiftType, T2.SwiftType, T3.SwiftType, T4.SwiftType)
}

public enum Tuple6Converter<T0: Converter, T1: Converter, T2: Converter, T3: Converter, T4: Converter, T5: Converter>: Converter {
    public typealias SwiftType = (T0.SwiftType, T1.SwiftType, T2.SwiftType, T3.SwiftType, T4.SwiftType, T5.SwiftType)
}

public enum Function0Converter<R: Converter>: Converter {
    public typealias SwiftType = () throws -> R.SwiftType
}

public enum Function1Converter<P0: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType) throws -> R.SwiftType
}

public enum Function2Converter<P0: Converter, P1: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType) throws -> R.SwiftType
}

public enum Function3Converter<P0: Converter, P1: Converter, P2: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType) throws -> R.SwiftType
}

public enum Function4Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType) throws -> R.SwiftType
}

public enum Function5Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, P4: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType, P4.SwiftType) throws -> R.SwiftType
}

public enum Function6Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, P4: Converter, P5: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType, P4.SwiftType, P5.SwiftType) throws -> R.SwiftType
}

// Anything generic should have a separate converter
public enum ArrayConverter<ElementConverter: Converter>: Converter {
    public typealias SwiftType = [ElementConverter.SwiftType]
}

public enum DictionaryConverter<KeyConverter: Converter, ValueConverter: Converter>: Converter where KeyConverter.SwiftType: Hashable {
    public typealias SwiftType = [KeyConverter.SwiftType: ValueConverter.SwiftType]
}

public enum SetConverter<ElementConverter: Converter>: Converter where ElementConverter.SwiftType: Hashable {
    public typealias SwiftType = Set<ElementConverter.SwiftType>
}

public enum OptionalConverter<WrappedConverter: Converter>: Converter {
    public typealias SwiftType = WrappedConverter.SwiftType?
}

public enum RangeConverter<BoundConverter: Converter>: Converter where BoundConverter.SwiftType: Comparable {
    public typealias SwiftType = Range<BoundConverter.SwiftType>
}

public enum ClosedRangeConverter<BoundConverter: Converter>: Converter where BoundConverter.SwiftType: Comparable {
    public typealias SwiftType = ClosedRange<BoundConverter.SwiftType>
}
