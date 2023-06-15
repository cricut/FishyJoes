// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_ReferenceStruct_setup")
public func TestAPI_Structs_ReferenceStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if Structs.ReferenceStruct._constructorMethod.isInitialized(env) { return }
    Structs.ReferenceStruct._constructorMethod[env] = constructorMethod
}

extension Structs.ReferenceStruct: DartMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Structs.ReferenceStruct {
        try Box<Structs.ReferenceStruct>.peekDart(value, env: env).value
    }

    public static func toDart(_ value: Structs.ReferenceStruct, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }

    public static func mutateDart<R>(_ this: foreignObject, env: Env, body: (inout Structs.ReferenceStruct) throws -> R) throws -> R {
        try body(&Box<Structs.ReferenceStruct>.peekDart(this, env: env).value)
    }
}
@_cdecl("__dart_Structs_ReferenceStruct_equals")
public func Structs_ReferenceStruct_dartEquals(envRef: EnvRef, lhs: foreignObject, rhs: foreignObject, exn: foreignOutExn) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Bool.toDart(
            Structs.ReferenceStruct.peekDart(lhs, env: env) == Structs.ReferenceStruct.peekDart(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__dart_Structs_ReferenceStruct_hash")
public func Structs_ReferenceStruct_dartHash(envRef: EnvRef, this: foreignObject, exn: foreignOutExn) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Int32.toDart(
            Int32(truncatingIfNeeded: Structs.ReferenceStruct.peekDart(this, env: env).hashValue),
            env: env
        )
    }
}
