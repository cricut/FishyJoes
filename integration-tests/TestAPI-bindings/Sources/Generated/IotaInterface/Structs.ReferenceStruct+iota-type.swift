// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
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
    if Structs.ReferenceStruct._constructorMethod.isInitialized(env) { return }
    Structs.ReferenceStruct._constructorMethod[env] = constructorMethod
}

extension Structs.ReferenceStruct: IotaMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Structs.ReferenceStruct {
        try Box<Structs.ReferenceStruct>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: Structs.ReferenceStruct, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout Structs.ReferenceStruct) throws -> R) throws -> R {
        try body(&Box<Structs.ReferenceStruct>.peekIota(this, env: env).value)
    }
}
@_cdecl("__iota_Structs_ReferenceStruct_equals")
public func Structs_ReferenceStruct_iotaEquals(envRef: EnvRef, lhs: foreignObject, rhs: foreignObject, exn: foreignOutExn) -> Bool.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Bool.toIota(
            Structs.ReferenceStruct.peekIota(lhs, env: env) == Structs.ReferenceStruct.peekIota(rhs, env: env),
            env: env
        )
    }
}
@_cdecl("__iota_get_Structs_ReferenceStruct_hash")
public func Structs_ReferenceStruct_iotaHash(envRef: EnvRef, this: foreignObject, exn: foreignOutExn) -> Int32.CType {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: Structs.ReferenceStruct.peekIota(this, env: env).hashValue),
            env: env
        )
    }
}
