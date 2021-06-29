import Foundation
@_exported import NodeAPI

public class Box<T> {
    public var value: T
    public init(_ value: T) {
        self.value = value
    }

    public func retainedExternal(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_create_external(env, retainedOpaque(), boxFinalize, nil, &result))
        return result
    }

    public func retainedOpaque() -> UnsafeMutableRawPointer {
        Unmanaged<Box<T>>.passRetained(self).toOpaque()
    }

    public static func releaseOpaque(_ pointer: UnsafeMutableRawPointer?) {
        guard let pointer = pointer else { return }
        Unmanaged<Box<T>>.fromOpaque(pointer).release()
    }

    public static func takeRetained(_ value: napi_value?, env: napi_env) throws -> Box<T> {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_get_value_external(env, value, &pointer))
        guard let pointer = pointer else {
            throw JSException(message: "expected \(T.self), received nil")
        }
        return Unmanaged<Box<T>>.fromOpaque(pointer).takeRetainedValue()
    }

    public static func takeUnretainedOpaque(_ pointer: UnsafeMutableRawPointer) -> Box<T> {
        Unmanaged<Box<T>>.fromOpaque(pointer).takeUnretainedValue()
    }

    public static func takeUnretained(_ value: napi_value?, env: napi_env) throws -> Box<T> {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_get_value_external(env, value, &pointer))
        guard let pointer = pointer else {
            throw JSException(message: "expected \(T.self), received nil")
        }
        return takeUnretainedOpaque(pointer)
    }
}

fileprivate let boxFinalize: napi_finalize = { env, data, hint in
    // TODO: don't leak memory
}
