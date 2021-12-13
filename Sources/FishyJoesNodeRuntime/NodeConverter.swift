import Foundation
@_exported import NodeAPI

// MARK: - NodeJS Type Conversion Protocols

public protocol NodeConverter: Converter {
    static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType
    static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value?
    static func nodeSetup(env: napi_env, module: napi_value) throws
}

public protocol NodeMutator: NodeConverter {
    static func mutateNode(_ value: SwiftType, this: napi_value?, env: napi_env) throws
}

extension NodeConverter {
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

// MARK: - Primitive Type Conversions

extension VoidConverter: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Void {}
    public static func toNode(_ value: Void, env: napi_env) throws -> napi_value? {
        return nil
    }
}

extension Bool: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Bool {
        var result = false
        // TODO: should this do JS coercions?
        try check(napi_get_value_bool(env, value, &result))
        return result
    }

    public static func toNode(_ value: Bool, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_get_boolean(env, value, &result))
        return result
    }
}

extension UInt8: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = UInt32(0)
        try check(napi_get_value_uint32(env, value, &result))
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_uint32(env, UInt32(value), &result))
        return result
    }
}

extension UInt16: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = UInt32(0)
        try check(napi_get_value_uint32(env, value, &result))
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_uint32(env, UInt32(value), &result))
        return result
    }
}

extension UInt32: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = UInt32(0)
        try check(napi_get_value_uint32(env, value, &result))
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_uint32(env, value, &result))
        return result
    }
}

extension UInt64: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = UInt64(0)
        var lossless = true
        try check(napi_get_value_bigint_uint64(env, value, &result, &lossless))
        if !lossless { throw JSException(message: "requested conversion of invalid bigint to uint64") }
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_bigint_uint64(env, value, &result))
        return result
    }
}

extension Int8: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = Int32(0)
        try check(napi_get_value_int32(env, value, &result))
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_int32(env, Int32(value), &result))
        return result
    }
}

extension Int16: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = Int32(0)
        try check(napi_get_value_int32(env, value, &result))
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_int32(env, Int32(value), &result))
        return result
    }
}

extension Int32: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = Int32(0)
        try check(napi_get_value_int32(env, value, &result))
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_int32(env, Int32(value), &result))
        return result
    }
}

extension Int64: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var result = Int64(0)
        var lossless = true
        try check(napi_get_value_bigint_int64(env, value, &result, &lossless))
        if !lossless { throw JSException(message: "requested conversion of invalid bigint to int64") }
        return .init(result)
    }

    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_bigint_int64(env, value, &result))
        return result
    }
}

extension Int: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Int {
        #if arch(wasm32)
        var result = Int32(0)
        // TODO: should this do JS coercions?
        try check(napi_get_value_int32(env, value, &result))
        #else
        var result = Int64(0)
        // TODO: should this do JS coercions?
        try check(napi_get_value_int64(env, value, &result))
        #endif
        return Int(result)
    }

    public static func toNode(_ value: Int, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        #if arch(wasm32)
        try check(napi_create_int32(env, Int32(value), &result))
        #else
        try check(napi_create_int64(env, Int64(value), &result))
        #endif
        return result
    }
}

extension Float: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Float {
        var result = 0.0
        // TODO: should this do JS coercions?
        try check(napi_get_value_double(env, value, &result))
        return Float(result)
    }

    public static func toNode(_ value: Float, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_double(env, Double(value), &result))
        return result
    }
}

extension Double: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Double {
        var result = 0.0
        // TODO: should this do JS coercions?
        try check(napi_get_value_double(env, value, &result))
        return result
    }

    public static func toNode(_ value: Double, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_double(env, value, &result))
        return result
    }
}

// MARK: - Less-Primitive Type Conversions

extension String: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> String {
        var length = 0
        try check(napi_get_value_string_utf8(env, value, nil, 0, &length))
        length += 1
        var data = Data(count: length)
        _ = try data.withUnsafeMutableBytes { bytes -> Int in
            try check(napi_get_value_string_utf8(env, value, bytes.bindMemory(to: CChar.self).baseAddress, length, &length))
            return 42
        }
        data.removeLast()
        guard let string = String(data: data, encoding: .utf8) else {
            throw JSException(message: "invalid utf8 string")
        }
        return string
    }

    public static func toNode(_ value: String, env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_string_utf8(env, value, value.utf8CString.count - 1, &result))
        return result
    }
}

extension Data: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Data {
        var global: napi_value?
        try check(napi_get_global(env, &global))
        
        // Get the number of bytes in the ArrayBuffer
        var byteLength: napi_value?
        try check(napi_get_named_property(env, value, "byteLength", &byteLength))
        
        // Get a byte-oriented view of the ArrayBuffer with UInt8Array
        var uInt8ArrayConstructor: napi_value?
        try check(napi_get_named_property(env, global, "Uint8Array", &uInt8ArrayConstructor))
        var uInt8View: napi_value?
        try check(napi_new_instance(env, uInt8ArrayConstructor, 1, [value], &uInt8View))
        
