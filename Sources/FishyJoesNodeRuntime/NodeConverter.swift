import Foundation
import NodeAPI

// MARK: - NodeJS Type Conversion Protocols

public protocol NodeConverter: Converter {
    static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType
    static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value
    static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws
}

public protocol NodeMutator: NodeConverter {
    static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws
}

extension NodeConverter {
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

// MARK: - Primitive Type Conversions

extension VoidConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws {}
    public static func toNode(_ value: Void, env: NAPI.Env) throws -> NAPI.Value {
        // TODO: Should we cache this?
        return try env.getUndefined()
    }
}

extension Bool: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Bool {
        try env.getValueBool(value)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.getBoolean(value)
    }
}

extension UInt8: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try UInt8(env.getValueUint32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createUint32(UInt32(value))
    }
}

extension UInt16: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try UInt16(env.getValueUint32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createUint32(UInt32(value))
    }
}

extension UInt32: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try env.getValueUint32(value)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createUint32(value)
    }
}

extension UInt64: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        let (result, lossless) = try env.getValueBigintUint64(value)
        if !lossless { throw JSException(message: "bigint outside range of \(Self.self)") }
        return .init(result)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createBigintUint64(value)
    }
}

extension UInt: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> UInt {
        #if arch(wasm32)
        UInt(try env.getValueUint32(value))
        #else
        guard let result = UInt(exactly: try env.getValueDouble(value)) else {
            throw JSException(message: "number outside range of \(Self.self)")
        }
        return result
        #endif
    }

    public static func toNode(_ value: UInt, env: NAPI.Env) throws -> NAPI.Value {
        #if arch(wasm32)
        try env.createUint32(UInt32(value))
        #else
        try env.createDouble(Double(value))
        #endif
    }
}

extension Int8: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try Int8(env.getValueInt32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createInt32(Int32(value))
    }
}

extension Int16: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try Int16(env.getValueInt32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createInt32(Int32(value))
    }
}

extension Int32: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try env.getValueInt32(value)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createInt32(Int32(value))
    }
}

extension Int64: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        let (result, lossless) = try env.getValueBigintInt64(value)
        if !lossless { throw JSException(message: "bigint outside range of \(Self.self)") }
        return .init(result)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createBigintInt64(value)
    }
}

extension Int: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Int {
        #if arch(wasm32)
        return try Int(env.getValueInt32(value))
        #else
        return try Int(env.getValueInt64(value))
        #endif
    }

    public static func toNode(_ value: Int, env: NAPI.Env) throws -> NAPI.Value {
        #if arch(wasm32)
        return try env.createInt32(Int32(value))
        #else
        return try env.createInt64(Int64(value))
        #endif
    }
}

extension Float: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Float {
        try Float(env.getValueDouble(value))
    }

    public static func toNode(_ value: Float, env: NAPI.Env) throws -> NAPI.Value {
        try env.createDouble(Double(value))
    }
}

extension Double: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Double {
        try env.getValueDouble(value)
    }

    public static func toNode(_ value: Double, env: NAPI.Env) throws -> NAPI.Value {
        try env.createDouble(value)
    }
}

// MARK: - String Type Conversion

extension String: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> String {
        try env.getValueStringUtf8(value)!
    }

    public static func toNode(_ value: String, env: NAPI.Env) throws -> NAPI.Value {
        try env.createStringUtf8(value)
    }
}

// MARK: - Data Type Conversion

