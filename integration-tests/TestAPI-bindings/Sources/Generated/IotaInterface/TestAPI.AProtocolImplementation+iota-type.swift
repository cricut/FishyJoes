// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AProtocolImplementation_setup")
public func TestAPI_AProtocolImplementation_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.AProtocolImplementation._ConstructorMethod,
    _ fooGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ fooSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ bazGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType,
    _ bazSetter: @escaping @convention(c) (foreignObject, Swift.Bool.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.AProtocolImplementation._constructorMethod.isInitialized(env) { return }
    TestAPI.AProtocolImplementation._constructorMethod[env] = constructorMethod
    TestAPI.AProtocolImplementation._fooGetter[env] = fooGetter
    TestAPI.AProtocolImplementation._fooSetter[env] = fooSetter
    TestAPI.AProtocolImplementation._bazGetter[env] = bazGetter
    TestAPI.AProtocolImplementation._bazSetter[env] = bazSetter
}

extension TestAPI.AProtocolImplementation: IotaMutator {
    fileprivate static let _fooGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _fooSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _bazGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType>()
    fileprivate static let _bazSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Bool.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        Swift.Bool.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            foo: try Swift.String.consumeIota(
                try env.check { exn in _fooGetter[env](value, exn) },
                env: env
            ),
            baz: try Swift.Bool.consumeIota(
                try env.check { exn in _bazGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toIota(value.foo, env: env),
                try Swift.Bool.toIota(value.baz, env: env),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this, env: env)
        let result = try body(&mutatingSelf)
        try env.check { exn in _fooSetter[env](
            this,
            try Swift.String.toIota(mutatingSelf.foo, env: env),
            exn
        )}
        try env.check { exn in _bazSetter[env](
            this,
            try Swift.Bool.toIota(mutatingSelf.baz, env: env),
            exn
        )}
        return result
    }
}
