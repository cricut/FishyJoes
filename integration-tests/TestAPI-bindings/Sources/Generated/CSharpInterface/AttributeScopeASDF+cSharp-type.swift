// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributeScopeASDF_setup")
public func TestAPI_AttributeScopeASDF_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributeScopeASDF._constructorMethod == nil else { return }
    AttributeScopeASDF._constructorMethod = constructorMethod
}

extension AttributeScopeASDF: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributeScopeASDF {
        try Box<AttributeScopeASDF>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributeScopeASDF) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributeScopeASDF) throws -> R) throws -> R {
        try body(&Box<AttributeScopeASDF>.peekCSharp(this).value)
    }
}
