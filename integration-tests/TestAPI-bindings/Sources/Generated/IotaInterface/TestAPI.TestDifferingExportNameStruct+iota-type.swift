// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestDifferingExportNameStruct_setup")
public func TestAPI_TestDifferingExportNameStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.TestDifferingExportNameStruct._ConstructorMethod,
    _ tataGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ tataSetter: @escaping @convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestDifferingExportNameStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.TestDifferingExportNameStruct._constructorMethod[env] = constructorMethod
    TestAPI.TestDifferingExportNameStruct._tataGetter[env] = tataGetter
    TestAPI.TestDifferingExportNameStruct._tataSetter[env] = tataSetter
}

extension TestAPI.TestDifferingExportNameStruct: IotaMutator {
    fileprivate static let _tataGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    fileprivate static let _tataSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.Int.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            tata: try Swift.Int.consumeIota(
                try env.check { exn in _tataGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.Int.toIota(value.tata, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        try env.check { exn in _tataSetter[env](
            this,
            try Swift.Int.toIota(value.tata, env: env),
            exn
        )}
    }
}
