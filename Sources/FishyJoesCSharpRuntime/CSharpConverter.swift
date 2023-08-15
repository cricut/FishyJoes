@_exported import FishyJoesCommonRuntime
import Foundation

// MARK: - CSharp Type Conversion Protocols

public protocol CSharpConverter: Converter {
    associatedtype CType = csObject

    static func peekCSharp(_ value: CType) throws -> SwiftType
    static func peekCSharp(object: csObject) throws -> SwiftType

    static func consumeCSharp(_ value: CType) throws -> SwiftType
    static func consumeCSharp(object: csObject) throws -> SwiftType

    static func toCSharp(_ value: SwiftType) throws -> CType
    static func toCSharpObject(_ value: SwiftType) throws -> csObject
}

extension CSharpConverter {
    public static func consumeCSharp(_ value: CType) throws -> SwiftType where CType == csObject {
        defer { Env.deleteRef(value) }
        return try peekCSharp(value)
    }

    @_disfavoredOverload
    public static func consumeCSharp(_ value: CType) throws -> SwiftType {
        defer { if let value = value as? csObject { Env.deleteRef(value) } }
        return try peekCSharp(value)
    }

    public static func consumeCSharp(object: csObject) throws -> SwiftType {
        defer { Env.deleteRef(object) }
        return try peekCSharp(object: object)
    }
}

protocol PrimitiveCSharpConverter: CSharpConverter {}
//     where SwiftType == Self, CType == Self {
//     typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
//     typealias Constructor = @convention(c) (Self) -> csObject

//     static var valueMethod: ValueMethod? { get }
//     static var constructor: Constructor? { get }
// }

extension PrimitiveCSharpConverter {
    // typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    // typealias Constructor = @convention(c) (Self) -> csObject
    // public static func peekCSharp(_ value: Self) throws -> Self { value }
    // public static func toCSharp(_ value: Self) throws -> Self { value }

    // public static func peekCSharp(object: csObject) throws -> Self {
    //     try Env.check { exn in valueMethod(object, exn) }
    // }
    // public static func toCSharpObject(_ value: Self) throws -> csObject {
    //     print("I am \(value): \(self), starting toCSharpObject: constructor =")
    //     dump(constructor)
    //     let res = constructor(value)
    //     print("I am \(value): \(self), I have triumphed")
    //     return res
    // }
}

extension CSharpConverter where CType == csObject {
    public static func toCSharpObject(_ value: SwiftType) throws -> csObject {
        try toCSharp(value)
    }
    public static func peekCSharp(object: csObject) throws -> SwiftType {
        try peekCSharp(object)
    }
}

public protocol CSharpMutator: CSharpConverter {
    static func mutateCSharp<R>(_ this: CType, body: (inout SwiftType) throws -> R) throws -> R
}

// MARK: - Primitive Type Conversions

extension VoidConverter: CSharpConverter {
    public typealias CType = Void

    public static func peekCSharp(_ value: Void) throws {}
    public static func toCSharp(_ value: Void) throws {}

    public static func peekCSharp(object: csObject) throws {}
    public static func toCSharpObject(_ value: Void) throws -> csObject { nil }
}

extension Bool: CSharpConverter {
    // TODO: possible to marshall as 1-byte, but requires weird annotations
    public typealias CType = UInt32

    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> CType

    static var cSharpTrue: csObject = nil
    static var cSharpFalse: csObject = nil
    static var valueMethod: ValueMethod?

    public static func peekCSharp(_ value: CType) throws -> Self {
        value != 0
    }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) } != 0
    }

    public static func toCSharp(_ value: Self) throws -> CType {
        value ? 1 : 0
    }

    public static func toCSharpObject(_ value: Self) throws -> csObject {
        Env.newRef(value ? Self.cSharpTrue : Self.cSharpFalse)
    }
}

@_cdecl("FishyJoesRuntime_Bool_setup")
public func Bool_cSharp_setup(
    cSharpTrue: csObject,
    cSharpFalse: csObject,
    valueMethod: @escaping Bool.ValueMethod
) {
    guard Bool.cSharpTrue == nil else { return }
    Bool.cSharpTrue = Env.newRef(cSharpTrue)
    Bool.cSharpFalse = Env.newRef(cSharpFalse)
    Bool.valueMethod = valueMethod
}

extension Int8: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_Int8_setup")
public func Int8_cSharp_setup(
    valueMethod: @escaping Int8.ValueMethod,
    constructor: @escaping Int8.Constructor
) {
    guard Int8.valueMethod == nil else { return }
    Int8.valueMethod = valueMethod
    Int8.constructor = constructor
}

