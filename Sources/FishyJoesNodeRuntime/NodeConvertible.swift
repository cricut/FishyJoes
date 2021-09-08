import Foundation
@_exported import NodeAPI

public protocol NodeConvertible {
    static func nodeSetup(env: napi_env, module: napi_value) throws
    init(fromNode value: napi_value?, env: napi_env) throws
    func toNode(env: napi_env) throws -> napi_value?
}

public protocol NodeMutable: NodeConvertible {
    func mutateNode(this: napi_value?, env: napi_env) throws
}

extension NodeConvertible {
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        // print("default (noop) setup for \(Self.self)")
    }
}

extension Bool: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        self = false
        // TODO: should this do JS coercions?
        try check(napi_get_value_bool(env, value, &self))
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_get_boolean(env, self, &result))
        return result
    }
}

extension Double: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        self = 0.0
        // TODO: should this do JS coercions?
        try check(napi_get_value_double(env, value, &self))
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_double(env, self, &result))
        return result
    }
}

extension Int: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        #if arch(wasm32)
        var temp = Int32(0)
        // TODO: should this do JS coercions?
        try check(napi_get_value_int32(env, value, &temp))
        #else
        var temp = Int64(0)
        // TODO: should this do JS coercions?
        try check(napi_get_value_int64(env, value, &temp))
        #endif
        self = Int(temp)
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        #if arch(wasm32)
        try check(napi_create_int32(env, Int32(self), &result))
        #else
        try check(napi_create_int64(env, Int64(self), &result))
        #endif
        return result
    }
}

extension String: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
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
        self = string
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_string_utf8(env, self, utf8CString.count - 1, &result))
        return result
    }
}

extension Set: NodeConvertible where Element: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        throw JSException(message: "TODO: implement Swift.Set.init(fromNode:env:)")
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var global: napi_value?
        try check(napi_get_global(env, &global))
        var setConstructor: napi_value?
        try check(napi_get_named_property(env, global, "Set", &setConstructor))

        var array: napi_value?
        try check(napi_create_array_with_length(env, self.count, &array))

        for (index, value) in self.enumerated() {
            try check(napi_set_element(env, array, UInt32(index), value.toNode(env: env)))
        }

        var result: napi_value?
        try check(napi_new_instance(env, setConstructor, 1, &array, &result))
        return result
    }
}

extension Dictionary: NodeConvertible where Key: NodeConvertible, Value: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        throw JSException(message: "TODO: implement Swift.Dictionary.init(fromNode:env:)")
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var global: napi_value?
        try check(napi_get_global(env, &global))
        var mapConstructor: napi_value?
        try check(napi_get_named_property(env, global, "Map", &mapConstructor))

        var map: napi_value?
        try check(napi_new_instance(env, mapConstructor, 0, nil, &map))

        var mapSet: napi_value?
        try check(napi_get_named_property(env, map, "set", &mapSet))

        var unusedOut: napi_value?
        for (key, value) in self {
            try check(napi_call_function(env, map, mapSet, 2, [key.toNode(env: env), value.toNode(env: env)], &unusedOut))
        }

        return map
    }
}

extension Array: NodeConvertible where Element: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        var length: UInt32 = 0
        try check(napi_get_array_length(env, value, &length))
        self = try (0..<length).map { index in
            var element: napi_value?
            try check(napi_get_element(env, value, index, &element))
            return try Element(fromNode: element, env: env)
        }
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, self.count, &array))
        for (index, value) in self.enumerated() {
            try check(napi_set_element(env, array, UInt32(index), value.toNode(env: env)))
        }
        return array
    }
}

extension Optional: NodeConvertible where Wrapped: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        var type = napi_undefined
        try check(napi_typeof(env, value, &type))
        if type == napi_undefined {
            self = nil
        } else {
            self = try Wrapped(fromNode: value, env: env)
        }
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        if let wrapped = self {
            return try wrapped.toNode(env: env)
        } else {
            var result: napi_value?
            try check(napi_get_undefined(env, &result))
            return result
        }
    }
}
