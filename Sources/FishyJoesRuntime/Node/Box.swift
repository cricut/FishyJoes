import Foundation
@_exported import NodeAPI

public struct Box<T> {
    private let box: AnyBox

    public var value: T {
        get {
            // This could fail, since we're providing a pointer interface
            box.value as! T
        }
        set {
            box.value = newValue
        }
    }

    public init(_ value: T) {
        box = AnyBox(value)
    }

    private init(_ box: AnyBox) throws {
        guard box.value is T else {
            throw JSException(message: "expected \(T.self), got \(type(of: box.value)): \(box.value)")
        }
        self.box = box
    }

    public func retainedExternal(env: napi_env) throws -> napi_value? {
        try box.retainedExternal(env: env)
    }

    public func retainedOpaque() -> UnsafeMutableRawPointer {
        box.retainedOpaque()
    }

    public static func releaseOpaque(_ pointer: UnsafeMutableRawPointer?) {
        AnyBox.releaseOpaque(pointer)
    }

    public static func takeUnretainedOpaque(_ pointer: UnsafeMutableRawPointer) throws -> Box<T> {
        try Box(AnyBox.takeUnretainedOpaque(pointer))
    }

    public static func takeUnretained(_ value: napi_value?, env: napi_env) throws -> Box<T> {
        try Box(AnyBox.takeUnretained(value, env: env))
    }
}

private class AnyBox {
    var value: Any
    init(_ value: Any) {
        self.value = value
    }

    func retainedExternal(env: napi_env) throws -> napi_value? {
        var result: napi_value?

        let boxFinalize: napi_finalize = { env, data, hint in
            if let hint = hint {
                let s = String(cString: hint.assumingMemoryBound(to: CChar.self))
                print("boxFinalize: \(s)")
            }
            AnyBox.releaseOpaque(data)
        }

        try check(napi_create_external(env, retainedOpaque(), boxFinalize, nil, &result))
        return result
    }

    func retainedOpaque() -> UnsafeMutableRawPointer {
        let pointer = Unmanaged<AnyBox>.passRetained(self).toOpaque()
        // print("retained: \(pointer)")
        return pointer
    }

    static func releaseOpaque(_ pointer: UnsafeMutableRawPointer?) {
        guard let pointer = pointer else { return }
        // print("releasing: \(pointer)")
        Unmanaged<AnyBox>.fromOpaque(pointer).release()
    }

    static func takeUnretainedOpaque(_ pointer: UnsafeMutableRawPointer) -> AnyBox {
        Unmanaged<AnyBox>.fromOpaque(pointer).takeUnretainedValue()
    }

    static func takeUnretained(_ value: napi_value?, env: napi_env) throws -> AnyBox {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_get_value_external(env, value, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "received nil from napi_get_value_external")
        }
        return takeUnretainedOpaque(nonNilPointer)
    }
}
