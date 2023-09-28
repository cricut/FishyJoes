import Foundation

extension AttributedString.Runs.Run: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString.Runs.Run {
        try Box<AttributedString.Runs.Run>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString.Runs.Run, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributedString.Runs.Run) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs.Run>.peekIota(this, env: env).value)
    }
}

@_cdecl("Foundation_AttributedString_Runs_Run_setup")
public func FishyJoesRuntime_iota_AttributedString_Runs_Run_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard AttributedString.Runs.Run._constructorMethod == nil else { return }
    AttributedString.Runs.Run._constructorMethod = constructorMethod
}

@_cdecl("__iota_get_Foundation_AttributedString_Runs_Run_Range")
public func __iota_get_Foundation_AttributedString_Runs_Run_Range(
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

@_cdecl("__iota_get_Foundation_AttributedString_Runs_Run_Attributes")
public func __iota_get_Foundation_AttributedString_Runs_Run_Attributes(
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

@_cdecl("__iota_Foundation_AttributedString_Runs_Run_hash")
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
