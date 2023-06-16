// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedStringASDF_Runs_Run_setup")
public func TestAPI_AttributedStringASDF_Runs_Run_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedStringASDF.Runs.Run._constructorMethod == nil else { return }
    AttributedStringASDF.Runs.Run._constructorMethod = constructorMethod
}

extension AttributedStringASDF.Runs.Run: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedStringASDF.Runs.Run {
        try Box<AttributedStringASDF.Runs.Run>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedStringASDF.Runs.Run) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedStringASDF.Runs.Run) throws -> R) throws -> R {
        try body(&Box<AttributedStringASDF.Runs.Run>.peekCSharp(this).value)
    }
}
@_cdecl("__cs_AttributedStringASDF_Runs_Run_equals")
public func AttributedStringASDF_Runs_Run_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedStringASDF.Runs.Run.peekCSharp(lhs) == AttributedStringASDF.Runs.Run.peekCSharp(rhs))
    }
}
@_cdecl("__cs_AttributedStringASDF_Runs_Run_hash")
public func AttributedStringASDF_Runs_Run_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedStringASDF.Runs.Run.peekCSharp(this).hashValue)
        )
    }
}
