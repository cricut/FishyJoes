// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_EmptyStruct_setup")
public func TestAPI_Structs_EmptyStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.Structs.EmptyStruct._ConstructorMethod,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Structs.EmptyStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.Structs.EmptyStruct._constructorMethod[env] = constructorMethod
}

extension TestAPI.Structs.EmptyStruct: IotaMutator {
    public typealias _ConstructorMethod = @convention(c) (
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
    }
}
