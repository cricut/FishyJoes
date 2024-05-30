// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestDefaultComputedPropertiesStruct_setup")
public func TestAPI_TestDefaultComputedPropertiesStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.TestDefaultComputedPropertiesStruct._ConstructorMethod,
    _ spamGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType,
    _ spamSetter: @escaping @convention(c) (foreignObject, Swift.Bool.CType, _ exn: foreignOutExn) -> Void,
    _ nootGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ nootSetter: @escaping @convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestDefaultComputedPropertiesStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.TestDefaultComputedPropertiesStruct._constructorMethod[env] = constructorMethod
    TestAPI.TestDefaultComputedPropertiesStruct._spamGetter[env] = spamGetter
    TestAPI.TestDefaultComputedPropertiesStruct._spamSetter[env] = spamSetter
    TestAPI.TestDefaultComputedPropertiesStruct._nootGetter[env] = nootGetter
    TestAPI.TestDefaultComputedPropertiesStruct._nootSetter[env] = nootSetter
}

extension TestAPI.TestDefaultComputedPropertiesStruct: IotaMutator {
    fileprivate static let _spamGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType>()
    fileprivate static let _spamSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Bool.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _nootGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    fileprivate static let _nootSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.Bool.CType,
        Swift.Int.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            spam: try Swift.Bool.consumeIota(
                try env.check { exn in _spamGetter[env](value, exn) },
                env: env
            ),
            noot: try Swift.Int.consumeIota(
                try env.check { exn in _nootGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.Bool.toIota(value.spam, env: env),
                try Swift.Int.toIota(value.noot, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        try env.check { exn in _spamSetter[env](
            this,
            try Swift.Bool.toIota(value.spam, env: env),
            exn
        )}
        try env.check { exn in _nootSetter[env](
            this,
            try Swift.Int.toIota(value.noot, env: env),
            exn
        )}
    }
}
