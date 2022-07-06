// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("Structs_MemberwiseStructSetup")
fileprivate func cSharpSetup(
    constructorMethod: @escaping Structs.MemberwiseStruct._ConstructorMethod,
    _ immutableGetter: @escaping (csObject, _ exn: csOutExn) -> Swift.String.CType,
    _ mutableGetter: @escaping (csObject, _ exn: csOutExn) -> Swift.String.CType,
    _ exn: csOutExn
) {
    guard Structs.MemberwiseStruct._constructorMethod == nil else { return }
    Structs.MemberwiseStruct._constructorMethod = constructorMethod
    Structs.MemberwiseStruct._immutableGetter = immutableGetter
    Structs.MemberwiseStruct._mutableGetter = mutableGetter
}

extension Structs.MemberwiseStruct: CSharpConverter {
    fileprivate static var _immutableGetter: ((csObject, _ exn: csOutExn) -> Swift.String.CType)!
    fileprivate static var _mutableGetter: ((csObject, _ exn: csOutExn) -> Swift.String.CType)!
    fileprivate typealias _ConstructorMethod = (
        Swift.String.CType,
        Swift.String.CType,
        _ exn: csOutExn
    ) -> csObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func fromCSharp(_ value: csObject) throws -> Self {
        Self(
            immutable: try Swift.String.fromCSharp(
                try Env.check { exn in _immutableGetter(value, exn) }
            ),
            mutable: try Swift.String.fromCSharp(
                try Env.check { exn in _mutableGetter(value, exn) }
            )
        )
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try Swift.String.toCSharp(value.immutable),
                try Swift.String.toCSharp(value.mutable),
                exn
            )
        }
    }
}
