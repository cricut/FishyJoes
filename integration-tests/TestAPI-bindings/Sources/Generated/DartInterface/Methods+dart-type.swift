// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Methods_setup")
public func TestAPI_Methods_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if Methods._constructorMethod.isInitialized(env) { return }
    Methods._constructorMethod[env] = constructorMethod
}

extension Methods: DartMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Methods {
        try Box<Methods>.peekDart(value, env: env).value
    }

    public static func toDart(_ value: Methods, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }

    public static func mutateDart<R>(_ this: foreignObject, env: Env, body: (inout Methods) throws -> R) throws -> R {
        try body(&Box<Methods>.peekDart(this, env: env).value)
    }
}
