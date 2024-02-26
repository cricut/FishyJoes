// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Actors_TemperatureLogger_setup")
public func TestAPI_Actors_TemperatureLogger_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Actors.TemperatureLogger._constructorMethod.isInitialized(env) { return }
    TestAPI.Actors.TemperatureLogger._constructorMethod[env] = constructorMethod
}

extension TestAPI.Actors.TemperatureLogger: IotaReferenceMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.Actors.TemperatureLogger {
        try Box<TestAPI.Actors.TemperatureLogger>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.Actors.TemperatureLogger, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }
}
