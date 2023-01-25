// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_ReferenceStruct_setup")
public func TestAPI_Structs_ReferenceStruct_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard Structs.ReferenceStruct._constructorMethod == nil else { return }
    Structs.ReferenceStruct._constructorMethod = constructorMethod
}

extension Structs.ReferenceStruct: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> Structs.ReferenceStruct {
        try Box<Structs.ReferenceStruct>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: Structs.ReferenceStruct) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Structs.ReferenceStruct) throws -> R) throws -> R {
        try body(&Box<Structs.ReferenceStruct>.peekCSharp(this).value)
    }
}
@_cdecl("__cs_Structs_ReferenceStruct_equals")
public func Structs_ReferenceStruct_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(Structs.ReferenceStruct.peekCSharp(lhs) == Structs.ReferenceStruct.peekCSharp(rhs))
    }
}
@_cdecl("__cs_Structs_ReferenceStruct_hash")
public func Structs_ReferenceStruct_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: Structs.ReferenceStruct.peekCSharp(this).hashValue)
        )
    }
}
