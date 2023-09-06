// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Primitives_PrimitiveHolder_setup")
public func TestAPI_Primitives_PrimitiveHolder_setup(
    constructorMethod: @escaping TestAPI.Primitives.PrimitiveHolder._ConstructorMethod,
    _ bGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Bool.CType,
    _ bSetter: @escaping @convention(c) (csObject, Swift.Bool.CType, _ exn: csOutExn) -> Void,
    _ bqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Bool>.CType,
    _ bqSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Bool>.CType, _ exn: csOutExn) -> Void,
    _ ui8Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt8.CType,
    _ ui8Setter: @escaping @convention(c) (csObject, Swift.UInt8.CType, _ exn: csOutExn) -> Void,
    _ ui8qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt8>.CType,
    _ ui8qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.UInt8>.CType, _ exn: csOutExn) -> Void,
    _ ui16Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt16.CType,
    _ ui16Setter: @escaping @convention(c) (csObject, Swift.UInt16.CType, _ exn: csOutExn) -> Void,
    _ ui16qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt16>.CType,
    _ ui16qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.UInt16>.CType, _ exn: csOutExn) -> Void,
    _ ui32Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt32.CType,
    _ ui32Setter: @escaping @convention(c) (csObject, Swift.UInt32.CType, _ exn: csOutExn) -> Void,
    _ ui32qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt32>.CType,
    _ ui32qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.UInt32>.CType, _ exn: csOutExn) -> Void,
    _ ui64Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt64.CType,
    _ ui64Setter: @escaping @convention(c) (csObject, Swift.UInt64.CType, _ exn: csOutExn) -> Void,
    _ ui64qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt64>.CType,
    _ ui64qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.UInt64>.CType, _ exn: csOutExn) -> Void,
    _ uiGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt.CType,
    _ uiSetter: @escaping @convention(c) (csObject, Swift.UInt.CType, _ exn: csOutExn) -> Void,
    _ uiqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt>.CType,
    _ uiqSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.UInt>.CType, _ exn: csOutExn) -> Void,
    _ i8Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Int8.CType,
    _ i8Setter: @escaping @convention(c) (csObject, Swift.Int8.CType, _ exn: csOutExn) -> Void,
    _ i8qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int8>.CType,
    _ i8qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Int8>.CType, _ exn: csOutExn) -> Void,
    _ i16Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Int16.CType,
    _ i16Setter: @escaping @convention(c) (csObject, Swift.Int16.CType, _ exn: csOutExn) -> Void,
    _ i16qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int16>.CType,
    _ i16qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Int16>.CType, _ exn: csOutExn) -> Void,
    _ i32Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Int32.CType,
    _ i32Setter: @escaping @convention(c) (csObject, Swift.Int32.CType, _ exn: csOutExn) -> Void,
    _ i32qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int32>.CType,
    _ i32qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Int32>.CType, _ exn: csOutExn) -> Void,
    _ i64Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Int64.CType,
    _ i64Setter: @escaping @convention(c) (csObject, Swift.Int64.CType, _ exn: csOutExn) -> Void,
    _ i64qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int64>.CType,
    _ i64qSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Int64>.CType, _ exn: csOutExn) -> Void,
    _ iGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Int.CType,
    _ iSetter: @escaping @convention(c) (csObject, Swift.Int.CType, _ exn: csOutExn) -> Void,
    _ iqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int>.CType,
    _ iqSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Int>.CType, _ exn: csOutExn) -> Void,
    _ fGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Float.CType,
    _ fSetter: @escaping @convention(c) (csObject, Swift.Float.CType, _ exn: csOutExn) -> Void,
    _ fqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Float>.CType,
    _ fqSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Float>.CType, _ exn: csOutExn) -> Void,
    _ dGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Swift.Double.CType,
    _ dSetter: @escaping @convention(c) (csObject, Swift.Double.CType, _ exn: csOutExn) -> Void,
    _ dqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Double>.CType,
    _ dqSetter: @escaping @convention(c) (csObject, OptionalConverter<Swift.Double>.CType, _ exn: csOutExn) -> Void,
    _ exn: csOutExn
) {
    guard TestAPI.Primitives.PrimitiveHolder._constructorMethod == nil else { return }
    TestAPI.Primitives.PrimitiveHolder._constructorMethod = constructorMethod
    TestAPI.Primitives.PrimitiveHolder._bGetter = bGetter
    TestAPI.Primitives.PrimitiveHolder._bSetter = bSetter
    TestAPI.Primitives.PrimitiveHolder._bqGetter = bqGetter
    TestAPI.Primitives.PrimitiveHolder._bqSetter = bqSetter
    TestAPI.Primitives.PrimitiveHolder._ui8Getter = ui8Getter
    TestAPI.Primitives.PrimitiveHolder._ui8Setter = ui8Setter
    TestAPI.Primitives.PrimitiveHolder._ui8qGetter = ui8qGetter
    TestAPI.Primitives.PrimitiveHolder._ui8qSetter = ui8qSetter
    TestAPI.Primitives.PrimitiveHolder._ui16Getter = ui16Getter
    TestAPI.Primitives.PrimitiveHolder._ui16Setter = ui16Setter
    TestAPI.Primitives.PrimitiveHolder._ui16qGetter = ui16qGetter
    TestAPI.Primitives.PrimitiveHolder._ui16qSetter = ui16qSetter
    TestAPI.Primitives.PrimitiveHolder._ui32Getter = ui32Getter
    TestAPI.Primitives.PrimitiveHolder._ui32Setter = ui32Setter
    TestAPI.Primitives.PrimitiveHolder._ui32qGetter = ui32qGetter
    TestAPI.Primitives.PrimitiveHolder._ui32qSetter = ui32qSetter
    TestAPI.Primitives.PrimitiveHolder._ui64Getter = ui64Getter
    TestAPI.Primitives.PrimitiveHolder._ui64Setter = ui64Setter
    TestAPI.Primitives.PrimitiveHolder._ui64qGetter = ui64qGetter
    TestAPI.Primitives.PrimitiveHolder._ui64qSetter = ui64qSetter
    TestAPI.Primitives.PrimitiveHolder._uiGetter = uiGetter
    TestAPI.Primitives.PrimitiveHolder._uiSetter = uiSetter
    TestAPI.Primitives.PrimitiveHolder._uiqGetter = uiqGetter
    TestAPI.Primitives.PrimitiveHolder._uiqSetter = uiqSetter
    TestAPI.Primitives.PrimitiveHolder._i8Getter = i8Getter
    TestAPI.Primitives.PrimitiveHolder._i8Setter = i8Setter
    TestAPI.Primitives.PrimitiveHolder._i8qGetter = i8qGetter
    TestAPI.Primitives.PrimitiveHolder._i8qSetter = i8qSetter
    TestAPI.Primitives.PrimitiveHolder._i16Getter = i16Getter
    TestAPI.Primitives.PrimitiveHolder._i16Setter = i16Setter
    TestAPI.Primitives.PrimitiveHolder._i16qGetter = i16qGetter
    TestAPI.Primitives.PrimitiveHolder._i16qSetter = i16qSetter
    TestAPI.Primitives.PrimitiveHolder._i32Getter = i32Getter
    TestAPI.Primitives.PrimitiveHolder._i32Setter = i32Setter
    TestAPI.Primitives.PrimitiveHolder._i32qGetter = i32qGetter
    TestAPI.Primitives.PrimitiveHolder._i32qSetter = i32qSetter
    TestAPI.Primitives.PrimitiveHolder._i64Getter = i64Getter
    TestAPI.Primitives.PrimitiveHolder._i64Setter = i64Setter
    TestAPI.Primitives.PrimitiveHolder._i64qGetter = i64qGetter
    TestAPI.Primitives.PrimitiveHolder._i64qSetter = i64qSetter
    TestAPI.Primitives.PrimitiveHolder._iGetter = iGetter
    TestAPI.Primitives.PrimitiveHolder._iSetter = iSetter
    TestAPI.Primitives.PrimitiveHolder._iqGetter = iqGetter
    TestAPI.Primitives.PrimitiveHolder._iqSetter = iqSetter
    TestAPI.Primitives.PrimitiveHolder._fGetter = fGetter
    TestAPI.Primitives.PrimitiveHolder._fSetter = fSetter
    TestAPI.Primitives.PrimitiveHolder._fqGetter = fqGetter
    TestAPI.Primitives.PrimitiveHolder._fqSetter = fqSetter
    TestAPI.Primitives.PrimitiveHolder._dGetter = dGetter
    TestAPI.Primitives.PrimitiveHolder._dSetter = dSetter
    TestAPI.Primitives.PrimitiveHolder._dqGetter = dqGetter
    TestAPI.Primitives.PrimitiveHolder._dqSetter = dqSetter
}

