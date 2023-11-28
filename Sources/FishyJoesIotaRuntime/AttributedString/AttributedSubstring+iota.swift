import Foundation

extension AttributedSubstring: IotaMutator {
    public typealias Constructor = @convention(c) (_ ptr: UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject
    fileprivate static var constructor = Env.CallbackMap<Constructor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedSubstring {
        try Box<AttributedSubstring>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedSubstring, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in constructor[env](ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributedSubstring) throws -> R) throws -> R {
        try body(&Box<AttributedSubstring>.peekIota(this, env: env).value)
    }
}

@_cdecl("Foundation_AttributedSubstring_setup")
public func FishyJoesRuntime_iota_AttributedSubstring_setup(
    envRef: EnvRef,
    constructor: @escaping AttributedSubstring.Constructor,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if AttributedSubstring.constructor.isInitialized(env) { return }
    AttributedSubstring.constructor[env] = constructor
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_base")
public func __iota_get_Foundation_AttributedSubstring_base(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.toIota(
            AttributedSubstring.peekIota(_iotaThis, env: env).base,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_string")
public func __iota_get_Foundation_AttributedSubstring_string(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Swift.String.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let s = try AttributedSubstring.peekIota(_iotaThis, env: env)
        return try Swift.String.toIota(
            String(s.characters),
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_runs")
public func __iota_get_Foundation_AttributedSubstring_runs(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Runs.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Runs.toIota(
            AttributedSubstring.peekIota(_iotaThis, env: env).runs,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_characters")
public func __iota_get_Foundation_AttributedSubstring_characters(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.CharacterView.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.CharacterView.toIota(
            AttributedSubstring.peekIota(_iotaThis, env: env).characters,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_unicodeScalars")
public func __iota_get_Foundation_AttributedSubstring_unicodeScalars(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.UnicodeScalarView.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.UnicodeScalarView.toIota(
            AttributedSubstring.peekIota(_iotaThis, env: env).unicodeScalars,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_startIndex")
public func __iota_get_Foundation_AttributedSubstring_startIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedSubstring.peekIota(_iotaThis, env: env).startIndex,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_endIndex")
public func __iota_get_Foundation_AttributedSubstring_endIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedSubstring.peekIota(_iotaThis, env: env).endIndex,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_substring")
public func __iota_get_Foundation_AttributedSubstring_substring(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedSubstring.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let s = try AttributedSubstring.peekIota(_iotaThis, env: env)
        return try AttributedSubstring.toIota(
            s[s.startIndex..<s.endIndex],
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedSubstring_substringForRange")
public func __iota_Foundation_AttributedSubstring_substringForRange(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    _exn: foreignOutExn
) -> AttributedSubstring.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedSubstring.toIota(
            AttributedSubstring.peekIota(_iotaThis, env: env)[
                try RangeConverter<AttributedString.Index>.peekIota(range, env: env)
            ],
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedSubstring_equals")
public func AttributedSubstring_iotaEquals(
    envRef: EnvRef,
    lhs: foreignObject,
    rhs: foreignObject,
    _exn: foreignOutExn
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let lhsString = try AttributedSubstring.peekIota(lhs, env: env)
        let rhsString = try AttributedSubstring.peekIota(rhs, env: env)
        // TODO: A bug in AttributedSubstring causes a crash if empty substrings are compared for equality; remove when this is fixed
        // let equal = lhsString == rhsString
        let equal = lhsString.characters.isEmpty && rhsString.characters.isEmpty ? true : lhsString == rhsString
        return try Bool.toIota(
            equal,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_hash")
public func AttributedSubstring_iotaHash(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: AttributedSubstring.peekIota(_iotaThis, env: env).hashValue),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedSubstring_createEmpty")
public func __iota_Foundation_AttributedSubstring_createEmpty(
    envRef: EnvRef,
    _exn: foreignOutExn
) -> AttributedSubstring.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedSubstring.toIota(
            AttributedSubstring(),
            env: env
        )
    }
}
