import Foundation

extension AttributedString.Runs.Index: IotaMutator {
    public typealias Constructor = @convention(c) (_ ptr: UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject
    fileprivate static var constructor = Env.CallbackMap<Constructor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString.Runs.Index {
        try Box<AttributedString.Runs.Index>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString.Runs.Index, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in constructor[env](ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributedString.Runs.Index) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs.Index>.peekIota(this, env: env).value)
    }
}

@_cdecl("Foundation_AttributedString_Runs_Index_setup")
public func FishyJoesRuntime_iota_AttributedString_Runs_Index_setup(
    envRef: EnvRef,
    constructor: @escaping AttributedString.Runs.Index.Constructor,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if AttributedString.Runs.Index.constructor.isInitialized(env) { return }
    AttributedString.Runs.Index.constructor[env] = constructor
}

@_cdecl("__iota_Foundation_AttributedString_Runs_Index_equals")
public func AttributedString_Runs_Index_iotaEquals(
    envRef: EnvRef,
    lhs: foreignObject,
    rhs: foreignObject,
    _exn: foreignOutExn
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Bool.toIota(
            AttributedString.Runs.Index.peekIota(lhs, env: env) == AttributedString.Runs.Index.peekIota(rhs, env: env),
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_Runs_Index_hash")
public func AttributedString_Runs_Index_iotaHash(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        var index = try AttributedString.Runs.Index.peekIota(_iotaThis, env: env)
        // TODO: Switch to using hashValue when available, as Comparable should be, but is not guaranteed to be, compatible with this hash value
        // let hashValue = index.hashValue
        let hashValue = withUnsafeBytes(of: &index) { (bytes: UnsafeRawBufferPointer) -> Int in
            var hasher = Hasher()
            hasher.combine(bytes: bytes)
            return hasher.finalize()
        }
        return try Int32.toIota(
            Int32(truncatingIfNeeded: hashValue),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_Index_compare")
public func AttributedString_Runs_Index_iotaCompare(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    other: foreignObject,
    _exn: foreignOutExn
) -> Int.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let thisComparable = try AttributedString.Runs.Index.peekIota(_iotaThis, env: env)
        let otherComparable = try AttributedString.Runs.Index.peekIota(other, env: env)
        return try Int.toIota(
            thisComparable < otherComparable ? -1 : thisComparable > otherComparable ? 1 : 0,
            env: env
        )
    }
}