// Implementing the NAPI arraybuffer functions in wasm would be very difficult, since they assume storage is in wasm memory. Use alternate hooks instead
extension Data: NodeConverter {
    static var moduleReference: NodeReference?

    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Data {
        #if os(WASI)
        guard let module = try moduleReference?.value(env: env),
              case let fromWasi = try env.getNamedProperty(env.getNamedProperty(module, "_DataNodeConverter"), "fromWasi"),
              try env.typeof(fromWasi) == NodeAPI.napi_function
        else {
            // These should be implemented in Runtime.extensions.js
            throw JSException(message: "Internal error: Expected Runtime._DataNodeConverter.fromWasi to be a function")
        }
        let undefined = try env.getUndefined()
        // fromWasi should be js function of type (Arraybuffer) -> [ssize_t, void *]
        // the memory will be freed by the caller
        let result = try env.callFunction(undefined, fromWasi, [value])
        let length = try Int.fromNode(env.getElement(result, 0), env: env)
        let data = try UInt.fromNode(env.getElement(result, 1), env: env)
        return Data(bytesNoCopy: UnsafeMutableRawPointer(bitPattern: data)!, count: length, deallocator: .free)
        #else
        let data: UnsafeMutableRawPointer?
        let length: Int
        if try env.isArraybuffer(value) {
            (data, length) = try env.getArraybufferInfo(value)
        } else if try env.isBuffer(value) {
            (data, length) = try env.getBufferInfo(value)
        } else {
            throw JSException(message: "expected ArrayBuffer (or Buffer, if you must) but got: \(try nodeDescribe(value, env: env))")
        }
        if length == 0 {
            return Data()
        } else if let data = data {
            return Data(bytes: data, count: length)
        } else {
            throw JSException(message: "napi_get_typedarray_info unexpectedly returned NULL")
        }
        #endif
    }

    public static func toNode(_ value: Data, env: NAPI.Env) throws -> NAPI.Value {
        #if os(WASI)
        guard let module = try moduleReference?.value(env: env),
              case let toWasi = try env.getNamedProperty(env.getNamedProperty(module, "_DataNodeConverter"), "toWasi"),
              try env.typeof(toWasi) == NodeAPI.napi_function
        else {
            // These should be implemented in Runtime.extensions.js
            throw JSException(message: "Internal error: Expected Runtime._DataNodeConverter.toWasi to be a function")
        }
        let undefined = try env.getUndefined()
        return try value.withUnsafeBytes { buffer in
            let nodeLength = try Int.toNode(value.count, env: env)
            let nodePointer = try UInt.toNode(UInt(bitPattern: buffer.baseAddress), env: env)
            // toWasi should be js function of type (ssize_t, void *) -> Arraybuffer
            // memory is copied without ownership change
            return try env.callFunction(undefined, toWasi, [nodeLength, nodePointer])
        }
        #else
        let length = value.count
        let (data, arrayBuffer) = try env.createArraybuffer(length)
        guard length > 0 else {
            return arrayBuffer
        }
        guard let data = data else {
            throw JSException(message: "napi_create_arraybuffer unexpectedly returned NULL")
        }
        data.withMemoryRebound(to: UInt8.self, capacity: length) { ptr in
            value.copyBytes(to: ptr, count: length)
        }
        return arrayBuffer
        #endif
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        if moduleReference == nil {
            moduleReference = try NodeReference(env: env, value: module)
        }
    }
}

// MARK: - URL Type Conversion

extension URL: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> URL {
        let urlStringObject = try env.getNamedProperty(value, "href")
        let urlString = try env.getValueStringUtf8(urlStringObject) ?? "<null>"
        guard let url = URL(string: urlString) else { throw MalformedURLError(message: "Not a valid URL: \(urlString)") }
        return url
    }

    public static func toNode(_ value: URL, env: NAPI.Env) throws -> NAPI.Value {
        let urlString = value.absoluteString
        let urlStringObject = try env.createStringUtf8(urlString)
        let urlConstructor = try env.getNamedProperty(env.getGlobal(), "URL")
        return try env.newInstance(urlConstructor, [urlStringObject])
    }
}

// MARK: - Generics Type Conversions

extension ArrayConverter: NodeConverter where ElementConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let length = try env.getArrayLength(value)
        return try (0..<length).map { index in
            try ElementConverter.fromNode(env.getElement(value, index), env: env)
        }
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let array = try env.createArrayWithLength(value.count)
        for (index, value) in value.enumerated() {
            try env.setElement(array, UInt32(index), ElementConverter.toNode(value, env: env))
        }
        return array
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try ElementConverter.nodeSetup(env: env, module: module)
    }
}

