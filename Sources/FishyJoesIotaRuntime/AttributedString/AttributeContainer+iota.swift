import Foundation

extension AttributeContainer: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AttributeContainer {
        try Box<AttributeContainer>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributeContainer, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout AttributeContainer) throws -> R) throws -> R {
        try body(&Box<AttributeContainer>.peekIota(this, env: env).value)
    }
}

@_cdecl("FishyJoesCommonRuntime_AttributeContainer_setup")
public func FishyJoesRuntime_iota_AttributeContainer_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard AttributeContainer._constructorMethod == nil else { return }
    AttributeContainer._constructorMethod = constructorMethod
}

@_cdecl("__iota_FishyJoesCommonRuntime_AttributeContainer_merge")
public func __iota_FishyJoesRuntime_AttributeContainer_merge(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    other: AttributeContainer.CType,
    keepCurrent: Bool.CType,
    _exn: foreignOutExn
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributeContainer.mutateIota(_iotaThis, env: env) { mutatingSelf in
            return try VoidConverter.toIota(
                mutatingSelf.merge(
                    try AttributeContainer.peekIota(other, env: env),
                    mergePolicy: !Bool.peekIota(keepCurrent, env: env) ? .keepNew : .keepCurrent
                ),
                env: env
            )
        }
    }
}

@_cdecl("__iota_FishyJoesCommonRuntime_AttributeContainer_equals")
public func AttributeContainer_iotaEquals(
    envRef: EnvRef,
    lhs: foreignObject,
    rhs: foreignObject,
    _exn: foreignOutExn
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Bool.toIota(
            AttributeContainer.peekIota(lhs, env: env) == AttributeContainer.peekIota(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__iota_FishyJoesCommonRuntime_AttributeContainer_hash")
public func AttributeContainer_iotaHash(
    envRef: EnvRef,
    _iotaThis: foreignObject,
    _exn: foreignOutExn
) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: AttributedString("HASH", attributes: AttributeContainer.peekIota(_iotaThis, env: env)).hashValue),
            env: env
        )
    }
}

@_cdecl("__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty")
public func __iota_FishyJoesRuntime_AttributeContainer_createEmpty(
    envRef: EnvRef,
    _exn: foreignOutExn
) -> AttributeContainer.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributeContainer.toIota(
            AttributeContainer(),
            env: env
        )
    }
}
