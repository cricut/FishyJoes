// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Functions_TheError_setup")
public func TestAPI_Functions_TheError_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard Functions.TheError._constructorMethod == nil else { return }
    Functions.TheError._constructorMethod = constructorMethod
}

extension Functions.TheError: IotaMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekIota(_ value: csObject) throws -> Functions.TheError {
        try Box<Functions.TheError>.peekIota(value).value
    }

    public static func toIota(_ value: Functions.TheError) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateIota<R>(_ this: csObject, body: (inout Functions.TheError) throws -> R) throws -> R {
        try body(&Box<Functions.TheError>.peekIota(this).value)
    }
}
