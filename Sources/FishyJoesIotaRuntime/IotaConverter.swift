@_exported import FishyJoesCommonRuntime
import Foundation

// MARK: - Iota Type Conversion Protocols

public protocol IotaConverter: Converter {
    associatedtype CType = foreignObject

    static func peekIota(_ value: CType, env: Env) throws -> SwiftType
    static func peekIota(object: foreignObject, env: Env) throws -> SwiftType

    static func consumeIota(_ value: CType, env: Env) throws -> SwiftType
    static func consumeIota(object: foreignObject, env: Env) throws -> SwiftType

    static func toIota(_ value: SwiftType, env: Env) throws -> CType
    static func toIotaObject(_ value: SwiftType, env: Env) throws -> foreignObject
}

extension IotaConverter {
    public static func consumeIota(_ value: CType, env: Env) throws -> SwiftType where CType == foreignObject {
        defer { env.deleteRef(value) }
        return try peekIota(value, env: env)
    }

    @_disfavoredOverload
    public static func consumeIota(_ value: CType, env: Env) throws -> SwiftType {
        defer { if let value = value as? foreignObject { env.deleteRef(value) } }
        return try peekIota(value, env: env)
    }

    public static func consumeIota(object: foreignObject, env: Env) throws -> SwiftType {
        defer { env.deleteRef(object) }
        return try peekIota(object: object, env: env)
    }
}

extension IotaConverter where CType == foreignObject {
    public static func toIotaObject(_ value: SwiftType, env: Env) throws -> foreignObject {
        try toIota(value, env: env)
    }
    public static func peekIota(object: foreignObject, env: Env) throws -> SwiftType {
        try peekIota(object, env: env)
    }
}

public protocol IotaMutator: IotaConverter {
    static func mutateIota(_ this: CType, to value: SwiftType, env: Env) throws
}

extension IotaMutator {
    public static func withMutatingIota<R>(_ this: CType, env: Env, body: (inout SwiftType) throws -> R) throws -> R {
        var swiftThis = try peekIota(this, env: env)
        let result = try body(&swiftThis)
        try mutateIota(this, to: swiftThis, env: env)
        return result
    }
}

public protocol IotaReferenceMutator: IotaMutator where CType == foreignObject {}

extension IotaReferenceMutator {
    public static func mutateIota(_ this: foreignObject, to value: SwiftType, env: Env) throws {
        try Box<SwiftType>.peekIota(this, env: env).value = value
    }
}

// MARK: - Primitive Type Conversions

extension VoidConverter: IotaConverter {
    public typealias CType = Void

    public static func peekIota(_ value: Void, env: Env) throws {}
    public static func toIota(_ value: Void, env: Env) throws {}

    public static func peekIota(object: foreignObject, env: Env) throws {}
    public static func toIotaObject(_ value: Void, env: Env) throws -> foreignObject { nil }
}

extension Bool: IotaConverter {
    public typealias CType = UInt8

    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> CType

    static var iotaTrue = Env.CallbackMap<foreignObject>()
    static var iotaFalse = Env.CallbackMap<foreignObject>()
    static var valueMethod = Env.CallbackMap<ValueMethod>()

    public static func peekIota(_ value: CType, env: Env) throws -> Self {
        value != 0
    }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) } != 0
    }

    public static func toIota(_ value: Self, env: Env) throws -> CType {
        value ? 1 : 0
    }

    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        env.newRef(value ? Self.iotaTrue[env] : Self.iotaFalse[env])
    }
}

@_cdecl("Swift_Bool_setup")
public func Bool_iota_setup(
    envRef: EnvRef,
    iotaTrue: foreignObject,
    iotaFalse: foreignObject,
    valueMethod: @escaping Bool.ValueMethod
) {
    let env = Env(envRef)
    if Bool.iotaTrue.isInitialized(env) { return }
    Bool.iotaTrue[env] = env.newRef(iotaTrue)
    Bool.iotaFalse[env] = env.newRef(iotaFalse)
    Bool.valueMethod[env] = valueMethod
}

extension Int8: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Int8_setup")
public func Int8_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int8.ValueMethod,
    constructor: @escaping Int8.Constructor
) {
    let env = Env(envRef)
    if Int8.valueMethod.isInitialized(env) { return }
    Int8.valueMethod[env] = valueMethod
    Int8.constructor[env] = constructor
}

extension Int16: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Int16_setup")
public func Int16_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int16.ValueMethod,
    constructor: @escaping Int16.Constructor
) {
    let env = Env(envRef)
    if Int16.valueMethod.isInitialized(env) { return }
    Int16.valueMethod[env] = valueMethod
    Int16.constructor[env] = constructor
}

extension Int32: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Int32_setup")
public func Int32_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int32.ValueMethod,
    constructor: @escaping Int32.Constructor
) {
    let env = Env(envRef)
    if Int32.valueMethod.isInitialized(env) { return }
    Int32.valueMethod[env] = valueMethod
    Int32.constructor[env] = constructor
}

