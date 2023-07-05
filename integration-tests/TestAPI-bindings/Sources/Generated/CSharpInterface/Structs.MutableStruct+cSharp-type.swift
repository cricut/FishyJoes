// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_MutableStruct_setup")
public func TestAPI_Structs_MutableStruct_setup(
    constructorMethod: @escaping Structs.MutableStruct._ConstructorMethod,
    _ iGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Int.CType,
    _ iSetter: @escaping @convention(c) (csObject, Int.CType, _ exn: csOutExn) -> Void,
    _ exn: csOutExn
) {
    guard Structs.MutableStruct._constructorMethod == nil else { return }
    Structs.MutableStruct._constructorMethod = constructorMethod
    Structs.MutableStruct._iGetter = iGetter
    Structs.MutableStruct._iSetter = iSetter
}

extension Structs.MutableStruct: CSharpMutator {
    fileprivate static var _iGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Int.CType)!
    fileprivate static var _iSetter: (@convention(c) (csObject, Int.CType, _ exn: csOutExn) -> Void)!
    public typealias _ConstructorMethod = @convention(c) (
        Int.CType,
        _ exn: csOutExn
    ) -> csObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        Self(
            i: try Int.consumeCSharp(
                try Env.check { exn in _iGetter(value, exn) }
            )
        )
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try Int.toCSharp(value.i),
                exn
            )
        }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekCSharp(this)
        let result = try body(&mutatingSelf)
        try Env.check { exn in _iSetter(
            this,
            try Int.toCSharp(mutatingSelf.i),
            exn
        )}
        return result
    }
}