extension Int16: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_Int16_setup")
public func Int16_cSharp_setup(
    valueMethod: @escaping Int16.ValueMethod,
    constructor: @escaping Int16.Constructor
) {
    guard Int16.valueMethod == nil else { return }
    Int16.valueMethod = valueMethod
    Int16.constructor = constructor
}

extension Int32: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_Int32_setup")
public func Int32_cSharp_setup(
    valueMethod: @escaping Int32.ValueMethod,
    constructor: @escaping Int32.Constructor
) {
    guard Int32.valueMethod == nil else { return }
    Int32.valueMethod = valueMethod
    Int32.constructor = constructor
}

extension Int64: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_Int64_setup")
public func Int64_cSharp_setup(
    valueMethod: @escaping Int64.ValueMethod,
    constructor: @escaping Int64.Constructor
) {
    guard Int64.valueMethod == nil else { return }
    Int64.valueMethod = valueMethod
    Int64.constructor = constructor
}

extension Int: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_Int_setup")
public func Int_cSharp_setup(
    valueMethod: @escaping Int.ValueMethod,
    constructor: @escaping Int.Constructor
) {
    guard Int.valueMethod == nil else { return }
    Int.valueMethod = valueMethod
    Int.constructor = constructor
}

extension UInt8: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_UInt8_setup")
public func UInt8_cSharp_setup(
    valueMethod: @escaping UInt8.ValueMethod,
    constructor: @escaping UInt8.Constructor
) {
    guard UInt8.valueMethod == nil else { return }
    UInt8.valueMethod = valueMethod
    UInt8.constructor = constructor
}

extension UInt16: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_UInt16_setup")
public func UInt16_cSharp_setup(
    valueMethod: @escaping UInt16.ValueMethod,
    constructor: @escaping UInt16.Constructor
) {
    guard UInt16.valueMethod == nil else { return }
    UInt16.valueMethod = valueMethod
    UInt16.constructor = constructor
}

extension UInt32: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_UInt32_setup")
public func UInt32_cSharp_setup(
    valueMethod: @escaping UInt32.ValueMethod,
    constructor: @escaping UInt32.Constructor
) {
    guard UInt32.valueMethod == nil else { return }
    UInt32.valueMethod = valueMethod
    UInt32.constructor = constructor
}

extension UInt64: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_UInt64_setup")
public func UInt64_cSharp_setup(
    valueMethod: @escaping UInt64.ValueMethod,
    constructor: @escaping UInt64.Constructor
) {
    guard UInt64.valueMethod == nil else { return }
    UInt64.valueMethod = valueMethod
    UInt64.constructor = constructor
}

extension UInt: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_UInt_setup")
public func UInt_cSharp_setup(
    valueMethod: @escaping UInt.ValueMethod,
    constructor: @escaping UInt.Constructor
) {
    guard UInt.valueMethod == nil else { return }
    UInt.valueMethod = valueMethod
    UInt.constructor = constructor
}

extension Float: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_Float_setup")
public func Float_cSharp_setup(
    valueMethod: @escaping Float.ValueMethod,
    constructor: @escaping Float.Constructor
) {
    guard Float.valueMethod == nil else { return }
    Float.valueMethod = valueMethod
    Float.constructor = constructor
}

