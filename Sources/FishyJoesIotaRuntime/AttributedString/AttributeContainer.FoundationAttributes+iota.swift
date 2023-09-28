import Foundation

extension AttributeContainer.FoundationAttributes: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributeContainer.FoundationAttributes {
        try Box<AttributeContainer.FoundationAttributes>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributeContainer.FoundationAttributes, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributeContainer.FoundationAttributes) throws -> R) throws -> R {
        try body(&Box<AttributeContainer.FoundationAttributes>.peekIota(this, env: env).value)
    }
}

@_cdecl("FishyJoesRuntime_AttributeContainer_FoundationAttributes_setup")
public func FishyJoesRuntime_iota_AttributeContainer_FoundationAttributes_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard AttributeContainer.FoundationAttributes._constructorMethod == nil else { return }
    AttributeContainer.FoundationAttributes._constructorMethod = constructorMethod
}

@_cdecl("__iota_get_FishyJoesRuntime_AttributeContainer_FoundationAttributes_Link")
public func __iota_get_FishyJoesRuntime_AttributeContainer_FoundationAttributes_Link(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> OptionalConverter<Foundation.URL>.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try OptionalConverter<Foundation.URL>.toIota(
            AttributeContainer.FoundationAttributes.peekIota(_iotaThis, env: env).link,
            env: env
        )
    }
}

@_cdecl("__iota_set_FishyJoesRuntime_AttributeContainer_FoundationAttributes_Link")
public func __iota_set_FishyJoesRuntime_AttributeContainer_FoundationAttributes_Link(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    newValue: OptionalConverter<Foundation.URL>.CType,
    _exn: foreignOutExn
) {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributeContainer.FoundationAttributes.mutateIota(_iotaThis, env: env) { value in
            value.link = try OptionalConverter<Foundation.URL>.peekIota(newValue, env: env)
        }
    }
}

@_cdecl("__iota_get_FishyJoesRuntime_AttributeContainer_FoundationAttributes_LanguageIdentifier")
public func __iota_get_FishyJoesRuntime_AttributeContainer_FoundationAttributes_LanguageIdentifier(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> OptionalConverter<Swift.String>.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try OptionalConverter<Swift.String>.toIota(
            AttributeContainer.FoundationAttributes.peekIota(_iotaThis, env: env).languageIdentifier,
            env: env
        )
    }
}

@_cdecl("__iota_set_FishyJoesRuntime_AttributeContainer_FoundationAttributes_LanguageIdentifier")
public func __iota_set_FishyJoesRuntime_AttributeContainer_FoundationAttributes_LanguageIdentifier(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    newValue: OptionalConverter<Swift.String>.CType,
    _exn: foreignOutExn
) {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributeContainer.FoundationAttributes.mutateIota(_iotaThis, env: env) { value in
            value.languageIdentifier = try OptionalConverter<Swift.String>.peekIota(newValue, env: env)
        }
    }
}

@_cdecl("__iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_equals")
public func AttributeContainer_FoundationAttributes_iotaEquals(
    envRef: EnvRef,
    lhs: foreignObject,
    rhs: foreignObject,
    _exn: foreignOutExn
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Bool.toIota(
            AttributeContainer.FoundationAttributes.peekIota(lhs, env: env) == AttributeContainer.FoundationAttributes.peekIota(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_hash")
public func AttributeContainer_FoundationAttributes_iotaHash(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: AttributeContainer.FoundationAttributes.peekIota(_iotaThis, env: env).hashValue),
            env: env
        )
    }
}

@_cdecl("__iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_createEmpty")
public func __iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_createEmpty(
    envRef: EnvRef,
    _exn: foreignOutExn
) -> AttributeContainer.FoundationAttributes.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributeContainer.FoundationAttributes.toIota(
            AttributeContainer.FoundationAttributes(),
            env: env
        )
    }
}

@_cdecl("__iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_createFromContainer")
public func __iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_createFromContainer(
    envRef: EnvRef,
    container: Foundation.AttributeContainer.CType,
    _exn: foreignOutExn
) -> AttributeContainer.FoundationAttributes.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributeContainer.FoundationAttributes.toIota(
            AttributeContainer.FoundationAttributes(
                try Foundation.AttributeContainer.peekIota(container, env: env)
            ),
            env: env
        )
    }
}

@_cdecl("__iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_asContainer")
public func __iota_FishyJoesRuntime_AttributeContainer_FoundationAttributes_asContainer(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> AttributeContainer.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try AttributeContainer.toIota(
            AttributeContainer(AttributeContainer.FoundationAttributes.peekIota(_iotaThis, env: env)),
            env: env
        )
    }
}
