// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("Structs_ReferenceStructSetup")
fileprivate func cSharpSetup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer) -> csObject
) {
    guard Structs.ReferenceStruct._constructorMethod == nil else { return }
    Structs.ReferenceStruct._constructorMethod = constructorMethod
}

extension Structs.ReferenceStruct: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer) -> csObject)!

    public static func fromCSharp(_ value: csObject) throws -> Self {
        try Box<Structs.ReferenceStruct>.fromCSharp(value).value
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return _constructorMethod(ptr)
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        try body(&Box<Structs.ReferenceStruct>.fromCSharp(this).value)
    }
}
