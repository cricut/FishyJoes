// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_MemberwiseStruct_setup")
public func TestAPI_Structs_MemberwiseStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.Structs.MemberwiseStruct._ConstructorMethod,
    _ immutableGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ immutableSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ mutableGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ mutableSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Structs.MemberwiseStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.Structs.MemberwiseStruct._constructorMethod[env] = constructorMethod
    TestAPI.Structs.MemberwiseStruct._immutableGetter[env] = immutableGetter
    TestAPI.Structs.MemberwiseStruct._immutableSetter[env] = immutableSetter
    TestAPI.Structs.MemberwiseStruct._mutableGetter[env] = mutableGetter
    TestAPI.Structs.MemberwiseStruct._mutableSetter[env] = mutableSetter
}

extension TestAPI.Structs.MemberwiseStruct: IotaMutator {
    fileprivate static let _immutableGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _immutableSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _mutableGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _mutableSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            immutable: try Swift.String.consumeIota(
                try env.check { exn in _immutableGetter[env](value, exn) },
                env: env
            ),
            mutable: try Swift.String.consumeIota(
                try env.check { exn in _mutableGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toIota(value.immutable, env: env),
                try Swift.String.toIota(value.mutable, env: env),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this, env: env)
        let result = try body(&mutatingSelf)
        try env.check { exn in _immutableSetter[env](
            this,
            try Swift.String.toIota(mutatingSelf.immutable, env: env),
            exn
        )}
        try env.check { exn in _mutableSetter[env](
            this,
            try Swift.String.toIota(mutatingSelf.mutable, env: env),
            exn
        )}
        return result
    }
}
