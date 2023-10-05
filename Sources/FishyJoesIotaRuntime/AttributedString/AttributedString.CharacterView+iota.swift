import Foundation

extension AttributedString.CharacterView: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString.CharacterView {
        try Box<AttributedString.CharacterView>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString.CharacterView, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributedString.CharacterView) throws -> R) throws -> R {
        try body(&Box<AttributedString.CharacterView>.peekIota(this, env: env).value)
    }
}

@_cdecl("Foundation_AttributedString_CharacterView_setup")
public func FishyJoesRuntime_iota_AttributedString_CharacterView_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard AttributedString.CharacterView._constructorMethod == nil else { return }
    AttributedString.CharacterView._constructorMethod = constructorMethod
}

@_cdecl("__iota_get_Foundation_AttributedString_CharacterView_startIndex")
public func __iota_get_Foundation_AttributedString_CharacterView_startIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedString.CharacterView.peekIota(_iotaThis, env: env).startIndex,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_CharacterView_endIndex")
public func __iota_get_Foundation_AttributedString_CharacterView_endIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedString.CharacterView.peekIota(_iotaThis, env: env).endIndex,
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_CharacterView_indexBefore")
public func __iota_Foundation_AttributedString_CharacterView_indexBefore(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    i: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Index.toIota(
            AttributedString.CharacterView.peekIota(_iotaThis, env: env).index(
                before: try AttributedString.Index.peekIota(i, env: env)
            ),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_CharacterView_indexAfter")
public func __iota_Foundation_AttributedString_CharacterView_indexAfter(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    i: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.Index.toIota(
            AttributedString.CharacterView.peekIota(_iotaThis, env: env).index(
                after: try AttributedString.Index.peekIota(i, env: env)
            ),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_CharacterView_elementAt")
public func __iota_Foundation_AttributedString_CharacterView_elementAt(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    index: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> Swift.String.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Swift.String.toIota(
            String(
                AttributedString.CharacterView.peekIota(_iotaThis, env: env)[
                    try AttributedString.Index.peekIota(index, env: env)
                ]
            ),
            env: env
        )
    }
}
