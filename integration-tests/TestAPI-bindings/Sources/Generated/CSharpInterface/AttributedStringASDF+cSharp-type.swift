// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedStringASDF_setup")
public func TestAPI_AttributedStringASDF_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedStringASDF._constructorMethod == nil else { return }
    AttributedStringASDF._constructorMethod = constructorMethod
}

extension AttributedStringASDF: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedStringASDF {
        try Box<AttributedStringASDF>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedStringASDF) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedStringASDF) throws -> R) throws -> R {
        try body(&Box<AttributedStringASDF>.peekCSharp(this).value)
    }
}
@_cdecl("__cs_AttributedStringASDF_equals")
public func AttributedStringASDF_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedStringASDF.peekCSharp(lhs) == AttributedStringASDF.peekCSharp(rhs))
    }
}
@_cdecl("__cs_AttributedStringASDF_hash")
public func AttributedStringASDF_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedStringASDF.peekCSharp(this).hashValue)
        )
    }
}
