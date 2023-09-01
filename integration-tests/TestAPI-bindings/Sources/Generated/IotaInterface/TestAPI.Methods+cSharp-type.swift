// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Methods_setup")
public func TestAPI_Methods_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard TestAPI.Methods._constructorMethod == nil else { return }
    TestAPI.Methods._constructorMethod = constructorMethod
}

extension TestAPI.Methods: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> TestAPI.Methods {
        try Box<TestAPI.Methods>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: TestAPI.Methods) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout TestAPI.Methods) throws -> R) throws -> R {
        try body(&Box<TestAPI.Methods>.peekCSharp(this).value)
    }
}
