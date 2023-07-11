// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_MemberwiseStruct_setup")
public func TestAPI_Structs_MemberwiseStruct_setup(
    constructorMethod: @escaping Structs.MemberwiseStruct._ConstructorMethod,
    _ immutableGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ immutableSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ mutableGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ mutableSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    guard Structs.MemberwiseStruct._constructorMethod == nil else { return }
    Structs.MemberwiseStruct._constructorMethod = constructorMethod
    Structs.MemberwiseStruct._immutableGetter = immutableGetter
    Structs.MemberwiseStruct._immutableSetter = immutableSetter
    Structs.MemberwiseStruct._mutableGetter = mutableGetter
    Structs.MemberwiseStruct._mutableSetter = mutableSetter
}

extension Structs.MemberwiseStruct: IotaMutator {
    fileprivate static var _immutableGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType)!
    fileprivate static var _immutableSetter: (@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _mutableGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType)!
    fileprivate static var _mutableSetter: (@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void)!
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func peekIota(_ value: foreignObject) throws -> Self {
        Self(
            immutable: try Swift.String.consumeIota(
                try Env.check { exn in _immutableGetter(value, exn) }
            ),
            mutable: try Swift.String.consumeIota(
                try Env.check { exn in _mutableGetter(value, exn) }
            )
        )
    }

    public static func toIota(_ value: Self) throws -> foreignObject {
        try Env.check { exn in
            _constructorMethod(
                try Swift.String.toIota(value.immutable),
                try Swift.String.toIota(value.mutable),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: foreignObject, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this)
        let result = try body(&mutatingSelf)
        try Env.check { exn in _immutableSetter(
            this,
            try Swift.String.toIota(mutatingSelf.immutable),
            exn
        )}
        try Env.check { exn in _mutableSetter(
            this,
            try Swift.String.toIota(mutatingSelf.mutable),
            exn
        )}
        return result
    }
}
