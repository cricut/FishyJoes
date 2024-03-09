// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_DougStruct_setup")
public func TestAPI_Structs_DougStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.Structs.DougStruct._ConstructorMethod,
    _ strGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ strSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Structs.DougStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.Structs.DougStruct._constructorMethod[env] = constructorMethod
    TestAPI.Structs.DougStruct._strGetter[env] = strGetter
    TestAPI.Structs.DougStruct._strSetter[env] = strSetter
}

extension TestAPI.Structs.DougStruct: IotaMutator {
    fileprivate static let _strGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _strSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            str: try Swift.String.consumeIota(
                try env.check { exn in _strGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toIota(value.str, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        try env.check { exn in _strSetter[env](
            this,
            try Swift.String.toIota(value.str, env: env),
            exn
        )}
    }
}
