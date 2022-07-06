// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("Structs_ReferenceStructSetup")
fileprivate func cSharpSetup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard Structs.ReferenceStruct._constructorMethod == nil else { return }
    Structs.ReferenceStruct._constructorMethod = constructorMethod
}

extension Structs.ReferenceStruct: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func fromCSharp(_ value: csObject) throws -> Self {
        try Box<Structs.ReferenceStruct>.fromCSharp(value).value
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        try body(&Box<Structs.ReferenceStruct>.fromCSharp(this).value)
    }
}
@_cdecl("Structs_ReferenceStruct_equals")
private func cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(Structs.ReferenceStruct.fromCSharp(lhs) == Structs.ReferenceStruct.fromCSharp(rhs))
    }
}
@_cdecl("Structs_ReferenceStruct_hash")
private func cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: Structs.ReferenceStruct.fromCSharp(this).hashValue)
        )
    }
}
