// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedStringASDF_AttributeMergePolicy_setup")
public func TestAPI_AttributedStringASDF_AttributeMergePolicy_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedStringASDF.AttributeMergePolicy._constructorMethod == nil else { return }
    AttributedStringASDF.AttributeMergePolicy._constructorMethod = constructorMethod
}

extension AttributedStringASDF.AttributeMergePolicy: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedStringASDF.AttributeMergePolicy {
        try Box<AttributedStringASDF.AttributeMergePolicy>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedStringASDF.AttributeMergePolicy) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedStringASDF.AttributeMergePolicy) throws -> R) throws -> R {
        try body(&Box<AttributedStringASDF.AttributeMergePolicy>.peekCSharp(this).value)
    }
}
@_cdecl("__cs_AttributedStringASDF_AttributeMergePolicy_equals")
public func AttributedStringASDF_AttributeMergePolicy_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedStringASDF.AttributeMergePolicy.peekCSharp(lhs) == AttributedStringASDF.AttributeMergePolicy.peekCSharp(rhs))
    }
}
@_cdecl("__cs_AttributedStringASDF_AttributeMergePolicy_hash")
public func AttributedStringASDF_AttributeMergePolicy_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedStringASDF.AttributeMergePolicy.peekCSharp(this).hashValue)
        )
    }
}
