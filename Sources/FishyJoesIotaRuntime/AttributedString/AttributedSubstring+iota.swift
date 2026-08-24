import Foundation

extension AttributedSubstring: IotaReferenceMutator {
    public typealias Constructor = IotaSwiftReferenceConstructor
    fileprivate static var constructor = Env.CallbackMap<Constructor>()

    public static func peekIota(_ value: HostObject, env: Env) throws -> AttributedSubstring {
        try Box<AttributedSubstring>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedSubstring, env: Env) throws -> HostObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in constructor[env](ptr, exn) }
    }
}

@_cdecl("Foundation_AttributedSubstring_setup")
public func FishyJoesRuntime_iota_AttributedSubstring_setup(
    envRef: EnvRef,
    constructor: @escaping AttributedSubstring.Constructor,
    _ exn: OutHostException
) {
    let env = Env(envRef)
    if AttributedSubstring.constructor.isInitialized(env) { return }
    AttributedSubstring.constructor[env] = constructor
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_base")
public func __iota_get_Foundation_AttributedSubstring_base(
    envRef: EnvRef,
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _iotaThis: HostObject,
    range: RangeConverter<AttributedString.Index>.CType,
    _exn: OutHostException
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
    lhs: HostObject,
    rhs: HostObject,
    _exn: OutHostException
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let lhsSubstring = try AttributedSubstring.peekIota(lhs, env: env)
        let rhsSubstring = try AttributedSubstring.peekIota(rhs, env: env)
        // TODO: A bug in AttributedSubstring causes a crash if empty substrings are compared for equality; remove when this is fixed
        // let equal = lhsSubstring == rhsSubstring
        let equal = (lhsSubstring.characters.isEmpty && rhsSubstring.characters.isEmpty) || lhsSubstring == rhsSubstring
        return try Bool.toIota(
            equal,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedSubstring_hash")
public func AttributedSubstring_iotaHash(
    envRef: EnvRef,
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _exn: OutHostException
) -> AttributedSubstring.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedSubstring.toIota(
            AttributedSubstring(),
            env: env
        )
    }
}
