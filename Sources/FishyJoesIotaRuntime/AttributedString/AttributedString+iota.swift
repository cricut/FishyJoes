import Foundation

extension AttributedString: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributedString {
        try Box<AttributedString>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributedString, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributedString) throws -> R) throws -> R {
        try body(&Box<AttributedString>.peekIota(this, env: env).value)
    }
}

@_cdecl("Foundation_AttributedString_setup")
public func FishyJoesRuntime_iota_AttributedString_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard AttributedString._constructorMethod == nil else { return }
    AttributedString._constructorMethod = constructorMethod
}

@_cdecl("__iota_get_Foundation_AttributedString_string")
public func __iota_get_Foundation_AttributedString_string(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Swift.String.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let s = try AttributedString.peekIota(_iotaThis, env: env)
        return try String.toIota(
            String(s.characters),
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_runs")
public func __iota_get_Foundation_AttributedString_runs(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Runs.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Runs.toIota(
            AttributedString.peekIota(_iotaThis, env: env).runs,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_characters")
public func __iota_get_Foundation_AttributedString_characters(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.CharacterView.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.CharacterView.toIota(
            AttributedString.peekIota(_iotaThis, env: env).characters,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_unicodeScalars")
public func __iota_get_Foundation_AttributedString_unicodeScalars(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.UnicodeScalarView.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.UnicodeScalarView.toIota(
            AttributedString.peekIota(_iotaThis, env: env).unicodeScalars,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_substring")
public func __iota_get_Foundation_AttributedString_substring(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedSubstring.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        let s = try AttributedString.peekIota(_iotaThis, env: env)
        return try AttributedSubstring.toIota(
            s[s.startIndex..<s.endIndex],
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_substringForRange")
public func __iota_Foundation_AttributedString_substringForRange(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    _exn: foreignOutExn
) -> AttributedSubstring.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedSubstring.toIota(
            AttributedString.peekIota(_iotaThis, env: env)[
                try RangeConverter<AttributedString.Index>.peekIota(range, env: env)
            ],
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_startIndex")
public func __iota_get_Foundation_AttributedString_startIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedString.peekIota(_iotaThis, env: env).startIndex,
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_endIndex")
public func __iota_get_Foundation_AttributedString_endIndex(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributedString.Index.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributedString.Index.toIota(
            AttributedString.peekIota(_iotaThis, env: env).endIndex,
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_append")
public func __iota_Foundation_AttributedString_append(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    attributedString: AttributedString.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.append(
                    try AttributedString.peekIota(attributedString, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_appendSubstring")
public func __iota_Foundation_AttributedString_appendSubstring(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    substring: AttributedSubstring.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.append(
                    try AttributedSubstring.peekIota(substring, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_insert")
public func __iota_Foundation_AttributedString_insert(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    attributedString: AttributedString.CType,
    index: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.insert(
                    try AttributedString.peekIota(attributedString, env: env),
                    at: try AttributedString.Index.peekIota(index, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_insertSubstring")
public func __iota_Foundation_AttributedString_insertSubstring(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    substring: AttributedSubstring.CType,
    index: AttributedString.Index.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.insert(
                    try AttributedSubstring.peekIota(substring, env: env),
                    at: try AttributedString.Index.peekIota(index, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_replaceSubrange")
public func __iota_Foundation_AttributedString_replaceSubrange(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributedString: AttributedString.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.replaceSubrange(
                    try RangeConverter<AttributedString.Index>.peekIota(range, env: env),
                    with: try AttributedString.peekIota(attributedString, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_replaceSubrangeWithSubstring")
public func __iota_Foundation_AttributedString_replaceSubrangeWithSubstring(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    substring: AttributedSubstring.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.replaceSubrange(
                    try RangeConverter<AttributedString.Index>.peekIota(range, env: env),
                    with: try AttributedSubstring.peekIota(substring, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_removeSubrange")
public func __iota_Foundation_AttributedString_removeSubrange(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.removeSubrange(
                    try RangeConverter<AttributedString.Index>.peekIota(range, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_setAttributes")
public func __iota_Foundation_AttributedString_setAttributes(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    attributes: AttributeContainer.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.setAttributes(
                    try AttributeContainer.peekIota(attributes, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_setAttributesForRange")
public func __iota_Foundation_AttributedString_setAttributesForRange(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributes: AttributeContainer.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf[try RangeConverter<AttributedString.Index>.peekIota(range, env: env)].setAttributes(
                    try AttributeContainer.peekIota(attributes, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_mergeAttributes")
public func __iota_Foundation_AttributedString_mergeAttributes(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    attributes: AttributeContainer.CType,
    keepCurrent: Bool.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.mergeAttributes(
                    try AttributeContainer.peekIota(attributes, env: env),
                    mergePolicy: !Bool.peekIota(keepCurrent, env: env) ? .keepNew : .keepCurrent
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_mergeAttributesForRange")
public func __iota_Foundation_AttributedString_mergeAttributesForRange(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributes: AttributeContainer.CType,
    keepCurrent: Bool.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf[try RangeConverter<AttributedString.Index>.peekIota(range, env: env)].mergeAttributes(
                    try AttributeContainer.peekIota(attributes, env: env),
                    mergePolicy: !Bool.peekIota(keepCurrent, env: env) ? .keepNew : .keepCurrent
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_replaceAttributes")
public func __iota_Foundation_AttributedString_replaceAttributes(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    attributes: AttributeContainer.CType,
    others: AttributeContainer.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.replaceAttributes(
                    try AttributeContainer.peekIota(attributes, env: env),
                    with: try AttributeContainer.peekIota(others, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_replaceAttributesForRange")
public func __iota_Foundation_AttributedString_replaceAttributesForRange(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributes: AttributeContainer.CType,
    others: AttributeContainer.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf[try RangeConverter<AttributedString.Index>.peekIota(range, env: env)].replaceAttributes(
                    try AttributeContainer.peekIota(attributes, env: env),
                    with: try AttributeContainer.peekIota(others, env: env)
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_Foundation_AttributedString_equals")
public func AttributedString_iotaEquals(
    envRef: EnvRef,
    lhs: foreignObject,
    rhs: foreignObject,
    _exn: foreignOutExn
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Bool.toIota(
            AttributedString.peekIota(lhs, env: env) == AttributedString.peekIota(rhs, env: env),
            env: env
        )
    }
}

@_cdecl("__iota_get_Foundation_AttributedString_hash")
public func AttributedString_iotaHash(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: AttributedString.peekIota(_iotaThis, env: env).hashValue),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_createEmpty")
public func __iota_Foundation_AttributedString_createEmpty(
    envRef: EnvRef,
    _exn: foreignOutExn
) -> AttributedString.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.toIota(
            AttributedString(),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_create")
public func __iota_Foundation_AttributedString_create(
    envRef: EnvRef,
    string: Swift.String.CType,
    attributes: OptionalConverter<AttributeContainer>.CType,
    _exn: foreignOutExn
) -> AttributedString.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.toIota(
            AttributedString(
                try Swift.String.peekIota(string, env: env),
                attributes: try OptionalConverter<AttributeContainer>.peekIota(attributes, env: env) ?? .init()
            ),
            env: env
        )
    }
}

@_cdecl("__iota_Foundation_AttributedString_createFromSubstring")
public func __iota_Foundation_AttributedString_createFromSubstring(
    envRef: EnvRef,
    substring: AttributedSubstring.CType,
    _exn: foreignOutExn
) -> AttributedString.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributedString.toIota(
            AttributedString(
                try AttributedSubstring.peekIota(substring, env: env)
            ),
            env: env
        )
    }
}
