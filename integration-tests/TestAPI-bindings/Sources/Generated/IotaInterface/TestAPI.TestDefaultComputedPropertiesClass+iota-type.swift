// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestDefaultComputedPropertiesClass_setup")
public func TestAPI_TestDefaultComputedPropertiesClass_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestDefaultComputedPropertiesClass._constructorMethod.isInitialized(env) { return }
    TestAPI.TestDefaultComputedPropertiesClass._constructorMethod[env] = constructorMethod
}

extension TestAPI.TestDefaultComputedPropertiesClass: IotaReferenceMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.TestDefaultComputedPropertiesClass {
        try Box<TestAPI.TestDefaultComputedPropertiesClass>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.TestDefaultComputedPropertiesClass, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }
}
