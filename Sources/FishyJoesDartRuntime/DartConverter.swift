@_exported import FishyJoesCommonRuntime
import Foundation

// MARK: - Dart Type Conversion Protocols

public protocol DartConverter: Converter {
    associatedtype CType = foreignObject

    static func peekDart(_ value: CType, env: Env) throws -> SwiftType
    static func peekDart(object: foreignObject, env: Env) throws -> SwiftType

    static func consumeDart(_ value: CType, env: Env) throws -> SwiftType
    static func consumeDart(object: foreignObject, env: Env) throws -> SwiftType

    static func toDart(_ value: SwiftType, env: Env) throws -> CType
    static func toDartObject(_ value: SwiftType, env: Env) throws -> foreignObject
}

extension DartConverter {
    public static func consumeDart(_ value: CType, env: Env) throws -> SwiftType where CType == foreignObject {
        defer { env.deleteRef(value) }
        return try peekDart(value, env: env)
    }

    @_disfavoredOverload
    public static func consumeDart(_ value: CType, env: Env) throws -> SwiftType {
        defer { if let value = value as? foreignObject { env.deleteRef(value) } }
        return try peekDart(value, env: env)
    }

    public static func consumeDart(object: foreignObject, env: Env) throws -> SwiftType {
        defer { env.deleteRef(object) }
        return try peekDart(object: object, env: env)
    }
}

protocol PrimitiveDartConverter: DartConverter {}
//     where SwiftType == Self, CType == Self {
//     typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
//     typealias Constructor = @convention(c) (Self) -> foreignObject

//     static var valueMethod: ValueMethod? { get }
//     static var constructor: Constructor? { get }
// }

extension PrimitiveDartConverter {
    // typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    // typealias Constructor = @convention(c) (Self) -> foreignObject
    // public static func peekDart(_ value: Self) throws -> Self { value }
    // public static func toDart(_ value: Self) throws -> Self { value }

    // public static func peekDart(object: foreignObject) throws -> Self {
    //     try Env.check { exn in valueMethod(object, exn) }
    // }
    // public static func toDartObject(_ value: Self) throws -> foreignObject {
    //     print("I am \(value): \(self), starting toDartObject: constructor =")
    //     dump(constructor)
    //     let res = constructor(value)
    //     print("I am \(value): \(self), I have triumphed")
    //     return res
    // }
}

extension DartConverter where CType == foreignObject {
    public static func toDartObject(_ value: SwiftType, env: Env) throws -> foreignObject {
        try toDart(value, env: env)
    }
    public static func peekDart(object: foreignObject, env: Env) throws -> SwiftType {
        try peekDart(object, env: env)
    }
}

public protocol DartMutator: DartConverter {
    static func mutateDart<R>(_ this: CType, env: Env, body: (inout SwiftType) throws -> R) throws -> R
}

// MARK: - Primitive Type Conversions

extension VoidConverter: DartConverter {
    public typealias CType = Void

    public static func peekDart(_ value: Void, env: Env) throws {}
    public static func toDart(_ value: Void, env: Env) throws {}

    public static func peekDart(object: foreignObject, env: Env) throws {}
    public static func toDartObject(_ value: Void, env: Env) throws -> foreignObject { nil }
}

extension Bool: DartConverter {
    // TODO: possible to marshall as 1-byte, but requires weird annotations
    public typealias CType = UInt32

    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> CType

    static var dartTrue = Env.CallbackMap<foreignObject>()
    static var dartFalse = Env.CallbackMap<foreignObject>()
    static var valueMethod = Env.CallbackMap<ValueMethod>()

    public static func peekDart(_ value: CType, env: Env) throws -> Self {
        value != 0
    }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) } != 0
    }

    public static func toDart(_ value: Self, env: Env) throws -> CType {
        value ? 1 : 0
    }

    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        env.newRef(value ? Self.dartTrue[env] : Self.dartFalse[env])
    }
}

