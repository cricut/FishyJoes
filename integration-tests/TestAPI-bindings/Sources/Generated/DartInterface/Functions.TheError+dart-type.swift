// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Functions_TheError_setup")
public func TestAPI_Functions_TheError_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if Functions.TheError._constructorMethod.isInitialized(env) { return }
    Functions.TheError._constructorMethod[env] = constructorMethod
}

extension Functions.TheError: DartMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Functions.TheError {
        try Box<Functions.TheError>.peekDart(value, env: env).value
    }

    public static func toDart(_ value: Functions.TheError, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }

    public static func mutateDart<R>(_ this: foreignObject, env: Env, body: (inout Functions.TheError) throws -> R) throws -> R {
        try body(&Box<Functions.TheError>.peekDart(this, env: env).value)
    }
}
