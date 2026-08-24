import Foundation

extension AttributeContainer: IotaReferenceMutator {
    public typealias Constructor = IotaSwiftReferenceConstructor
    fileprivate static var constructor = Env.CallbackMap<Constructor>()

    public static func peekIota(_ value: HostObject, env: Env) throws -> AttributeContainer {
        try Box<AttributeContainer>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: AttributeContainer, env: Env) throws -> HostObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in constructor[env](ptr, exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_AttributeContainer_setup")
public func FishyJoesRuntime_iota_AttributeContainer_setup(
    envRef: EnvRef,
    constructor: @escaping AttributeContainer.Constructor,
    _ exn: OutHostException
) {
    let env = Env(envRef)
    if AttributeContainer.constructor.isInitialized(env) { return }
    AttributeContainer.constructor[env] = constructor
}

@_cdecl("__iota_FishyJoesCommonRuntime_AttributeContainer_merge")
public func __iota_FishyJoesRuntime_AttributeContainer_merge(
    envRef: EnvRef,
    _iotaThis: HostObject,
    other: AttributeContainer.CType,
    keepCurrent: Bool.CType,
    _exn: OutHostException
) -> VoidConverter.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributeContainer.withMutatingIota(_iotaThis, env: env) { mutatingSelf in
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
    lhs: HostObject,
    rhs: HostObject,
    _exn: OutHostException
) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try Bool.toIota(
            AttributeContainer.peekIota(lhs, env: env) == AttributeContainer.peekIota(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash")
public func AttributeContainer_iotaHash(
    envRef: EnvRef,
    _iotaThis: HostObject,
    _exn: OutHostException
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
    _exn: OutHostException
) -> AttributeContainer.CType {
    let env = Env(envRef)
    return env.catching(to: _exn) {
        return try AttributeContainer.toIota(
            AttributeContainer(),
            env: env
        )
    }
}
