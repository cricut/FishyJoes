// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("Primitives_PrimitiveHolderSetup")
fileprivate func cSharpSetup(
    constructorMethod: @escaping Primitives.PrimitiveHolder._ConstructorMethod,
    _ bGetter: @escaping (csObject, _ exn: csOutExn) -> Bool.CType,
    _ bqGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<Bool>.CType,
    _ ui8Getter: @escaping (csObject, _ exn: csOutExn) -> UInt8.CType,
    _ ui8qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<UInt8>.CType,
    _ ui16Getter: @escaping (csObject, _ exn: csOutExn) -> UInt16.CType,
    _ ui16qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<UInt16>.CType,
    _ ui32Getter: @escaping (csObject, _ exn: csOutExn) -> UInt32.CType,
    _ ui32qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<UInt32>.CType,
    _ ui64Getter: @escaping (csObject, _ exn: csOutExn) -> UInt64.CType,
    _ ui64qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<UInt64>.CType,
    _ i8Getter: @escaping (csObject, _ exn: csOutExn) -> Int8.CType,
    _ i8qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<Int8>.CType,
    _ i16Getter: @escaping (csObject, _ exn: csOutExn) -> Int16.CType,
    _ i16qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<Int16>.CType,
    _ i32Getter: @escaping (csObject, _ exn: csOutExn) -> Int32.CType,
    _ i32qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<Int32>.CType,
    _ i64Getter: @escaping (csObject, _ exn: csOutExn) -> Int64.CType,
    _ i64qGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<Int64>.CType,
    _ fGetter: @escaping (csObject, _ exn: csOutExn) -> Float.CType,
    _ fqGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<Float>.CType,
    _ dGetter: @escaping (csObject, _ exn: csOutExn) -> Double.CType,
    _ dqGetter: @escaping (csObject, _ exn: csOutExn) -> OptionalConverter<Double>.CType,
    _ exn: csOutExn
) {
    guard Primitives.PrimitiveHolder._constructorMethod == nil else { return }
    Primitives.PrimitiveHolder._constructorMethod = constructorMethod
    Primitives.PrimitiveHolder._bGetter = bGetter
    Primitives.PrimitiveHolder._bqGetter = bqGetter
    Primitives.PrimitiveHolder._ui8Getter = ui8Getter
    Primitives.PrimitiveHolder._ui8qGetter = ui8qGetter
    Primitives.PrimitiveHolder._ui16Getter = ui16Getter
    Primitives.PrimitiveHolder._ui16qGetter = ui16qGetter
    Primitives.PrimitiveHolder._ui32Getter = ui32Getter
    Primitives.PrimitiveHolder._ui32qGetter = ui32qGetter
    Primitives.PrimitiveHolder._ui64Getter = ui64Getter
    Primitives.PrimitiveHolder._ui64qGetter = ui64qGetter
    Primitives.PrimitiveHolder._i8Getter = i8Getter
    Primitives.PrimitiveHolder._i8qGetter = i8qGetter
    Primitives.PrimitiveHolder._i16Getter = i16Getter
    Primitives.PrimitiveHolder._i16qGetter = i16qGetter
    Primitives.PrimitiveHolder._i32Getter = i32Getter
    Primitives.PrimitiveHolder._i32qGetter = i32qGetter
    Primitives.PrimitiveHolder._i64Getter = i64Getter
    Primitives.PrimitiveHolder._i64qGetter = i64qGetter
    Primitives.PrimitiveHolder._fGetter = fGetter
    Primitives.PrimitiveHolder._fqGetter = fqGetter
    Primitives.PrimitiveHolder._dGetter = dGetter
    Primitives.PrimitiveHolder._dqGetter = dqGetter
}

