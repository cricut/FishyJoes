// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedStringASDF_CharacterView_setup")
public func TestAPI_AttributedStringASDF_CharacterView_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedStringASDF.CharacterView._constructorMethod == nil else { return }
    AttributedStringASDF.CharacterView._constructorMethod = constructorMethod
}

extension AttributedStringASDF.CharacterView: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedStringASDF.CharacterView {
        try Box<AttributedStringASDF.CharacterView>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedStringASDF.CharacterView) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedStringASDF.CharacterView) throws -> R) throws -> R {
        try body(&Box<AttributedStringASDF.CharacterView>.peekCSharp(this).value)
    }
}
