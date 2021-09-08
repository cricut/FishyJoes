import Foundation
@_exported import FishyJoesCommonRuntime
@_exported import NodeAPI

extension Box {
    public func retainedExternal(env: napi_env) throws -> napi_value? {
        try box.retainedExternal(env: env)
    }

    public static func takeUnretained(_ value: napi_value?, env: napi_env) throws -> Box<T> {
        try Box(inner: AnyBox.takeUnretained(value, env: env))
    }
}

extension AnyBox {
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

    static func takeUnretained(_ value: napi_value?, env: napi_env) throws -> AnyBox {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_get_value_external(env, value, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "received nil from napi_get_value_external")
        }
        return takeUnretainedOpaque(nonNilPointer)
    }
}
