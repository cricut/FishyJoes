// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestProtocolStruct_setup")
public func TestAPI_TestProtocolStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.TestProtocolStruct._ConstructorMethod,
    _ corgeGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ corgeSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestProtocolStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.TestProtocolStruct._constructorMethod[env] = constructorMethod
    TestAPI.TestProtocolStruct._corgeGetter[env] = corgeGetter
    TestAPI.TestProtocolStruct._corgeSetter[env] = corgeSetter
}

extension TestAPI.TestProtocolStruct: IotaMutator {
    fileprivate static let _corgeGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _corgeSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            corge: try Swift.String.consumeIota(
                try env.check { exn in _corgeGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toIota(value.corge, env: env),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this, env: env)
        let result = try body(&mutatingSelf)
        try env.check { exn in _corgeSetter[env](
            this,
            try Swift.String.toIota(mutatingSelf.corge, env: env),
            exn
        )}
        return result
    }
}
