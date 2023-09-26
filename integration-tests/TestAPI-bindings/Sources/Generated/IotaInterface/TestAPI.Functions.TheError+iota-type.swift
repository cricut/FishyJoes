// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Functions_TheError_setup")
public func TestAPI_Functions_TheError_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Functions.TheError._constructorMethod.isInitialized(env) { return }
    TestAPI.Functions.TheError._constructorMethod[env] = constructorMethod
}

extension TestAPI.Functions.TheError: IotaMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.Functions.TheError {
        try Box<TestAPI.Functions.TheError>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.Functions.TheError, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout TestAPI.Functions.TheError) throws -> R) throws -> R {
        try body(&Box<TestAPI.Functions.TheError>.peekIota(this, env: env).value)
    }
}
