// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestAsyncSwiftSideFunctionsClass_setup")
public func TestAPI_TestAsyncSwiftSideFunctionsClass_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestAsyncSwiftSideFunctionsClass._constructorMethod.isInitialized(env) { return }
    TestAPI.TestAsyncSwiftSideFunctionsClass._constructorMethod[env] = constructorMethod
}

extension TestAPI.TestAsyncSwiftSideFunctionsClass: IotaReferenceMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.TestAsyncSwiftSideFunctionsClass {
        try Box<TestAPI.TestAsyncSwiftSideFunctionsClass>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.TestAsyncSwiftSideFunctionsClass, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }
}
