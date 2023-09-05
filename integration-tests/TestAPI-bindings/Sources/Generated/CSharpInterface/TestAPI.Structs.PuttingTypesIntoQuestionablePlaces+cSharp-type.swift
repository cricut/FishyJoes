// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup")
public func TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard TestAPI.Structs.PuttingTypesIntoQuestionablePlaces._constructorMethod == nil else { return }
    TestAPI.Structs.PuttingTypesIntoQuestionablePlaces._constructorMethod = constructorMethod
}

extension TestAPI.Structs.PuttingTypesIntoQuestionablePlaces: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> TestAPI.Structs.PuttingTypesIntoQuestionablePlaces {
        try Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout TestAPI.Structs.PuttingTypesIntoQuestionablePlaces) throws -> R) throws -> R {
        try body(&Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.peekCSharp(this).value)
    }
}
