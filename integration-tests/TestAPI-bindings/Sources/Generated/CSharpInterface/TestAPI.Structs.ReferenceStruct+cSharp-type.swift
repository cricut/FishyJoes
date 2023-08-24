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
    guard TestAPI.Structs.ReferenceStruct._constructorMethod == nil else { return }
    TestAPI.Structs.ReferenceStruct._constructorMethod = constructorMethod
}

extension TestAPI.Structs.ReferenceStruct: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> TestAPI.Structs.ReferenceStruct {
        try Box<TestAPI.Structs.ReferenceStruct>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: TestAPI.Structs.ReferenceStruct) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout TestAPI.Structs.ReferenceStruct) throws -> R) throws -> R {
        try body(&Box<TestAPI.Structs.ReferenceStruct>.peekCSharp(this).value)
    }
}
@_cdecl("__cs_TestAPI_Structs_ReferenceStruct_equals")
public func TestAPI_Structs_ReferenceStruct_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(TestAPI.Structs.ReferenceStruct.peekCSharp(lhs) == TestAPI.Structs.ReferenceStruct.peekCSharp(rhs))
    }
}
@_cdecl("__cs_TestAPI_Structs_ReferenceStruct_hash")
public func TestAPI_Structs_ReferenceStruct_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: TestAPI.Structs.ReferenceStruct.peekCSharp(this).hashValue)
        )
    }
}
