// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Methods_setup")
public func TestAPI_Methods_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    guard Methods._constructorMethod == nil else { return }
    Methods._constructorMethod = constructorMethod
}

extension Methods: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject)!

    public static func peekIota(_ value: foreignObject) throws -> Methods {
        try Box<Methods>.peekIota(value).value
    }

    public static func toIota(_ value: Methods) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { exn in _constructorMethod(ptr, exn) }
    }

    public static func mutateIota<R>(_ this: foreignObject, body: (inout Methods) throws -> R) throws -> R {
        try body(&Box<Methods>.peekIota(this).value)
    }
}
