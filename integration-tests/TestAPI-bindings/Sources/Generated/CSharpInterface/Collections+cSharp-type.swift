// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Collections_setup")
public func TestAPI_Collections_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard Collections._constructorMethod == nil else { return }
    Collections._constructorMethod = constructorMethod
}

extension Collections: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        try Box<Collections>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        // Uninhabited type
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        try body(&Box<Collections>.peekCSharp(this).value)
    }
}
