import Foundation

extension AttributedString.UnicodeScalarView: IotaReferenceMutator {
    public typealias Constructor = @convention(c) (_ ptr: UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject
    fileprivate static var constructor = Env.CallbackMap<Constructor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString.UnicodeScalarView {
        try Box<AttributedString.UnicodeScalarView>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString.UnicodeScalarView, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in constructor[env](ptr, exn) }
    }
}

@_cdecl("Foundation_AttributedString_UnicodeScalarView_setup")
public func FishyJoesRuntime_iota_AttributedString_UnicodeScalarView_setup(
    envRef: EnvRef,
    constructor: @escaping AttributedString.UnicodeScalarView.Constructor,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if AttributedString.UnicodeScalarView.constructor.isInitialized(env) { return }
    AttributedString.UnicodeScalarView.constructor[env] = constructor
}

@_cdecl("__iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex")
public func __iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedString.UnicodeScalarView.peekIota(_iotaThis, env: env).startIndex,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex")
public func __iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedString.UnicodeScalarView.peekIota(_iotaThis, env: env).endIndex,
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_UnicodeScalarView_indexBefore")
public func __iota_Foundation_AttributedString_UnicodeScalarView_indexBefore(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    i: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Index.toIota(
            AttributedString.UnicodeScalarView.peekIota(_iotaThis, env: env).index(
                before: try AttributedString.Index.peekIota(i, env: env)
            ),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_UnicodeScalarView_indexAfter")
public func __iota_Foundation_AttributedString_UnicodeScalarView_indexAfter(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    i: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Index.toIota(
            AttributedString.UnicodeScalarView.peekIota(_iotaThis, env: env).index(
                after: try AttributedString.Index.peekIota(i, env: env)
            ),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_UnicodeScalarView_elementAt")
public func __iota_Foundation_AttributedString_UnicodeScalarView_elementAt(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    index: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> UInt32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try UInt32.toIota(
            AttributedString.UnicodeScalarView.peekIota(_iotaThis, env: env)[
                try AttributedString.Index.peekIota(index, env: env)
            ].value,
            env: env
        )
    }
}
