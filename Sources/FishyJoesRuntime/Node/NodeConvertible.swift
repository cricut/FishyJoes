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
        print("default (noop) setup for \(Self.self)")
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

extension OpaquePointer: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        var result: UnsafeMutableRawPointer?
        try check(napi_get_value_external(env, value, &result))
        self.init(result)!
    }

    public func toNode(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        // TODO: memory management
        try check(napi_create_external(env, UnsafeMutableRawPointer(self), nil, nil, &result))
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

extension Optional: NodeConvertible where Wrapped: NodeConvertible {
    public init(fromNode value: napi_value?, env: napi_env) throws {
        var type = napi_undefined
        try check(napi_typeof(env, value, &type))
        if type == napi_null {
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
            try check(napi_get_null(env, &result))
            return result
        }
    }
}