extension Primitives.PrimitiveHolder: CSharpConverter {
    fileprivate static var _bGetter: ((csObject, _ exn: csOutExn) -> Bool.CType)!
    fileprivate static var _bqGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<Bool>.CType)!
    fileprivate static var _ui8Getter: ((csObject, _ exn: csOutExn) -> UInt8.CType)!
    fileprivate static var _ui8qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<UInt8>.CType)!
    fileprivate static var _ui16Getter: ((csObject, _ exn: csOutExn) -> UInt16.CType)!
    fileprivate static var _ui16qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<UInt16>.CType)!
    fileprivate static var _ui32Getter: ((csObject, _ exn: csOutExn) -> UInt32.CType)!
    fileprivate static var _ui32qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<UInt32>.CType)!
    fileprivate static var _ui64Getter: ((csObject, _ exn: csOutExn) -> UInt64.CType)!
    fileprivate static var _ui64qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<UInt64>.CType)!
    fileprivate static var _i8Getter: ((csObject, _ exn: csOutExn) -> Int8.CType)!
    fileprivate static var _i8qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<Int8>.CType)!
    fileprivate static var _i16Getter: ((csObject, _ exn: csOutExn) -> Int16.CType)!
    fileprivate static var _i16qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<Int16>.CType)!
    fileprivate static var _i32Getter: ((csObject, _ exn: csOutExn) -> Int32.CType)!
    fileprivate static var _i32qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<Int32>.CType)!
    fileprivate static var _i64Getter: ((csObject, _ exn: csOutExn) -> Int64.CType)!
    fileprivate static var _i64qGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<Int64>.CType)!
    fileprivate static var _fGetter: ((csObject, _ exn: csOutExn) -> Float.CType)!
    fileprivate static var _fqGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<Float>.CType)!
    fileprivate static var _dGetter: ((csObject, _ exn: csOutExn) -> Double.CType)!
    fileprivate static var _dqGetter: ((csObject, _ exn: csOutExn) -> OptionalConverter<Double>.CType)!
    fileprivate typealias _ConstructorMethod = (
        Bool.CType,
        OptionalConverter<Bool>.CType,
        UInt8.CType,
        OptionalConverter<UInt8>.CType,
        UInt16.CType,
        OptionalConverter<UInt16>.CType,
        UInt32.CType,
        OptionalConverter<UInt32>.CType,
        UInt64.CType,
        OptionalConverter<UInt64>.CType,
        Int8.CType,
        OptionalConverter<Int8>.CType,
        Int16.CType,
        OptionalConverter<Int16>.CType,
        Int32.CType,
        OptionalConverter<Int32>.CType,
        Int64.CType,
        OptionalConverter<Int64>.CType,
        Float.CType,
        OptionalConverter<Float>.CType,
        Double.CType,
        OptionalConverter<Double>.CType,
        _ exn: csOutExn
    ) -> csObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func fromCSharp(_ value: csObject) throws -> Self {
        Self(
            b: try Bool.fromCSharp(
                try Env.check { exn in _bGetter(value, exn) }
            ),
            bq: try OptionalConverter<Bool>.fromCSharp(
                try Env.check { exn in _bqGetter(value, exn) }
            ),
            ui8: try UInt8.fromCSharp(
                try Env.check { exn in _ui8Getter(value, exn) }
            ),
            ui8q: try OptionalConverter<UInt8>.fromCSharp(
                try Env.check { exn in _ui8qGetter(value, exn) }
            ),
            ui16: try UInt16.fromCSharp(
                try Env.check { exn in _ui16Getter(value, exn) }
            ),
            ui16q: try OptionalConverter<UInt16>.fromCSharp(
                try Env.check { exn in _ui16qGetter(value, exn) }
            ),
            ui32: try UInt32.fromCSharp(
                try Env.check { exn in _ui32Getter(value, exn) }
            ),
            ui32q: try OptionalConverter<UInt32>.fromCSharp(
                try Env.check { exn in _ui32qGetter(value, exn) }
            ),
            ui64: try UInt64.fromCSharp(
                try Env.check { exn in _ui64Getter(value, exn) }
            ),
            ui64q: try OptionalConverter<UInt64>.fromCSharp(
                try Env.check { exn in _ui64qGetter(value, exn) }
            ),
            i8: try Int8.fromCSharp(
                try Env.check { exn in _i8Getter(value, exn) }
            ),
            i8q: try OptionalConverter<Int8>.fromCSharp(
                try Env.check { exn in _i8qGetter(value, exn) }
            ),
            i16: try Int16.fromCSharp(
                try Env.check { exn in _i16Getter(value, exn) }
            ),
            i16q: try OptionalConverter<Int16>.fromCSharp(
                try Env.check { exn in _i16qGetter(value, exn) }
            ),
            i32: try Int32.fromCSharp(
                try Env.check { exn in _i32Getter(value, exn) }
            ),
            i32q: try OptionalConverter<Int32>.fromCSharp(
                try Env.check { exn in _i32qGetter(value, exn) }
            ),
            i64: try Int64.fromCSharp(
                try Env.check { exn in _i64Getter(value, exn) }
            ),
            i64q: try OptionalConverter<Int64>.fromCSharp(
                try Env.check { exn in _i64qGetter(value, exn) }
            ),
            f: try Float.fromCSharp(
                try Env.check { exn in _fGetter(value, exn) }
            ),
            fq: try OptionalConverter<Float>.fromCSharp(
                try Env.check { exn in _fqGetter(value, exn) }
            ),
            d: try Double.fromCSharp(
                try Env.check { exn in _dGetter(value, exn) }
            ),
            dq: try OptionalConverter<Double>.fromCSharp(
                try Env.check { exn in _dqGetter(value, exn) }
            )
        )
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try Bool.toCSharp(value.b),
                try OptionalConverter<Bool>.toCSharp(value.bq),
                try UInt8.toCSharp(value.ui8),
                try OptionalConverter<UInt8>.toCSharp(value.ui8q),
                try UInt16.toCSharp(value.ui16),
                try OptionalConverter<UInt16>.toCSharp(value.ui16q),
                try UInt32.toCSharp(value.ui32),
                try OptionalConverter<UInt32>.toCSharp(value.ui32q),
                try UInt64.toCSharp(value.ui64),
                try OptionalConverter<UInt64>.toCSharp(value.ui64q),
                try Int8.toCSharp(value.i8),
                try OptionalConverter<Int8>.toCSharp(value.i8q),
                try Int16.toCSharp(value.i16),
                try OptionalConverter<Int16>.toCSharp(value.i16q),
                try Int32.toCSharp(value.i32),
                try OptionalConverter<Int32>.toCSharp(value.i32q),
                try Int64.toCSharp(value.i64),
                try OptionalConverter<Int64>.toCSharp(value.i64q),
                try Float.toCSharp(value.f),
                try OptionalConverter<Float>.toCSharp(value.fq),
                try Double.toCSharp(value.d),
                try OptionalConverter<Double>.toCSharp(value.dq),
                exn
            )
        }
    }
}
