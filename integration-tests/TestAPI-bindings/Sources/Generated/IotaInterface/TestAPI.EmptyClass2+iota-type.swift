// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_EmptyClass2_setup")
public func TestAPI_EmptyClass2_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.EmptyClass2._constructorMethod.isInitialized(env) { return }
    TestAPI.EmptyClass2._constructorMethod[env] = constructorMethod
}

extension TestAPI.EmptyClass2: IotaReferenceMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.EmptyClass2 {
        try Box<TestAPI.EmptyClass2>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.EmptyClass2, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }
}
@_cdecl("__iota_TestAPI_EmptyClass2_equals")
public func TestAPI_EmptyClass2_iotaEquals(envRef: EnvRef, lhs: foreignObject, rhs: foreignObject, exn: foreignOutExn) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Bool.toIota(
            TestAPI.EmptyClass2.peekIota(lhs, env: env) == TestAPI.EmptyClass2.peekIota(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__iota_get_TestAPI_EmptyClass2_hash")
public func TestAPI_EmptyClass2_iotaHash(envRef: EnvRef, this: foreignObject, exn: foreignOutExn) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: TestAPI.EmptyClass2.peekIota(this, env: env).hashValue),
            env: env
        )
    }
}
