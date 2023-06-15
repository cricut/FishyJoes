// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_ReferenceStruct_setup")
public func TestAPI_Structs_ReferenceStruct_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard Structs.ReferenceStruct._constructorMethod == nil else { return }
    Structs.ReferenceStruct._constructorMethod = constructorMethod
}

extension Structs.ReferenceStruct: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject) throws -> Structs.ReferenceStruct {
        try Box<Structs.ReferenceStruct>.peekIota(value).value
    }

    public static func toIota(_ value: Structs.ReferenceStruct) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, body: (inout Structs.ReferenceStruct) throws -> R) throws -> R {
        try body(&Box<Structs.ReferenceStruct>.peekIota(this).value)
    }
}
@_cdecl("__iota_Structs_ReferenceStruct_equals")
public func Structs_ReferenceStruct_iotaEquals(lhs: foreignObject, rhs: foreignObject, exn: foreignOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toIota(Structs.ReferenceStruct.peekIota(lhs) == Structs.ReferenceStruct.peekIota(rhs))
    }
}
@_cdecl("__iota_Structs_ReferenceStruct_hash")
public func Structs_ReferenceStruct_iotaHash(this: foreignObject, exn: foreignOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toIota(
            Int32(truncatingIfNeeded: Structs.ReferenceStruct.peekIota(this).hashValue)
        )
    }
}