extension Double: PrimitiveCSharpConverter {
    public typealias ValueMethod = @convention(c) (csObject, csOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> csObject
    public static func peekCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func peekCSharp(object: csObject) throws -> Self {
        try Env.check { exn in try Env.unwrap(valueMethod)(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.unwrap(constructor)(value)
    }
    static var valueMethod: ValueMethod?
    static var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_Double_setup")
public func Double_cSharp_setup(
    valueMethod: @escaping Double.ValueMethod,
    constructor: @escaping Double.Constructor
) {
    guard Double.valueMethod == nil else { return }
    Double.valueMethod = valueMethod
    Double.constructor = constructor
}

// MARK: - String Type Conversion

@_cdecl("FishyJoesRuntime_String_setup")
public func String_cSharp_setup(
    getLengthMethod: @escaping @convention(c) (csObject, csOutExn) -> Int,
    getUtf16Method: @escaping @convention(c) (csObject, UnsafeMutablePointer<unichar>, csOutExn) -> Void,
    constructor: @escaping @convention(c) (UnsafePointer<unichar>, Int, csOutExn) -> csObject
) {
    guard String.getLengthMethod == nil else { return }
    String.getLengthMethod = getLengthMethod
    String.getUtf16Method = getUtf16Method
    String.constructor = constructor
}

struct AllocationError: Error {}

extension String: CSharpConverter {
    fileprivate static var getLengthMethod: (@convention(c) (csObject, csOutExn) -> Int)?
    fileprivate static var getUtf16Method: (@convention(c) (csObject, UnsafeMutablePointer<unichar>, csOutExn) -> Void)?
    fileprivate static var constructor: (@convention(c) (UnsafePointer<unichar>, Int, csOutExn) -> csObject)?

    public static func peekCSharp(_ value: csObject) throws -> Self {
        let len16 = try Env.check { exn in try Env.unwrap(getLengthMethod)(value, exn) }
        guard let units = UnsafeMutablePointer<unichar>(OpaquePointer(malloc(len16 * 2))) else {
            throw AllocationError()
        }
        var deferred: (() -> Void)? = { free(units) }
        defer { deferred?() }
        try Env.check { exn in try Env.unwrap(getUtf16Method)(value, units, exn) }
        deferred = nil
        return String(utf16CodeUnitsNoCopy: units, count: len16, freeWhenDone: true)
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        let array = Array(value.utf16)
        return try array.withUnsafeBufferPointer { buffer in
            try Env.check { exn in try Env.unwrap(constructor)(buffer.baseAddress!, array.count * 2, exn) }
        }
    }
}

// MARK: - Data Type Conversion

@_cdecl("FishyJoesRuntime_Data_setup")
public func Data_cSharp_setup(
    lengthMethod: @escaping Data.LengthMethod,
    bytesMethod: @escaping Data.BytesMethod,
    constructor: @escaping Data.Constructor
) {
    guard Data.lengthMethod == nil else { return }
    Data.lengthMethod = lengthMethod
    Data.bytesMethod = bytesMethod
    Data.constructor = constructor
}

extension Data: CSharpConverter {
    public typealias LengthMethod = @convention(c) (_ data: csObject, _ exn: csOutExn) -> Int32
    public typealias BytesMethod = @convention(c) (_ data: csObject, _ outValues: UnsafeMutableRawPointer, _ exn: csOutExn) -> Void
    public typealias Constructor = @convention(c) (_ bytes: UnsafeRawPointer?, _ length: Int32, _ exn: csOutExn) -> csObject

    fileprivate static var lengthMethod: Data.LengthMethod?
    fileprivate static var bytesMethod: Data.BytesMethod?
    fileprivate static var constructor: Data.Constructor?

    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        let length = try Env.check { exn in Int(try Env.unwrap(lengthMethod)(value, exn)) }
        guard let buffer = malloc(length) else {
            throw AllocationError()
        }
        var deferred: (() -> Void)? = { free(buffer) }
        defer { deferred?() }
        try Env.check { exn in try Env.unwrap(bytesMethod)(value, buffer, exn) }
        deferred = nil

        return Data(bytesNoCopy: buffer, count: length, deallocator: .free)
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        try value.withUnsafeBytes { (buffer: UnsafeRawBufferPointer) in
            try Env.check { exn in
                try Env.unwrap(constructor)(buffer.baseAddress, Int32(value.count), exn)
            }
        }
    }
}

// MARK: - URL Type Conversion

@_cdecl("FishyJoesRuntime_URL_setup")
public func URL_cSharp_setup(
    absoluteURIMethod: @escaping URL.AbsoluteURIMethod,
    constructor: @escaping URL.Constructor
) {
    guard URL.absoluteURIMethod == nil else { return }
    URL.absoluteURIMethod = absoluteURIMethod
    URL.constructor = constructor
}

extension URL: CSharpConverter {
    public typealias AbsoluteURIMethod = @convention(c) (_ uri: csObject, _ exn: csOutExn) -> csObject
    public typealias Constructor = @convention(c) (_ string: csObject, _ exn: csOutExn) -> csObject

    fileprivate static var absoluteURIMethod: URL.AbsoluteURIMethod?
    fileprivate static var constructor: URL.Constructor?

    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        let urlString = try Env.check { exn in try String.peekCSharp(Env.unwrap(absoluteURIMethod)(value, exn)) }
        guard let url = URL(string: urlString) else { throw MalformedURLError(message: "Not a valid URL: \(urlString)") }
        return url
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        let urlString = value.absoluteString
        return try Env.check { exn in
            try Env.unwrap(constructor)(String.toCSharp(urlString), exn)
        }
    }
}