extension Int64: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Int64_setup")
public func Int64_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int64.ValueMethod,
    constructor: @escaping Int64.Constructor
) {
    let env = Env(envRef)
    if Int64.valueMethod.isInitialized(env) { return }
    Int64.valueMethod[env] = valueMethod
    Int64.constructor[env] = constructor
}

extension Int: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Int_setup")
public func Int_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int.ValueMethod,
    constructor: @escaping Int.Constructor
) {
    let env = Env(envRef)
    if Int.valueMethod.isInitialized(env) { return }
    Int.valueMethod[env] = valueMethod
    Int.constructor[env] = constructor
}

extension UInt8: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_UInt8_setup")
public func UInt8_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt8.ValueMethod,
    constructor: @escaping UInt8.Constructor
) {
    let env = Env(envRef)
    if UInt8.valueMethod.isInitialized(env) { return }
    UInt8.valueMethod[env] = valueMethod
    UInt8.constructor[env] = constructor
}

extension UInt16: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_UInt16_setup")
public func UInt16_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt16.ValueMethod,
    constructor: @escaping UInt16.Constructor
) {
    let env = Env(envRef)
    if UInt16.valueMethod.isInitialized(env) { return }
    UInt16.valueMethod[env] = valueMethod
    UInt16.constructor[env] = constructor
}

extension UInt32: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_UInt32_setup")
public func UInt32_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt32.ValueMethod,
    constructor: @escaping UInt32.Constructor
) {
    let env = Env(envRef)
    if UInt32.valueMethod.isInitialized(env) { return }
    UInt32.valueMethod[env] = valueMethod
    UInt32.constructor[env] = constructor
}

extension UInt64: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_UInt64_setup")
public func UInt64_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt64.ValueMethod,
    constructor: @escaping UInt64.Constructor
) {
    let env = Env(envRef)
    if UInt64.valueMethod.isInitialized(env) { return }
    UInt64.valueMethod[env] = valueMethod
    UInt64.constructor[env] = constructor
}

extension UInt: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_UInt_setup")
public func UInt_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt.ValueMethod,
    constructor: @escaping UInt.Constructor
) {
    let env = Env(envRef)
    if UInt.valueMethod.isInitialized(env) { return }
    UInt.valueMethod[env] = valueMethod
    UInt.constructor[env] = constructor
}

extension Float: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Float_setup")
public func Float_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping Float.ValueMethod,
    constructor: @escaping Float.Constructor
) {
    let env = Env(envRef)
    if Float.valueMethod.isInitialized(env) { return }
    Float.valueMethod[env] = valueMethod
    Float.constructor[env] = constructor
}

