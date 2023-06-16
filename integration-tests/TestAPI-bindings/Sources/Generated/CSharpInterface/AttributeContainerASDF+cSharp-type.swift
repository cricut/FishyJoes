// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributeContainerASDF_setup")
public func TestAPI_AttributeContainerASDF_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributeContainerASDF._constructorMethod == nil else { return }
    AttributeContainerASDF._constructorMethod = constructorMethod
}

extension AttributeContainerASDF: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributeContainerASDF {
        try Box<AttributeContainerASDF>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributeContainerASDF) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributeContainerASDF) throws -> R) throws -> R {
        try body(&Box<AttributeContainerASDF>.peekCSharp(this).value)
    }
}
@_cdecl("__cs_AttributeContainerASDF_equals")
public func AttributeContainerASDF_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributeContainerASDF.peekCSharp(lhs) == AttributeContainerASDF.peekCSharp(rhs))
    }
}
@_cdecl("__cs_AttributeContainerASDF_hash")
public func AttributeContainerASDF_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributeContainerASDF.peekCSharp(this).hashValue)
        )
    }
}