@_cdecl("FishyJoesRuntime_Bool_setup")
public func Bool_dart_setup(
    envRef: EnvRef,
    dartTrue: foreignObject,
    dartFalse: foreignObject,
    valueMethod: @escaping Bool.ValueMethod
) {
    let env = Env(envRef)
    if Bool.dartTrue.isInitialized(env) { return }
    Bool.dartTrue[env] = env.newRef(dartTrue)
    Bool.dartFalse[env] = env.newRef(dartFalse)
    Bool.valueMethod[env] = valueMethod
}

extension Int8: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_Int8_setup")
public func Int8_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int8.ValueMethod,
    constructor: @escaping Int8.Constructor
) {
    let env = Env(envRef)
    if Int8.valueMethod.isInitialized(env) { return }
    Int8.valueMethod[env] = valueMethod
    Int8.constructor[env] = constructor
}

extension Int16: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_Int16_setup")
public func Int16_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int16.ValueMethod,
    constructor: @escaping Int16.Constructor
) {
    let env = Env(envRef)
    if Int16.valueMethod.isInitialized(env) { return }
    Int16.valueMethod[env] = valueMethod
    Int16.constructor[env] = constructor
}

extension Int32: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_Int32_setup")
public func Int32_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int32.ValueMethod,
    constructor: @escaping Int32.Constructor
) {
    let env = Env(envRef)
    if Int32.valueMethod.isInitialized(env) { return }
    Int32.valueMethod[env] = valueMethod
    Int32.constructor[env] = constructor
}

extension Int64: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_Int64_setup")
public func Int64_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int64.ValueMethod,
    constructor: @escaping Int64.Constructor
) {
    let env = Env(envRef)
    if Int64.valueMethod.isInitialized(env) { return }
    Int64.valueMethod[env] = valueMethod
    Int64.constructor[env] = constructor
}

extension UInt8: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_UInt8_setup")
public func UInt8_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt8.ValueMethod,
    constructor: @escaping UInt8.Constructor
) {
    let env = Env(envRef)
    if UInt8.valueMethod.isInitialized(env) { return }
    UInt8.valueMethod[env] = valueMethod
    UInt8.constructor[env] = constructor
}

extension UInt16: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_UInt16_setup")
public func UInt16_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt16.ValueMethod,
    constructor: @escaping UInt16.Constructor
) {
    let env = Env(envRef)
    if UInt16.valueMethod.isInitialized(env) { return }
    UInt16.valueMethod[env] = valueMethod
    UInt16.constructor[env] = constructor
}

extension UInt32: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_UInt32_setup")
public func UInt32_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt32.ValueMethod,
    constructor: @escaping UInt32.Constructor
) {
    let env = Env(envRef)
    if UInt32.valueMethod.isInitialized(env) { return }
    UInt32.valueMethod[env] = valueMethod
    UInt32.constructor[env] = constructor
}

extension UInt64: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_UInt64_setup")
public func UInt64_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt64.ValueMethod,
    constructor: @escaping UInt64.Constructor
) {
    let env = Env(envRef)
    if UInt64.valueMethod.isInitialized(env) { return }
    UInt64.valueMethod[env] = valueMethod
    UInt64.constructor[env] = constructor
}

extension Int: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_Int_setup")
public func Int_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int.ValueMethod,
    constructor: @escaping Int.Constructor
) {
    let env = Env(envRef)
    if Int.valueMethod.isInitialized(env) { return }
    Int.valueMethod[env] = valueMethod
    Int.constructor[env] = constructor
}

extension Float: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_Float_setup")
public func Float_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping Float.ValueMethod,
    constructor: @escaping Float.Constructor
) {
    let env = Env(envRef)
    if Float.valueMethod.isInitialized(env) { return }
    Float.valueMethod[env] = valueMethod
    Float.constructor[env] = constructor
}