extension Double: IotaConverter {
    public typealias ValueMethod = @convention(c) (foreignObject, foreignOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> foreignObject
    public static func peekIota(_ value: Self, env: Env) throws -> Self { value }
    public static func toIota(_ value: Self, env: Env) throws -> Self { value }

    public static func peekIota(object: foreignObject, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    public static func toIotaObject(_ value: Self, env: Env) throws -> foreignObject {
        constructor[env](value)
    }
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Double_setup")
public func Double_iota_setup(
    envRef: EnvRef,
    valueMethod: @escaping Double.ValueMethod,
    constructor: @escaping Double.Constructor
) {
    let env = Env(envRef)
    if Double.valueMethod.isInitialized(env) { return }
    Double.valueMethod[env] = valueMethod
    Double.constructor[env] = constructor
}

// MARK: - String Type Conversion

@_cdecl("Swift_String_setup")
public func String_iota_setup(
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

@_cdecl("Swift_String_utf8_setup")
public func String_iota_utf8_setup(
    envRef: EnvRef,
    getLengthMethod: @escaping @convention(c) (foreignObject, foreignOutExn) -> Int,
    getUtf8Method: @escaping @convention(c) (foreignObject, UnsafeMutablePointer<CChar>, foreignOutExn) -> Void,
    constructor: @escaping @convention(c) (UnsafePointer<CChar>, Int, foreignOutExn) -> foreignObject
) {
    let env = Env(envRef)
    if String.getUtf8LengthMethod.isInitialized(env) { return }
    String.getUtf8LengthMethod[env] = getLengthMethod
    String.getUtf8Method[env] = getUtf8Method
    String.utf8Constructor[env] = constructor
}

struct AllocationError: Error {}
struct StringDecodingError: Error {}

extension String: IotaConverter {
    fileprivate static var getLengthMethod = Env.CallbackMap<(@convention(c) (foreignObject, foreignOutExn) -> Int)>()
    fileprivate static var getUtf16Method = Env.CallbackMap<(@convention(c) (foreignObject, UnsafeMutablePointer<unichar>, foreignOutExn) -> Void)>()
    fileprivate static var constructor = Env.CallbackMap<(@convention(c) (UnsafePointer<unichar>, Int, foreignOutExn) -> foreignObject)>()
    fileprivate static var getUtf8LengthMethod = Env.CallbackMap<(@convention(c) (foreignObject, foreignOutExn) -> Int)>()
    fileprivate static var getUtf8Method = Env.CallbackMap<(@convention(c) (foreignObject, UnsafeMutablePointer<CChar>, foreignOutExn) -> Void)>()
    fileprivate static var utf8Constructor = Env.CallbackMap<(@convention(c) (UnsafePointer<CChar>, Int, foreignOutExn) -> foreignObject)>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        if getUtf8LengthMethod.isInitialized(env) {
            let len8 = try env.check { exn in getUtf8LengthMethod[env](value, exn) }
            guard let bytes = UnsafeMutablePointer<CChar>(OpaquePointer(malloc(Swift.max(len8, 1)))) else {
                throw AllocationError()
            }
            defer { free(bytes) }
            try env.check { exn in getUtf8Method[env](value, bytes, exn) }
            let buffer = UnsafeRawBufferPointer(start: bytes, count: len8)
            guard let string = String(bytes: buffer, encoding: .utf8) else {
                throw StringDecodingError()
            }
            return string
        }

        let len16 = try env.check { exn in getLengthMethod[env](value, exn) }
        guard let units = UnsafeMutablePointer<unichar>(OpaquePointer(malloc(len16 * 2))) else {
            throw AllocationError()
        }
        defer { free(units) }
        try env.check { exn in getUtf16Method[env](value, units, exn) }
        return String(utf16CodeUnits: units, count: len16)
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        if utf8Constructor.isInitialized(env) {
            let bytes = Array(value.utf8CString)
            return try bytes.withUnsafeBufferPointer { buffer in
                try env.check { exn in utf8Constructor[env](buffer.baseAddress!, bytes.count - 1, exn) }
            }
        }

        let array = Array(value.utf16)
        return try array.withUnsafeBufferPointer { buffer in
            try env.check { exn in constructor[env](buffer.baseAddress!, array.count * 2, exn) }
        }
    }
}

// MARK: - Data Type Conversion

@_cdecl("Foundation_Data_setup")
public func Data_iota_setup(
    envRef: EnvRef,
    lengthMethod: @escaping Data.LengthMethod,
    bytesMethod: @escaping Data.BytesMethod,
    constructor: @escaping Data.Constructor
) {
    let env = Env(envRef)
    if Data.lengthMethod.isInitialized(env) { return }
    Data.lengthMethod[env] = lengthMethod
    Data.bytesMethod[env] = bytesMethod
    Data.constructor[env] = constructor
}

extension Data: IotaConverter {
    public typealias LengthMethod = @convention(c) (_ data: foreignObject, _ exn: foreignOutExn) -> Int32
    public typealias BytesMethod = @convention(c) (_ data: foreignObject, _ outValues: UnsafeMutableRawPointer, _ exn: foreignOutExn) -> Void
    public typealias Constructor = @convention(c) (_ bytes: UnsafeRawPointer?, _ length: Int32, _ exn: foreignOutExn) -> foreignObject

    fileprivate static var lengthMethod = Env.CallbackMap<Data.LengthMethod>()
    fileprivate static var bytesMethod = Env.CallbackMap<Data.BytesMethod>()
    fileprivate static var constructor = Env.CallbackMap<Data.Constructor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
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

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        try value.withUnsafeBytes { (buffer: UnsafeRawBufferPointer) in
            try env.check { exn in
                constructor[env](buffer.baseAddress, Int32(value.count), exn)
            }
        }
    }
}

// MARK: - URL Type Conversion

@_cdecl("Foundation_URL_setup")
public func URL_iota_setup(
    envRef: EnvRef,
    absoluteURIMethod: @escaping URL.AbsoluteURIMethod,
    constructor: @escaping URL.Constructor
) {
    let env = Env(envRef)
    if URL.absoluteURIMethod.isInitialized(env) { return }
    URL.absoluteURIMethod[env] = absoluteURIMethod
    URL.constructor[env] = constructor
}

extension URL: IotaConverter {
    public typealias AbsoluteURIMethod = @convention(c) (_ uri: foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Constructor = @convention(c) (_ string: foreignObject, _ exn: foreignOutExn) -> foreignObject

    fileprivate static var absoluteURIMethod = Env.CallbackMap<URL.AbsoluteURIMethod>()
    fileprivate static var constructor = Env.CallbackMap<URL.Constructor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let urlString = try env.check { exn in try String.consumeIota(absoluteURIMethod[env](value, exn), env: env) }
        guard let url = URL(string: urlString) else { throw MalformedURLError(message: "Not a valid URL: \(urlString)") }
        return url
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        let urlString = value.absoluteString
        return try env.check { exn in
            constructor[env](try String.toIota(urlString, env: env), exn)
        }
    }
}
