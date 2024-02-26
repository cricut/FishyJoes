// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_MutableStruct_setup")
public func TestAPI_Structs_MutableStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.Structs.MutableStruct._ConstructorMethod,
    _ iGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ iSetter: @escaping @convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Structs.MutableStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.Structs.MutableStruct._constructorMethod[env] = constructorMethod
    TestAPI.Structs.MutableStruct._iGetter[env] = iGetter
    TestAPI.Structs.MutableStruct._iSetter[env] = iSetter
}

extension TestAPI.Structs.MutableStruct: IotaMutator {
    fileprivate static let _iGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    fileprivate static let _iSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.Int.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            i: try Swift.Int.consumeIota(
                try env.check { exn in _iGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.Int.toIota(value.i, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        try env.check { exn in _iSetter[env](
            this,
            try Swift.Int.toIota(value.i, env: env),
            exn
        )}
    }
}
