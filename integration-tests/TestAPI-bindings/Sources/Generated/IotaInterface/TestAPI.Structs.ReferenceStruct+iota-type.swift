// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_ReferenceStruct_setup")
public func TestAPI_Structs_ReferenceStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Structs.ReferenceStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.Structs.ReferenceStruct._constructorMethod[env] = constructorMethod
}

extension TestAPI.Structs.ReferenceStruct: IotaReferenceMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.Structs.ReferenceStruct {
        try Box<TestAPI.Structs.ReferenceStruct>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.Structs.ReferenceStruct, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }
}
@_cdecl("__iota_TestAPI_Structs_ReferenceStruct_equals")
public func TestAPI_Structs_ReferenceStruct_iotaEquals(envRef: EnvRef, lhs: foreignObject, rhs: foreignObject, exn: foreignOutExn) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Bool.toIota(
            TestAPI.Structs.ReferenceStruct.peekIota(lhs, env: env) == TestAPI.Structs.ReferenceStruct.peekIota(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__iota_get_TestAPI_Structs_ReferenceStruct_hash")
public func TestAPI_Structs_ReferenceStruct_iotaHash(envRef: EnvRef, this: foreignObject, exn: foreignOutExn) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: TestAPI.Structs.ReferenceStruct.peekIota(this, env: env).hashValue),
            env: env
        )
    }
}
