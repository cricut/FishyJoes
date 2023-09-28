import Foundation

extension AttributedString.Runs: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString.Runs {
        try Box<AttributedString.Runs>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString.Runs, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributedString.Runs) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs>.peekIota(this, env: env).value)
    }
}

@_cdecl("Foundation_AttributedString_Runs_setup")
public func FishyJoesRuntime_iota_AttributedString_Runs_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard AttributedString.Runs._constructorMethod == nil else { return }
    AttributedString.Runs._constructorMethod = constructorMethod
}

@_cdecl("__iota_get_Foundation_AttributedString_Runs_StartIndex")
public func __iota_get_Foundation_AttributedString_Runs_StartIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Runs.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Runs.Index.toIota(
            AttributedString.Runs.peekIota(_iotaThis, env: env).startIndex,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_Runs_EndIndex")
public func __iota_get_Foundation_AttributedString_Runs_EndIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Runs.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Runs.Index.toIota(
            AttributedString.Runs.peekIota(_iotaThis, env: env).endIndex,
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_indexBefore")
public func __iota_Foundation_AttributedString_Runs_indexBefore(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    i: AttributedString.Runs.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Runs.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Runs.Index.toIota(
            AttributedString.Runs.peekIota(_iotaThis, env: env).index(
                before: try AttributedString.Runs.Index.peekIota(i, env: env)
            ),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_indexAfter")
public func __iota_Foundation_AttributedString_Runs_indexAfter(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    i: AttributedString.Runs.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Runs.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Runs.Index.toIota(
            AttributedString.Runs.peekIota(_iotaThis, env: env).index(
                after: try AttributedString.Runs.Index.peekIota(i, env: env)
            ),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_elementAt")
public func __iota_Foundation_AttributedString_Runs_elementAt(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    index: AttributedString.Runs.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Runs.Run.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Runs.Run.toIota(
            AttributedString.Runs.peekIota(_iotaThis, env: env)[
                try AttributedString.Runs.Index.peekIota(index, env: env)
            ],
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_elementAtPosition")
public func __iota_Foundation_AttributedString_Runs_elementAtPosition(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    index: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Runs.Run.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Runs.Run.toIota(
            AttributedString.Runs.peekIota(_iotaThis, env: env)[
                try AttributedString.Index.peekIota(index, env: env)
            ],
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_equals")
public func AttributedString_Runs_iotaEquals(
    envRef: EnvRef,
    lhs: foreignObject,
    rhs: foreignObject,
    _exn: foreignOutExn
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Bool.toIota(
            AttributedString.Runs.peekIota(lhs, env: env) == AttributedString.Runs.peekIota(rhs, env: env),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_Runs_hash")
public func AttributedString_Runs_iotaHash(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let runHashes = try AttributedString.Runs.peekIota(_iotaThis, env: env)
            .lazy
            .map { AttributedString("HASH", attributes: $0.attributes).hashValue }
        let hashValue = runHashes
            .reduce(into: Hasher()) { $0.combine($1) }
            .finalize()
        return try Int32.toIota(
            Int32(truncatingIfNeeded: hashValue),
            env: env
        )
    }
}
