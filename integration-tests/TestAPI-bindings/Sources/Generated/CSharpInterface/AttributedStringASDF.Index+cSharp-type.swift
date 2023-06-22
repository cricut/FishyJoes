// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedStringASDF_Index_setup")
public func TestAPI_AttributedStringASDF_Index_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedStringASDF.Index._constructorMethod == nil else { return }
    AttributedStringASDF.Index._constructorMethod = constructorMethod
}

extension AttributedStringASDF.Index: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedStringASDF.Index {
        try Box<AttributedStringASDF.Index>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedStringASDF.Index) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedStringASDF.Index) throws -> R) throws -> R {
        try body(&Box<AttributedStringASDF.Index>.peekCSharp(this).value)
    }
}
