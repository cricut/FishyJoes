import Foundation
@_exported import NodeAPI

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

extension VoidConverter: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Void {}
    public static func toNode(_ value: Void, env: napi_env) throws -> napi_value? {
        return nil
    }
}