extension Double: PrimitiveDartConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekDart(_ value: Self, env: Env) throws -> Self { value }
    public static func toDart(_ value: Self, env: Env) throws -> Self { value }

    public static func peekDart(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toDartObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("FishyJoesRuntime_Double_setup")
public func Double_dart_setup(
    envRef: EnvRef,
    valueMethod: @escaping Double.ValueMethod,
    constructor: @escaping Double.Constructor
) {
    let env = Env(envRef)
    if Double.valueMethod.isInitialized(env) { return }
    Double.valueMethod[env] = valueMethod
    Double.constructor[env] = constructor
}

// MARK: - Less-Primitive Type Conversions

@_cdecl("FishyJoesRuntime_String_setup")
public func String_dart_setup(
    envRef: EnvRef,
    getLengthMethod: @escaping @convention(c) (foreignObject, foreignOutExn) -> Int,
    getUtf16Method: @escaping @convention(c) (foreignObject, UnsafeMutablePointer<unichar>, foreignOutExn) -> Void,
    constructor: @escaping @convention(c) (UnsafePointer<unichar>, Int, foreignOutExn) -> foreignObject
) {
    let env = Env(envRef)
    if String.getLengthMethod.isInitialized(env) { return }
    String.getLengthMethod[env] = getLengthMethod
    String.getUtf16Method[env] = getUtf16Method
    String.constructor[env] = constructor
}

struct AllocationError: Error {}

extension String: DartConverter {
    fileprivate static var getLengthMethod = Env.CallbackMap<(@convention(c) (foreignObject, foreignOutExn) -> Int)>()
    fileprivate static var getUtf16Method = Env.CallbackMap<(@convention(c) (foreignObject, UnsafeMutablePointer<unichar>, foreignOutExn) -> Void)>()
    fileprivate static var constructor = Env.CallbackMap<(@convention(c) (UnsafePointer<unichar>, Int, foreignOutExn) -> foreignObject)>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Self {
        let len16 = try env.check { exn in getLengthMethod[env](value, exn) }
        guard let units = UnsafeMutablePointer<unichar>(OpaquePointer(malloc(len16 * 2))) else {
            throw AllocationError()
        }
        var deferred: (() -> Void)? = { free(units) }
        defer { deferred?() }
        try env.check { exn in getUtf16Method[env](value, units, exn) }
        deferred = nil
        return String(utf16CodeUnitsNoCopy: units, count: len16, freeWhenDone: true)
    }

    public static func toDart(_ value: Self, env: Env) throws -> foreignObject {
        let array = Array(value.utf16)
        return try array.withUnsafeBufferPointer { buffer in
            try env.check { exn in constructor[env](buffer.baseAddress!, array.count * 2, exn) }
        }
    }
}

@_cdecl("FishyJoesRuntime_Data_setup")
public func Data_dart_setup(
    envRef: EnvRef,
    lengthMethod: @escaping Data.LengthMethod,
    bytesMethod: @escaping Data.BytesMethod,
    constructor: @escaping Data.Constuctor
) {
    let env = Env(envRef)
    if Data.lengthMethod.isInitialized(env) { return }
    Data.lengthMethod[env] = lengthMethod
    Data.bytesMethod[env] = bytesMethod
    Data.constuctor[env] = constructor
}

extension Data: DartConverter {
    public typealias LengthMethod = @convention(c) (_ data: foreignObject, _ exn: foreignOutExn) -> Int32
    public typealias BytesMethod = @convention(c) (_ data: foreignObject, _ outValues: UnsafeMutableRawPointer, _ exn: foreignOutExn) -> Void
    public typealias Constuctor = @convention(c) (_ bytes: UnsafeRawPointer?, _ length: Int32, _ exn: foreignOutExn) -> foreignObject

    fileprivate static var lengthMethod = Env.CallbackMap<Data.LengthMethod>()
    fileprivate static var bytesMethod = Env.CallbackMap<Data.BytesMethod>()
    fileprivate static var constuctor = Env.CallbackMap<Data.Constuctor>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let length = try env.check { exn in Int(lengthMethod[env](value, exn)) }
        guard let buffer = malloc(length) else {
            throw AllocationError()
        }
        var deferred: (() -> Void)? = { free(buffer) }
        defer { deferred?() }
        try env.check { exn in bytesMethod[env](value, buffer, exn) }
        deferred = nil

        return Data(bytesNoCopy: buffer, count: length, deallocator: .free)
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        try value.withUnsafeBytes { (buffer: UnsafeRawBufferPointer) in
            try env.check { exn in
                constuctor[env](buffer.baseAddress, Int32(value.count), exn)
            }
        }
    }
}
