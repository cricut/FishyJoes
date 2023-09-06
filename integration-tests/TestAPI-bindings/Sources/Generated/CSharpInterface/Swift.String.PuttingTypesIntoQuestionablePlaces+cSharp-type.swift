// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("Swift_String_PuttingTypesIntoQuestionablePlaces_setup")
public func Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
    constructorMethod: @escaping Swift.String.PuttingTypesIntoQuestionablePlaces._ConstructorMethod,
    _ xGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.String.CType,
    _ xSetter: @escaping @convention(c) (csObject, Swift.String.CType, _ exn: csOutExn) -> Void,
    _ exn: csOutExn
) {
    guard Swift.String.PuttingTypesIntoQuestionablePlaces._constructorMethod == nil else { return }
    Swift.String.PuttingTypesIntoQuestionablePlaces._constructorMethod = constructorMethod
    Swift.String.PuttingTypesIntoQuestionablePlaces._xGetter = xGetter
    Swift.String.PuttingTypesIntoQuestionablePlaces._xSetter = xSetter
}

extension Swift.String.PuttingTypesIntoQuestionablePlaces: CSharpMutator {
    fileprivate static var _xGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.String.CType)!
    fileprivate static var _xSetter: (@convention(c) (csObject, Swift.String.CType, _ exn: csOutExn) -> Void)!
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        _ exn: csOutExn
    ) -> csObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        Self(
            x: try Swift.String.consumeCSharp(
                try Env.check { exn in _xGetter(value, exn) }
            )
        )
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try Swift.String.toCSharp(value.x),
                exn
            )
        }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekCSharp(this)
        let result = try body(&mutatingSelf)
        try Env.check { exn in _xSetter(
            this,
            try Swift.String.toCSharp(mutatingSelf.x),
            exn
        )}
        return result
    }
}
