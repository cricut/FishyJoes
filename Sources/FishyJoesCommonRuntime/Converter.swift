import Foundation

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

extension Data: Converter {}
extension URL: Converter {}

extension AttributeContainer: Converter {}
extension AttributeContainer.FoundationAttributes: Converter {}
extension AttributedString: Converter {}
extension AttributedString.CharacterView: Converter {}
extension AttributedString.Index: Converter {}
extension AttributedString.Runs: Converter {}
extension AttributedString.Runs.Index: Converter {}
extension AttributedString.Runs.Run: Converter {}
extension AttributedString.UnicodeScalarView: Converter {}
extension AttributedSubstring: Converter {}

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
    public static var arity: Int { 0 }
}

public enum Function1Converter<P0: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType) throws -> R.SwiftType
    public static var arity: Int { 1 }
}

public enum Function2Converter<P0: Converter, P1: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType) throws -> R.SwiftType
    public static var arity: Int { 2 }
}

public enum Function3Converter<P0: Converter, P1: Converter, P2: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType) throws -> R.SwiftType
    public static var arity: Int { 3 }
}

public enum Function4Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType) throws -> R.SwiftType
    public static var arity: Int { 4 }
}

public enum Function5Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, P4: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType, P4.SwiftType) throws -> R.SwiftType
    public static var arity: Int { 5 }
}

public enum Function6Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, P4: Converter, P5: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType, P4.SwiftType, P5.SwiftType) throws -> R.SwiftType
    public static var arity: Int { 6 }
}

public enum AsyncFunction0Converter<R: Converter>: Converter {
    public typealias SwiftType = () async throws -> R.SwiftType
    public typealias FutureFunctionConverter = Function0Converter<FutureConverter<R>>
    public static var arity: Int { 0 }
    public static func toFutureFunction(_ fn: @escaping SwiftType) -> FutureFunctionConverter.SwiftType {
        { Future { try await fn() } }
    }
    public static func fromFutureFunction(_ fn: @escaping FutureFunctionConverter.SwiftType) -> SwiftType {
        { try await fn().value }
    }
}

public enum AsyncFunction1Converter<P0: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType) async throws -> R.SwiftType
    public typealias FutureFunctionConverter = Function1Converter<P0, FutureConverter<R>>
    public static var arity: Int { 1 }
    public static func toFutureFunction(_ fn: @escaping SwiftType) -> FutureFunctionConverter.SwiftType {
        { p0 in Future { try await fn(p0) } }
    }
    public static func fromFutureFunction(_ fn: @escaping FutureFunctionConverter.SwiftType) -> SwiftType {
        { p0 in try await fn(p0).value }
    }
}

public enum AsyncFunction2Converter<P0: Converter, P1: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType) async throws -> R.SwiftType
    public typealias FutureFunctionConverter = Function2Converter<P0, P1, FutureConverter<R>>
    public static var arity: Int { 2 }
    public static func toFutureFunction(_ fn: @escaping SwiftType) -> FutureFunctionConverter.SwiftType {
        { p0, p1 in Future { try await fn(p0, p1) } }
    }
    public static func fromFutureFunction(_ fn: @escaping FutureFunctionConverter.SwiftType) -> SwiftType {
        { p0, p1 in try await fn(p0, p1).value }
    }
}

public enum AsyncFunction3Converter<P0: Converter, P1: Converter, P2: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType) async throws -> R.SwiftType
    public typealias FutureFunctionConverter = Function3Converter<P0, P1, P2, FutureConverter<R>>
    public static var arity: Int { 3 }
    public static func toFutureFunction(_ fn: @escaping SwiftType) -> FutureFunctionConverter.SwiftType {
        { p0, p1, p2 in Future { try await fn(p0, p1, p2) } }
    }
    public static func fromFutureFunction(_ fn: @escaping FutureFunctionConverter.SwiftType) -> SwiftType {
        { p0, p1, p2 in try await fn(p0, p1, p2).value }
    }
}

public enum AsyncFunction4Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType) async throws -> R.SwiftType
    public typealias FutureFunctionConverter = Function4Converter<P0, P1, P2, P3, FutureConverter<R>>
    public static var arity: Int { 4 }
    public static func toFutureFunction(_ fn: @escaping SwiftType) -> FutureFunctionConverter.SwiftType {
        { p0, p1, p2, p3 in Future { try await fn(p0, p1, p2, p3) } }
    }
    public static func fromFutureFunction(_ fn: @escaping FutureFunctionConverter.SwiftType) -> SwiftType {
        { p0, p1, p2, p3 in try await fn(p0, p1, p2, p3).value }
    }
}

public enum AsyncFunction5Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, P4: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType, P4.SwiftType) async throws -> R.SwiftType
    public typealias FutureFunctionConverter = Function5Converter<P0, P1, P2, P3, P4, FutureConverter<R>>
    public static var arity: Int { 5 }
    public static func toFutureFunction(_ fn: @escaping SwiftType) -> FutureFunctionConverter.SwiftType {
        { p0, p1, p2, p3, p4 in Future { try await fn(p0, p1, p2, p3, p4) } }
    }
    public static func fromFutureFunction(_ fn: @escaping FutureFunctionConverter.SwiftType) -> SwiftType {
        { p0, p1, p2, p3, p4 in try await fn(p0, p1, p2, p3, p4).value }
    }
}

public enum AsyncFunction6Converter<P0: Converter, P1: Converter, P2: Converter, P3: Converter, P4: Converter, P5: Converter, R: Converter>: Converter {
    public typealias SwiftType = (P0.SwiftType, P1.SwiftType, P2.SwiftType, P3.SwiftType, P4.SwiftType, P5.SwiftType) async throws -> R.SwiftType
    public typealias FutureFunctionConverter = Function6Converter<P0, P1, P2, P3, P4, P5, FutureConverter<R>>
    public static var arity: Int { 6 }
    public static func toFutureFunction(_ fn: @escaping SwiftType) -> FutureFunctionConverter.SwiftType {
        { p0, p1, p2, p3, p4, p5 in Future { try await fn(p0, p1, p2, p3, p4, p5) } }
    }
    public static func fromFutureFunction(_ fn: @escaping FutureFunctionConverter.SwiftType) -> SwiftType {
        { p0, p1, p2, p3, p4, p5 in try await fn(p0, p1, p2, p3, p4, p5).value }
    }
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

public enum FutureConverter<OutputConverter: Converter>: Converter {
    public typealias SwiftType = Future<OutputConverter.SwiftType>
}

public enum ResultConverter<SuccessConverter: Converter, FailureConverter: Converter>: Converter where FailureConverter.SwiftType: Error {
    public typealias SwiftType = Result<SuccessConverter.SwiftType, FailureConverter.SwiftType>
}