extension TestAPI.Primitives.PrimitiveHolder: CSharpMutator {
    fileprivate static var _bGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Bool.CType)!
    fileprivate static var _bSetter: (@convention(c) (csObject, Swift.Bool.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _bqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Bool>.CType)!
    fileprivate static var _bqSetter: (@convention(c) (csObject, OptionalConverter<Swift.Bool>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui8Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt8.CType)!
    fileprivate static var _ui8Setter: (@convention(c) (csObject, Swift.UInt8.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui8qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt8>.CType)!
    fileprivate static var _ui8qSetter: (@convention(c) (csObject, OptionalConverter<Swift.UInt8>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui16Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt16.CType)!
    fileprivate static var _ui16Setter: (@convention(c) (csObject, Swift.UInt16.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui16qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt16>.CType)!
    fileprivate static var _ui16qSetter: (@convention(c) (csObject, OptionalConverter<Swift.UInt16>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui32Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt32.CType)!
    fileprivate static var _ui32Setter: (@convention(c) (csObject, Swift.UInt32.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui32qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt32>.CType)!
    fileprivate static var _ui32qSetter: (@convention(c) (csObject, OptionalConverter<Swift.UInt32>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui64Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt64.CType)!
    fileprivate static var _ui64Setter: (@convention(c) (csObject, Swift.UInt64.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui64qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt64>.CType)!
    fileprivate static var _ui64qSetter: (@convention(c) (csObject, OptionalConverter<Swift.UInt64>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _uiGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.UInt.CType)!
    fileprivate static var _uiSetter: (@convention(c) (csObject, Swift.UInt.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _uiqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.UInt>.CType)!
    fileprivate static var _uiqSetter: (@convention(c) (csObject, OptionalConverter<Swift.UInt>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i8Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Int8.CType)!
    fileprivate static var _i8Setter: (@convention(c) (csObject, Swift.Int8.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i8qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int8>.CType)!
    fileprivate static var _i8qSetter: (@convention(c) (csObject, OptionalConverter<Swift.Int8>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i16Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Int16.CType)!
    fileprivate static var _i16Setter: (@convention(c) (csObject, Swift.Int16.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i16qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int16>.CType)!
    fileprivate static var _i16qSetter: (@convention(c) (csObject, OptionalConverter<Swift.Int16>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i32Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Int32.CType)!
    fileprivate static var _i32Setter: (@convention(c) (csObject, Swift.Int32.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i32qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int32>.CType)!
    fileprivate static var _i32qSetter: (@convention(c) (csObject, OptionalConverter<Swift.Int32>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i64Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Int64.CType)!
    fileprivate static var _i64Setter: (@convention(c) (csObject, Swift.Int64.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i64qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int64>.CType)!
    fileprivate static var _i64qSetter: (@convention(c) (csObject, OptionalConverter<Swift.Int64>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _iGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Int.CType)!
    fileprivate static var _iSetter: (@convention(c) (csObject, Swift.Int.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _iqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Int>.CType)!
    fileprivate static var _iqSetter: (@convention(c) (csObject, OptionalConverter<Swift.Int>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _fGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Float.CType)!
    fileprivate static var _fSetter: (@convention(c) (csObject, Swift.Float.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _fqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Float>.CType)!
    fileprivate static var _fqSetter: (@convention(c) (csObject, OptionalConverter<Swift.Float>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _dGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Swift.Double.CType)!
    fileprivate static var _dSetter: (@convention(c) (csObject, Swift.Double.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _dqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Swift.Double>.CType)!
    fileprivate static var _dqSetter: (@convention(c) (csObject, OptionalConverter<Swift.Double>.CType, _ exn: csOutExn) -> Void)!
    public typealias _ConstructorMethod = @convention(c) (
        Swift.Bool.CType,
        OptionalConverter<Swift.Bool>.CType,
        Swift.UInt8.CType,
        OptionalConverter<Swift.UInt8>.CType,
        Swift.UInt16.CType,
        OptionalConverter<Swift.UInt16>.CType,
        Swift.UInt32.CType,
        OptionalConverter<Swift.UInt32>.CType,
        Swift.UInt64.CType,
        OptionalConverter<Swift.UInt64>.CType,
        Swift.UInt.CType,
        OptionalConverter<Swift.UInt>.CType,
        Swift.Int8.CType,
        OptionalConverter<Swift.Int8>.CType,
        Swift.Int16.CType,
        OptionalConverter<Swift.Int16>.CType,
        Swift.Int32.CType,
        OptionalConverter<Swift.Int32>.CType,
        Swift.Int64.CType,
        OptionalConverter<Swift.Int64>.CType,
        Swift.Int.CType,
        OptionalConverter<Swift.Int>.CType,
        Swift.Float.CType,
        OptionalConverter<Swift.Float>.CType,
        Swift.Double.CType,
        OptionalConverter<Swift.Double>.CType,
        _ exn: csOutExn
    ) -> csObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        Self(
            b: try Swift.Bool.consumeCSharp(
                try Env.check { exn in _bGetter(value, exn) }
            ),
            bq: try OptionalConverter<Swift.Bool>.consumeCSharp(
                try Env.check { exn in _bqGetter(value, exn) }
            ),
            ui8: try Swift.UInt8.consumeCSharp(
                try Env.check { exn in _ui8Getter(value, exn) }
            ),
            ui8q: try OptionalConverter<Swift.UInt8>.consumeCSharp(
                try Env.check { exn in _ui8qGetter(value, exn) }
            ),
            ui16: try Swift.UInt16.consumeCSharp(
                try Env.check { exn in _ui16Getter(value, exn) }
            ),
            ui16q: try OptionalConverter<Swift.UInt16>.consumeCSharp(
                try Env.check { exn in _ui16qGetter(value, exn) }
            ),
            ui32: try Swift.UInt32.consumeCSharp(
                try Env.check { exn in _ui32Getter(value, exn) }
            ),
            ui32q: try OptionalConverter<Swift.UInt32>.consumeCSharp(
                try Env.check { exn in _ui32qGetter(value, exn) }
            ),
            ui64: try Swift.UInt64.consumeCSharp(
                try Env.check { exn in _ui64Getter(value, exn) }
            ),
            ui64q: try OptionalConverter<Swift.UInt64>.consumeCSharp(
                try Env.check { exn in _ui64qGetter(value, exn) }
            ),
            ui: try Swift.UInt.consumeCSharp(
                try Env.check { exn in _uiGetter(value, exn) }
            ),
            uiq: try OptionalConverter<Swift.UInt>.consumeCSharp(
                try Env.check { exn in _uiqGetter(value, exn) }
            ),
            i8: try Swift.Int8.consumeCSharp(
                try Env.check { exn in _i8Getter(value, exn) }
            ),
            i8q: try OptionalConverter<Swift.Int8>.consumeCSharp(
                try Env.check { exn in _i8qGetter(value, exn) }
            ),
            i16: try Swift.Int16.consumeCSharp(
                try Env.check { exn in _i16Getter(value, exn) }
            ),
            i16q: try OptionalConverter<Swift.Int16>.consumeCSharp(
                try Env.check { exn in _i16qGetter(value, exn) }
            ),
            i32: try Swift.Int32.consumeCSharp(
                try Env.check { exn in _i32Getter(value, exn) }
            ),
            i32q: try OptionalConverter<Swift.Int32>.consumeCSharp(
                try Env.check { exn in _i32qGetter(value, exn) }
            ),
            i64: try Swift.Int64.consumeCSharp(
                try Env.check { exn in _i64Getter(value, exn) }
            ),
            i64q: try OptionalConverter<Swift.Int64>.consumeCSharp(
                try Env.check { exn in _i64qGetter(value, exn) }
            ),
            i: try Swift.Int.consumeCSharp(
                try Env.check { exn in _iGetter(value, exn) }
            ),
            iq: try OptionalConverter<Swift.Int>.consumeCSharp(
                try Env.check { exn in _iqGetter(value, exn) }
            ),
            f: try Swift.Float.consumeCSharp(
                try Env.check { exn in _fGetter(value, exn) }
            ),
            fq: try OptionalConverter<Swift.Float>.consumeCSharp(
                try Env.check { exn in _fqGetter(value, exn) }
            ),
            d: try Swift.Double.consumeCSharp(
                try Env.check { exn in _dGetter(value, exn) }
            ),
            dq: try OptionalConverter<Swift.Double>.consumeCSharp(
                try Env.check { exn in _dqGetter(value, exn) }
            )
        )
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try Swift.Bool.toCSharp(value.b),
                try OptionalConverter<Swift.Bool>.toCSharp(value.bq),
                try Swift.UInt8.toCSharp(value.ui8),
                try OptionalConverter<Swift.UInt8>.toCSharp(value.ui8q),
                try Swift.UInt16.toCSharp(value.ui16),
                try OptionalConverter<Swift.UInt16>.toCSharp(value.ui16q),
                try Swift.UInt32.toCSharp(value.ui32),
                try OptionalConverter<Swift.UInt32>.toCSharp(value.ui32q),
                try Swift.UInt64.toCSharp(value.ui64),
                try OptionalConverter<Swift.UInt64>.toCSharp(value.ui64q),
                try Swift.UInt.toCSharp(value.ui),
                try OptionalConverter<Swift.UInt>.toCSharp(value.uiq),
                try Swift.Int8.toCSharp(value.i8),
                try OptionalConverter<Swift.Int8>.toCSharp(value.i8q),
                try Swift.Int16.toCSharp(value.i16),
                try OptionalConverter<Swift.Int16>.toCSharp(value.i16q),
                try Swift.Int32.toCSharp(value.i32),
                try OptionalConverter<Swift.Int32>.toCSharp(value.i32q),
                try Swift.Int64.toCSharp(value.i64),
                try OptionalConverter<Swift.Int64>.toCSharp(value.i64q),
                try Swift.Int.toCSharp(value.i),
                try OptionalConverter<Swift.Int>.toCSharp(value.iq),
                try Swift.Float.toCSharp(value.f),
                try OptionalConverter<Swift.Float>.toCSharp(value.fq),
                try Swift.Double.toCSharp(value.d),
                try OptionalConverter<Swift.Double>.toCSharp(value.dq),
                exn
            )
        }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekCSharp(this)
        let result = try body(&mutatingSelf)
        try Env.check { exn in _bSetter(
            this,
            try Swift.Bool.toCSharp(mutatingSelf.b),
            exn
        )}
        try Env.check { exn in _bqSetter(
            this,
            try OptionalConverter<Swift.Bool>.toCSharp(mutatingSelf.bq),
            exn
        )}
        try Env.check { exn in _ui8Setter(
            this,
            try Swift.UInt8.toCSharp(mutatingSelf.ui8),
            exn
        )}
        try Env.check { exn in _ui8qSetter(
            this,
            try OptionalConverter<Swift.UInt8>.toCSharp(mutatingSelf.ui8q),
            exn
        )}
        try Env.check { exn in _ui16Setter(
            this,
            try Swift.UInt16.toCSharp(mutatingSelf.ui16),
            exn
        )}
        try Env.check { exn in _ui16qSetter(
            this,
            try OptionalConverter<Swift.UInt16>.toCSharp(mutatingSelf.ui16q),
            exn
        )}
        try Env.check { exn in _ui32Setter(
            this,
            try Swift.UInt32.toCSharp(mutatingSelf.ui32),
            exn
        )}
        try Env.check { exn in _ui32qSetter(
            this,
            try OptionalConverter<Swift.UInt32>.toCSharp(mutatingSelf.ui32q),
            exn
        )}
        try Env.check { exn in _ui64Setter(
            this,
            try Swift.UInt64.toCSharp(mutatingSelf.ui64),
            exn
        )}
        try Env.check { exn in _ui64qSetter(
            this,
            try OptionalConverter<Swift.UInt64>.toCSharp(mutatingSelf.ui64q),
            exn
        )}
        try Env.check { exn in _uiSetter(
            this,
            try Swift.UInt.toCSharp(mutatingSelf.ui),
            exn
        )}
        try Env.check { exn in _uiqSetter(
            this,
            try OptionalConverter<Swift.UInt>.toCSharp(mutatingSelf.uiq),
            exn
        )}
        try Env.check { exn in _i8Setter(
            this,
            try Swift.Int8.toCSharp(mutatingSelf.i8),
            exn
        )}
        try Env.check { exn in _i8qSetter(
            this,
            try OptionalConverter<Swift.Int8>.toCSharp(mutatingSelf.i8q),
            exn
        )}
        try Env.check { exn in _i16Setter(
            this,
            try Swift.Int16.toCSharp(mutatingSelf.i16),
            exn
        )}
        try Env.check { exn in _i16qSetter(
            this,
            try OptionalConverter<Swift.Int16>.toCSharp(mutatingSelf.i16q),
            exn
        )}
        try Env.check { exn in _i32Setter(
            this,
            try Swift.Int32.toCSharp(mutatingSelf.i32),
            exn
        )}
        try Env.check { exn in _i32qSetter(
            this,
            try OptionalConverter<Swift.Int32>.toCSharp(mutatingSelf.i32q),
            exn
        )}
        try Env.check { exn in _i64Setter(
            this,
            try Swift.Int64.toCSharp(mutatingSelf.i64),
            exn
        )}
        try Env.check { exn in _i64qSetter(
            this,
            try OptionalConverter<Swift.Int64>.toCSharp(mutatingSelf.i64q),
            exn
        )}
        try Env.check { exn in _iSetter(
            this,
            try Swift.Int.toCSharp(mutatingSelf.i),
            exn
        )}
        try Env.check { exn in _iqSetter(
            this,
            try OptionalConverter<Swift.Int>.toCSharp(mutatingSelf.iq),
            exn
        )}
        try Env.check { exn in _fSetter(
            this,
            try Swift.Float.toCSharp(mutatingSelf.f),
            exn
        )}
        try Env.check { exn in _fqSetter(
            this,
            try OptionalConverter<Swift.Float>.toCSharp(mutatingSelf.fq),
            exn
        )}
        try Env.check { exn in _dSetter(
            this,
            try Swift.Double.toCSharp(mutatingSelf.d),
            exn
        )}
        try Env.check { exn in _dqSetter(
            this,
            try OptionalConverter<Swift.Double>.toCSharp(mutatingSelf.dq),
            exn
        )}
        return result
    }
}
