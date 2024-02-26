import Foundation

extension AttributedString.Runs.Run: IotaReferenceMutator {
    public typealias Constructor = @convention(c) (_ ptr: UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject
    fileprivate static var constructor = Env.CallbackMap<Constructor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString.Runs.Run {
        try Box<AttributedString.Runs.Run>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString.Runs.Run, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in constructor[env](ptr, exn) }
    }
}

@_cdecl("Foundation_AttributedString_Runs_Run_setup")
public func FishyJoesRuntime_iota_AttributedString_Runs_Run_setup(
    envRef: EnvRef,
    constructor: @escaping AttributedString.Runs.Run.Constructor,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if AttributedString.Runs.Run.constructor.isInitialized(env) { return }
    AttributedString.Runs.Run.constructor[env] = constructor
}

@_cdecl("__iota_get_Foundation_AttributedString_Runs_Run_range")
public func __iota_get_Foundation_AttributedString_Runs_Run_range(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> RangeConverter<AttributedString.Index>.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try RangeConverter<AttributedString.Index>.toIota(
            AttributedString.Runs.Run.peekIota(_iotaThis, env: env).range,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_Runs_Run_attributes")
public func __iota_get_Foundation_AttributedString_Runs_Run_attributes(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributeContainer.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributeContainer.toIota(
            AttributedString.Runs.Run.peekIota(_iotaThis, env: env).attributes,
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_Run_equals")
public func AttributedString_Runs_Run_iotaEquals(
    envRef: EnvRef,
    lhs: foreignObject,
    rhs: foreignObject,
    _exn: foreignOutExn
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Bool.toIota(
            AttributedString.Runs.Run.peekIota(lhs, env: env) == AttributedString.Runs.Run.peekIota(rhs, env: env),
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_Runs_Run_hash")
public func AttributedString_Runs_Run_iotaHash(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: AttributedString("HASH", attributes: AttributedString.Runs.Run.peekIota(_iotaThis, env: env).attributes).hashValue),
            env: env
        )
    }
}
