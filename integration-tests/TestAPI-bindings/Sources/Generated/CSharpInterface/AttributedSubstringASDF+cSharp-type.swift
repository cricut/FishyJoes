// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedSubstringASDF_setup")
public func TestAPI_AttributedSubstringASDF_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedSubstringASDF._constructorMethod == nil else { return }
    AttributedSubstringASDF._constructorMethod = constructorMethod
}

extension AttributedSubstringASDF: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedSubstringASDF {
        try Box<AttributedSubstringASDF>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedSubstringASDF) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedSubstringASDF) throws -> R) throws -> R {
        try body(&Box<AttributedSubstringASDF>.peekCSharp(this).value)
    }
}
@_cdecl("__cs_AttributedSubstringASDF_equals")
public func AttributedSubstringASDF_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedSubstringASDF.peekCSharp(lhs) == AttributedSubstringASDF.peekCSharp(rhs))
    }
}
@_cdecl("__cs_AttributedSubstringASDF_hash")
public func AttributedSubstringASDF_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedSubstringASDF.peekCSharp(this).hashValue)
        )
    }
}
