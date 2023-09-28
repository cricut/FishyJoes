import Foundation

extension AttributedString.UnicodeScalarView: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString.UnicodeScalarView {
        try Box<AttributedString.UnicodeScalarView>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString.UnicodeScalarView, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributedString.UnicodeScalarView) throws -> R) throws -> R {
        try body(&Box<AttributedString.UnicodeScalarView>.peekIota(this, env: env).value)
    }
}

@_cdecl("Foundation_AttributedString_UnicodeScalarView_setup")
public func FishyJoesRuntime_iota_AttributedString_UnicodeScalarView_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard AttributedString.UnicodeScalarView._constructorMethod == nil else { return }
    AttributedString.UnicodeScalarView._constructorMethod = constructorMethod
}

@_cdecl("__iota_get_Foundation_AttributedString_UnicodeScalarView_StartIndex")
public func __iota_get_Foundation_AttributedString_UnicodeScalarView_StartIndex(
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

@_cdecl("__iota_get_Foundation_AttributedString_UnicodeScalarView_EndIndex")
public func __iota_get_Foundation_AttributedString_UnicodeScalarView_EndIndex(
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