        // Create a Data to store the memory from the ArrayBuffer
        let count = try Int.fromNode(byteLength, env: env)
        var data = Data(count: count)
        
        // Copy the bytes from the UInt8Array to the Data
        for index in 0..<count {
            var byte: napi_value?
            try check(napi_get_element(env, uInt8View, UInt32(index), &byte))
            data[index] = try UInt8.fromNode(byte, env: env)
        }
        
        return data
    }

    public static func toNode(_ value: Data, env: napi_env) throws -> napi_value? {
        var global: napi_value?
        try check(napi_get_global(env, &global))
        
        // Create an ArrayBuffer of the same size as the Data
        var arrayBufferConstructor: napi_value?
        try check(napi_get_named_property(env, global, "ArrayBuffer", &arrayBufferConstructor))
        var byteCount = try Int.toNode(value.count, env: env)
        var arrayBuffer: napi_value?
        try check(napi_new_instance(env, arrayBufferConstructor, 1, &byteCount, &arrayBuffer))
        
        // Get a byte-oriented view of the ArrayBuffer with UInt8Array
        var uInt8ArrayConstructor: napi_value?
        try check(napi_get_named_property(env, global, "Uint8Array", &uInt8ArrayConstructor))
        var uInt8View: napi_value?
        try check(napi_new_instance(env, uInt8ArrayConstructor, 1, &arrayBuffer, &uInt8View))
        
        // Copy the bytes from the Data to the UInt8Array
        for (index, byte) in value.enumerated() {
            try check(napi_set_element(env, uInt8View, UInt32(index), UInt8.toNode(byte, env: env)))
        }
        
        return arrayBuffer
    }
}

// MARK: - Generics Type Conversions

extension ArrayConverter: NodeConverter where ElementConverter: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var length: UInt32 = 0
        try check(napi_get_array_length(env, value, &length))
        return try (0..<length).map { index in
            var element: napi_value?
            try check(napi_get_element(env, value, index, &element))
            return try ElementConverter.fromNode(element, env: env)
        }
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, value.count, &array))
        for (index, value) in value.enumerated() {
            try check(napi_set_element(env, array, UInt32(index), ElementConverter.toNode(value, env: env)))
        }
        return array
    }
}

extension DictionaryConverter: NodeConverter where KeyConverter: NodeConverter, ValueConverter: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        throw JSException(message: "TODO: implement Swift.Dictionary.static func fromNode(_:env:)")
    }

    public static func toNode(_ dict: SwiftType, env: napi_env) throws -> napi_value? {
        var global: napi_value?
        try check(napi_get_global(env, &global))
        var mapConstructor: napi_value?
        try check(napi_get_named_property(env, global, "Map", &mapConstructor))

        var map: napi_value?
        try check(napi_new_instance(env, mapConstructor, 0, nil, &map))

        var mapSet: napi_value?
        try check(napi_get_named_property(env, map, "set", &mapSet))

        var unusedOut: napi_value?
        for (key, value) in dict {
            try check(napi_call_function(env, map, mapSet, 2, [KeyConverter.toNode(key, env: env), ValueConverter.toNode(value, env: env)], &unusedOut))
        }

        return map
    }
}

extension SetConverter: NodeConverter where ElementConverter: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        throw JSException(message: "TODO: implement Swift.Set.static func fromNode(_:env:)")
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var global: napi_value?
        try check(napi_get_global(env, &global))
        var setConstructor: napi_value?
        try check(napi_get_named_property(env, global, "Set", &setConstructor))

        var array: napi_value?
        try check(napi_create_array_with_length(env, value.count, &array))

        for (index, element) in value.enumerated() {
            try check(napi_set_element(env, array, UInt32(index), ElementConverter.toNode(element, env: env)))
        }

        var result: napi_value?
        try check(napi_new_instance(env, setConstructor, 1, &array, &result))
        return result
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: NodeConverter where WrappedConverter: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        try nodeIsUndefiend(value, env: env) ? nil : WrappedConverter.fromNode(value, env: env)
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        if let wrapped = value {
            return try WrappedConverter.toNode(wrapped, env: env)
        } else {
            var result: napi_value?
            try check(napi_get_undefined(env, &result))
            return result
        }
    }
}

// MARK: - Tuple Type Conversions

extension Tuple2Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 2, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

extension Tuple3Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        var v2: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        try check(napi_get_element(env, value, 2, &v2))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env),
            try T2.fromNode(v2, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 3, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        try check(napi_set_element(env, array, 2, T2.toNode(value.2, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

extension Tuple4Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter, T3: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        var v2: napi_value?
        var v3: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        try check(napi_get_element(env, value, 2, &v2))
        try check(napi_get_element(env, value, 3, &v3))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env),
            try T2.fromNode(v2, env: env),
            try T3.fromNode(v3, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 4, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        try check(napi_set_element(env, array, 2, T2.toNode(value.2, env: env)))
        try check(napi_set_element(env, array, 3, T3.toNode(value.3, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}
