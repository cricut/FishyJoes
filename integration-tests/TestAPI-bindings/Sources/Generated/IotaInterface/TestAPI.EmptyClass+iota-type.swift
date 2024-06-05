// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_EmptyClass_setup")
public func TestAPI_EmptyClass_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.EmptyClass._constructorMethod.isInitialized(env) { return }
    TestAPI.EmptyClass._constructorMethod[env] = constructorMethod
}

extension TestAPI.EmptyClass: IotaReferenceMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.EmptyClass {
        try Box<TestAPI.EmptyClass>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.EmptyClass, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }
}
@_cdecl("__iota_TestAPI_EmptyClass_equals")
public func TestAPI_EmptyClass_iotaEquals(envRef: EnvRef, lhs: foreignObject, rhs: foreignObject, exn: foreignOutExn) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Bool.toIota(
            TestAPI.EmptyClass.peekIota(lhs, env: env) == TestAPI.EmptyClass.peekIota(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__iota_get_TestAPI_EmptyClass_hash")
public func TestAPI_EmptyClass_iotaHash(envRef: EnvRef, this: foreignObject, exn: foreignOutExn) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: TestAPI.EmptyClass.peekIota(this, env: env).hashValue),
            env: env
        )
    }
}