extension DictionaryConverter: NodeConverter where KeyConverter: NodeConverter, ValueConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let iterator = try env.callFunction(value, env.getNamedProperty(value, "entries"), [])

        var result: SwiftType = [:]
        try nodeIterate(iterator, env: env) { entry in
            let key = try KeyConverter.fromNode(env.getElement(entry, 0), env: env)
            let value = try ValueConverter.fromNode(env.getElement(entry, 1), env: env)
            result[key] = value
        }
        return result
    }

    public static func toNode(_ dict: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let global = try env.getGlobal()
        let mapConstructor = try env.getNamedProperty(global, "Map")
        let map = try env.newInstance(mapConstructor, [])
        let mapSet = try env.getNamedProperty(map, "set")

        for (key, value) in dict {
            _ = try env.callFunction(map, mapSet, [KeyConverter.toNode(key, env: env), ValueConverter.toNode(value, env: env)])
        }

        return map
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try KeyConverter.nodeSetup(env: env, module: module)
        try ValueConverter.nodeSetup(env: env, module: module)
    }
}

extension SetConverter: NodeConverter where ElementConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let iterator = try env.callFunction(value, env.getNamedProperty(value, "values"), [])

        var result = SwiftType()
        try nodeIterate(iterator, env: env) { entry in
            result.insert(try ElementConverter.fromNode(entry, env: env))
        }
        return result
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let global = try env.getGlobal()
        let setConstructor: NAPI.Value = try env.getNamedProperty(global, "Set")

        let array = try env.createArrayWithLength(value.count)

        for (index, element) in value.enumerated() {
            try env.setElement(array, UInt32(index), ElementConverter.toNode(element, env: env))
        }

        return try env.newInstance(setConstructor, [array])
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try ElementConverter.nodeSetup(env: env, module: module)
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: NodeConverter where WrappedConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        try nodeIsUndefiend(value, env: env) ? nil : WrappedConverter.fromNode(value, env: env)
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        if let wrapped = value {
            return try WrappedConverter.toNode(wrapped, env: env)
        } else {
            return try env.getUndefined()
        }
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try WrappedConverter.nodeSetup(env: env, module: module)
    }
}

// MARK: - Range Type Conversion

extension RangeConverter: NodeConverter where BoundConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Range<BoundConverter.SwiftType> {
        let lowerBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "lowerBound"), env: env)
        let upperBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "upperBoundExclusive"), env: env)

        guard lowerBound <= upperBound else { throw InvalidRangeError(message: "\(lowerBound)..<\(upperBound)") }
        return lowerBound..<upperBound
    }

    public static func toNode(_ value: Range<BoundConverter.SwiftType>, env: NAPI.Env) throws -> NAPI.Value {
        let lowerBound = try BoundConverter.toNode(value.lowerBound, env: env)
        let upperBound = try BoundConverter.toNode(value.upperBound, env: env)

        let range = try env.createObject()
        try env.setNamedProperty(range, "lowerBound", lowerBound)
        try env.setNamedProperty(range, "upperBoundExclusive", upperBound)
        return range
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try BoundConverter.nodeSetup(env: env, module: module)
    }
}

extension ClosedRangeConverter: NodeConverter where BoundConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> ClosedRange<BoundConverter.SwiftType> {
        let lowerBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "lowerBound"), env: env)
        let upperBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "upperBoundInclusive"), env: env)

        guard lowerBound <= upperBound else { throw InvalidRangeError(message: "\(lowerBound)...\(upperBound)") }
        return lowerBound...upperBound
    }

    public static func toNode(_ value: ClosedRange<BoundConverter.SwiftType>, env: NAPI.Env) throws -> NAPI.Value {
        let lowerBound = try BoundConverter.toNode(value.lowerBound, env: env)
        let upperBound = try BoundConverter.toNode(value.upperBound, env: env)

        let range = try env.createObject()
        try env.setNamedProperty(range, "lowerBound", lowerBound)
        try env.setNamedProperty(range, "upperBoundInclusive", upperBound)
        return range
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try BoundConverter.nodeSetup(env: env, module: module)
    }
}
