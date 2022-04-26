@_exported import FishyJoesCommonRuntime
import Foundation

extension Box {
    public func retainedExternal(env: NAPI.Env) throws -> NAPI.Value {
        try box.retainedExternal(env: env)
    }

    public static func takeUnretained(_ value: NAPI.Value, env: NAPI.Env) throws -> Box<T> {
        try Box(inner: AnyBox.takeUnretained(value, env: env))
    }

    // Invoked as js constructor from TranslatedReference.swift
    public static func construct(env: CallbackEnv) throws -> NAPI.Value {
        let this = try env.this()
        let selfValue = try env.argument(at: 0)
        let boxed = try takeUnretained(selfValue, env: env.env)
        try env.env.wrapWithoutRef(this, boxed.retainedOpaque(), AnyBox.boxFinalize, nil)
        return this
    }
}

extension AnyBox {
    static let boxFinalize: NAPI.Finalize = { _, data, hint in
        if let hint = hint {
            let s = String(cString: hint.assumingMemoryBound(to: CChar.self))
            print("boxFinalize: \(s)")
        }
        AnyBox.releaseOpaque(data)
    }

    func retainedExternal(env: NAPI.Env) throws -> NAPI.Value {
        try env.createExternal(retainedOpaque(), Self.boxFinalize, nil)
    }

    static func takeUnretained(_ value: NAPI.Value, env: NAPI.Env) throws -> AnyBox {
        guard let pointer = try env.getValueExternal(value) else {
            throw JSException(message: "received nil from napi_get_value_external")
        }
        return takeUnretainedOpaque(pointer)
    }
}
