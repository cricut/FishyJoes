// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_MemberwiseStruct_setup")
public func TestAPI_Structs_MemberwiseStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping Structs.MemberwiseStruct._ConstructorMethod,
    _ immutableGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ immutableSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ mutableGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ mutableSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if Structs.MemberwiseStruct._constructorMethod.isInitialized(env) { return }
    Structs.MemberwiseStruct._constructorMethod[env] = constructorMethod
    Structs.MemberwiseStruct._immutableGetter[env] = immutableGetter
    Structs.MemberwiseStruct._immutableSetter[env] = immutableSetter
    Structs.MemberwiseStruct._mutableGetter[env] = mutableGetter
    Structs.MemberwiseStruct._mutableSetter[env] = mutableSetter
}

extension Structs.MemberwiseStruct: DartMutator {
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

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            immutable: try Swift.String.consumeDart(
                try env.check { exn in _immutableGetter[env](value, exn) },
                env: env
            ),
            mutable: try Swift.String.consumeDart(
                try env.check { exn in _mutableGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toDart(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toDart(value.immutable, env: env),
                try Swift.String.toDart(value.mutable, env: env),
                exn
            )
        }
    }

    public static func mutateDart<R>(_ this: foreignObject, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekDart(this, env: env)
        let result = try body(&mutatingSelf)
        try env.check { exn in _immutableSetter[env](
            this,
            try Swift.String.toDart(mutatingSelf.immutable, env: env),
            exn
        )}
        try env.check { exn in _mutableSetter[env](
            this,
            try Swift.String.toDart(mutatingSelf.mutable, env: env),
            exn
        )}
        return result
    }
}
