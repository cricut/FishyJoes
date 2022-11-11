// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Primitives_PrimitiveHolder_setup")
public func TestAPI_Primitives_PrimitiveHolder_setup(
    constructorMethod: @escaping Primitives.PrimitiveHolder._ConstructorMethod,
    _ bGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Bool.CType,
    _ bSetter: @escaping @convention(c) (csObject, Bool.CType, _ exn: csOutExn) -> Void,
    _ bqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Bool>.CType,
    _ bqSetter: @escaping @convention(c) (csObject, OptionalConverter<Bool>.CType, _ exn: csOutExn) -> Void,
    _ ui8Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> UInt8.CType,
    _ ui8Setter: @escaping @convention(c) (csObject, UInt8.CType, _ exn: csOutExn) -> Void,
    _ ui8qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt8>.CType,
    _ ui8qSetter: @escaping @convention(c) (csObject, OptionalConverter<UInt8>.CType, _ exn: csOutExn) -> Void,
    _ ui16Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> UInt16.CType,
    _ ui16Setter: @escaping @convention(c) (csObject, UInt16.CType, _ exn: csOutExn) -> Void,
    _ ui16qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt16>.CType,
    _ ui16qSetter: @escaping @convention(c) (csObject, OptionalConverter<UInt16>.CType, _ exn: csOutExn) -> Void,
    _ ui32Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> UInt32.CType,
    _ ui32Setter: @escaping @convention(c) (csObject, UInt32.CType, _ exn: csOutExn) -> Void,
    _ ui32qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt32>.CType,
    _ ui32qSetter: @escaping @convention(c) (csObject, OptionalConverter<UInt32>.CType, _ exn: csOutExn) -> Void,
    _ ui64Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> UInt64.CType,
    _ ui64Setter: @escaping @convention(c) (csObject, UInt64.CType, _ exn: csOutExn) -> Void,
    _ ui64qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt64>.CType,
    _ ui64qSetter: @escaping @convention(c) (csObject, OptionalConverter<UInt64>.CType, _ exn: csOutExn) -> Void,
    _ i8Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Int8.CType,
    _ i8Setter: @escaping @convention(c) (csObject, Int8.CType, _ exn: csOutExn) -> Void,
    _ i8qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int8>.CType,
    _ i8qSetter: @escaping @convention(c) (csObject, OptionalConverter<Int8>.CType, _ exn: csOutExn) -> Void,
    _ i16Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Int16.CType,
    _ i16Setter: @escaping @convention(c) (csObject, Int16.CType, _ exn: csOutExn) -> Void,
    _ i16qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int16>.CType,
    _ i16qSetter: @escaping @convention(c) (csObject, OptionalConverter<Int16>.CType, _ exn: csOutExn) -> Void,
    _ i32Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Int32.CType,
    _ i32Setter: @escaping @convention(c) (csObject, Int32.CType, _ exn: csOutExn) -> Void,
    _ i32qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int32>.CType,
    _ i32qSetter: @escaping @convention(c) (csObject, OptionalConverter<Int32>.CType, _ exn: csOutExn) -> Void,
    _ i64Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Int64.CType,
    _ i64Setter: @escaping @convention(c) (csObject, Int64.CType, _ exn: csOutExn) -> Void,
    _ i64qGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int64>.CType,
    _ i64qSetter: @escaping @convention(c) (csObject, OptionalConverter<Int64>.CType, _ exn: csOutExn) -> Void,
    _ fGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Float.CType,
    _ fSetter: @escaping @convention(c) (csObject, Float.CType, _ exn: csOutExn) -> Void,
    _ fqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Float>.CType,
    _ fqSetter: @escaping @convention(c) (csObject, OptionalConverter<Float>.CType, _ exn: csOutExn) -> Void,
    _ dGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> Double.CType,
    _ dSetter: @escaping @convention(c) (csObject, Double.CType, _ exn: csOutExn) -> Void,
    _ dqGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Double>.CType,
    _ dqSetter: @escaping @convention(c) (csObject, OptionalConverter<Double>.CType, _ exn: csOutExn) -> Void,
    _ exn: csOutExn
) {
    guard Primitives.PrimitiveHolder._constructorMethod == nil else { return }
    Primitives.PrimitiveHolder._constructorMethod = constructorMethod
    Primitives.PrimitiveHolder._bGetter = bGetter
    Primitives.PrimitiveHolder._bSetter = bSetter
    Primitives.PrimitiveHolder._bqGetter = bqGetter
    Primitives.PrimitiveHolder._bqSetter = bqSetter
    Primitives.PrimitiveHolder._ui8Getter = ui8Getter
    Primitives.PrimitiveHolder._ui8Setter = ui8Setter
    Primitives.PrimitiveHolder._ui8qGetter = ui8qGetter
    Primitives.PrimitiveHolder._ui8qSetter = ui8qSetter
    Primitives.PrimitiveHolder._ui16Getter = ui16Getter
    Primitives.PrimitiveHolder._ui16Setter = ui16Setter
    Primitives.PrimitiveHolder._ui16qGetter = ui16qGetter
    Primitives.PrimitiveHolder._ui16qSetter = ui16qSetter
    Primitives.PrimitiveHolder._ui32Getter = ui32Getter
    Primitives.PrimitiveHolder._ui32Setter = ui32Setter
    Primitives.PrimitiveHolder._ui32qGetter = ui32qGetter
    Primitives.PrimitiveHolder._ui32qSetter = ui32qSetter
    Primitives.PrimitiveHolder._ui64Getter = ui64Getter
    Primitives.PrimitiveHolder._ui64Setter = ui64Setter
    Primitives.PrimitiveHolder._ui64qGetter = ui64qGetter
    Primitives.PrimitiveHolder._ui64qSetter = ui64qSetter
    Primitives.PrimitiveHolder._i8Getter = i8Getter
    Primitives.PrimitiveHolder._i8Setter = i8Setter
    Primitives.PrimitiveHolder._i8qGetter = i8qGetter
    Primitives.PrimitiveHolder._i8qSetter = i8qSetter
    Primitives.PrimitiveHolder._i16Getter = i16Getter
    Primitives.PrimitiveHolder._i16Setter = i16Setter
    Primitives.PrimitiveHolder._i16qGetter = i16qGetter
    Primitives.PrimitiveHolder._i16qSetter = i16qSetter
    Primitives.PrimitiveHolder._i32Getter = i32Getter
    Primitives.PrimitiveHolder._i32Setter = i32Setter
    Primitives.PrimitiveHolder._i32qGetter = i32qGetter
    Primitives.PrimitiveHolder._i32qSetter = i32qSetter
    Primitives.PrimitiveHolder._i64Getter = i64Getter
    Primitives.PrimitiveHolder._i64Setter = i64Setter
    Primitives.PrimitiveHolder._i64qGetter = i64qGetter
    Primitives.PrimitiveHolder._i64qSetter = i64qSetter
    Primitives.PrimitiveHolder._fGetter = fGetter
    Primitives.PrimitiveHolder._fSetter = fSetter
    Primitives.PrimitiveHolder._fqGetter = fqGetter
    Primitives.PrimitiveHolder._fqSetter = fqSetter
    Primitives.PrimitiveHolder._dGetter = dGetter
    Primitives.PrimitiveHolder._dSetter = dSetter
    Primitives.PrimitiveHolder._dqGetter = dqGetter
    Primitives.PrimitiveHolder._dqSetter = dqSetter
}

extension Primitives.PrimitiveHolder: IotaMutator {
    fileprivate static var _bGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Bool.CType)!
    fileprivate static var _bSetter: (@convention(c) (csObject, Bool.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _bqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Bool>.CType)!
    fileprivate static var _bqSetter: (@convention(c) (csObject, OptionalConverter<Bool>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui8Getter: (@convention(c) (csObject, _ exn: csOutExn) -> UInt8.CType)!
    fileprivate static var _ui8Setter: (@convention(c) (csObject, UInt8.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui8qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt8>.CType)!
    fileprivate static var _ui8qSetter: (@convention(c) (csObject, OptionalConverter<UInt8>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui16Getter: (@convention(c) (csObject, _ exn: csOutExn) -> UInt16.CType)!
    fileprivate static var _ui16Setter: (@convention(c) (csObject, UInt16.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui16qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt16>.CType)!
    fileprivate static var _ui16qSetter: (@convention(c) (csObject, OptionalConverter<UInt16>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui32Getter: (@convention(c) (csObject, _ exn: csOutExn) -> UInt32.CType)!
    fileprivate static var _ui32Setter: (@convention(c) (csObject, UInt32.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui32qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt32>.CType)!
    fileprivate static var _ui32qSetter: (@convention(c) (csObject, OptionalConverter<UInt32>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui64Getter: (@convention(c) (csObject, _ exn: csOutExn) -> UInt64.CType)!
    fileprivate static var _ui64Setter: (@convention(c) (csObject, UInt64.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _ui64qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<UInt64>.CType)!
    fileprivate static var _ui64qSetter: (@convention(c) (csObject, OptionalConverter<UInt64>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i8Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Int8.CType)!
    fileprivate static var _i8Setter: (@convention(c) (csObject, Int8.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i8qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int8>.CType)!
    fileprivate static var _i8qSetter: (@convention(c) (csObject, OptionalConverter<Int8>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i16Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Int16.CType)!
    fileprivate static var _i16Setter: (@convention(c) (csObject, Int16.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i16qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int16>.CType)!
    fileprivate static var _i16qSetter: (@convention(c) (csObject, OptionalConverter<Int16>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i32Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Int32.CType)!
    fileprivate static var _i32Setter: (@convention(c) (csObject, Int32.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i32qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int32>.CType)!
    fileprivate static var _i32qSetter: (@convention(c) (csObject, OptionalConverter<Int32>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i64Getter: (@convention(c) (csObject, _ exn: csOutExn) -> Int64.CType)!
    fileprivate static var _i64Setter: (@convention(c) (csObject, Int64.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _i64qGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Int64>.CType)!
    fileprivate static var _i64qSetter: (@convention(c) (csObject, OptionalConverter<Int64>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _fGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Float.CType)!
    fileprivate static var _fSetter: (@convention(c) (csObject, Float.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _fqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Float>.CType)!
    fileprivate static var _fqSetter: (@convention(c) (csObject, OptionalConverter<Float>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _dGetter: (@convention(c) (csObject, _ exn: csOutExn) -> Double.CType)!
    fileprivate static var _dSetter: (@convention(c) (csObject, Double.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _dqGetter: (@convention(c) (csObject, _ exn: csOutExn) -> OptionalConverter<Double>.CType)!
    fileprivate static var _dqSetter: (@convention(c) (csObject, OptionalConverter<Double>.CType, _ exn: csOutExn) -> Void)!
    public typealias _ConstructorMethod = @convention(c) (
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

    public static func peekIota(_ value: csObject) throws -> Self {
        Self(
            b: try Bool.consumeIota(
                try Env.check { exn in _bGetter(value, exn) }
            ),
            bq: try OptionalConverter<Bool>.consumeIota(
                try Env.check { exn in _bqGetter(value, exn) }
            ),
            ui8: try UInt8.consumeIota(
                try Env.check { exn in _ui8Getter(value, exn) }
            ),
            ui8q: try OptionalConverter<UInt8>.consumeIota(
                try Env.check { exn in _ui8qGetter(value, exn) }
            ),
            ui16: try UInt16.consumeIota(
                try Env.check { exn in _ui16Getter(value, exn) }
            ),
            ui16q: try OptionalConverter<UInt16>.consumeIota(
                try Env.check { exn in _ui16qGetter(value, exn) }
            ),
            ui32: try UInt32.consumeIota(
                try Env.check { exn in _ui32Getter(value, exn) }
            ),
            ui32q: try OptionalConverter<UInt32>.consumeIota(
                try Env.check { exn in _ui32qGetter(value, exn) }
            ),
            ui64: try UInt64.consumeIota(
                try Env.check { exn in _ui64Getter(value, exn) }
            ),
            ui64q: try OptionalConverter<UInt64>.consumeIota(
                try Env.check { exn in _ui64qGetter(value, exn) }
            ),
            i8: try Int8.consumeIota(
                try Env.check { exn in _i8Getter(value, exn) }
            ),
            i8q: try OptionalConverter<Int8>.consumeIota(
                try Env.check { exn in _i8qGetter(value, exn) }
            ),
            i16: try Int16.consumeIota(
                try Env.check { exn in _i16Getter(value, exn) }
            ),
            i16q: try OptionalConverter<Int16>.consumeIota(
                try Env.check { exn in _i16qGetter(value, exn) }
            ),
            i32: try Int32.consumeIota(
                try Env.check { exn in _i32Getter(value, exn) }
            ),
            i32q: try OptionalConverter<Int32>.consumeIota(
                try Env.check { exn in _i32qGetter(value, exn) }
            ),
            i64: try Int64.consumeIota(
                try Env.check { exn in _i64Getter(value, exn) }
            ),
            i64q: try OptionalConverter<Int64>.consumeIota(
                try Env.check { exn in _i64qGetter(value, exn) }
            ),
            f: try Float.consumeIota(
                try Env.check { exn in _fGetter(value, exn) }
            ),
            fq: try OptionalConverter<Float>.consumeIota(
                try Env.check { exn in _fqGetter(value, exn) }
            ),
            d: try Double.consumeIota(
                try Env.check { exn in _dGetter(value, exn) }
            ),
            dq: try OptionalConverter<Double>.consumeIota(
                try Env.check { exn in _dqGetter(value, exn) }
            )
        )
    }

    public static func toIota(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try Bool.toIota(value.b),
                try OptionalConverter<Bool>.toIota(value.bq),
                try UInt8.toIota(value.ui8),
                try OptionalConverter<UInt8>.toIota(value.ui8q),
                try UInt16.toIota(value.ui16),
                try OptionalConverter<UInt16>.toIota(value.ui16q),
                try UInt32.toIota(value.ui32),
                try OptionalConverter<UInt32>.toIota(value.ui32q),
                try UInt64.toIota(value.ui64),
                try OptionalConverter<UInt64>.toIota(value.ui64q),
                try Int8.toIota(value.i8),
                try OptionalConverter<Int8>.toIota(value.i8q),
                try Int16.toIota(value.i16),
                try OptionalConverter<Int16>.toIota(value.i16q),
                try Int32.toIota(value.i32),
                try OptionalConverter<Int32>.toIota(value.i32q),
                try Int64.toIota(value.i64),
                try OptionalConverter<Int64>.toIota(value.i64q),
                try Float.toIota(value.f),
                try OptionalConverter<Float>.toIota(value.fq),
                try Double.toIota(value.d),
                try OptionalConverter<Double>.toIota(value.dq),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this)
        let result = try body(&mutatingSelf)
        try Env.check { exn in _bSetter(
            this,
            try Bool.toIota(mutatingSelf.b),
            exn
        )}
        try Env.check { exn in _bqSetter(
            this,
            try OptionalConverter<Bool>.toIota(mutatingSelf.bq),
            exn
        )}
        try Env.check { exn in _ui8Setter(
            this,
            try UInt8.toIota(mutatingSelf.ui8),
            exn
        )}
        try Env.check { exn in _ui8qSetter(
            this,
            try OptionalConverter<UInt8>.toIota(mutatingSelf.ui8q),
            exn
        )}
        try Env.check { exn in _ui16Setter(
            this,
            try UInt16.toIota(mutatingSelf.ui16),
            exn
        )}
        try Env.check { exn in _ui16qSetter(
            this,
            try OptionalConverter<UInt16>.toIota(mutatingSelf.ui16q),
            exn
        )}
        try Env.check { exn in _ui32Setter(
            this,
            try UInt32.toIota(mutatingSelf.ui32),
            exn
        )}
        try Env.check { exn in _ui32qSetter(
            this,
            try OptionalConverter<UInt32>.toIota(mutatingSelf.ui32q),
            exn
        )}
        try Env.check { exn in _ui64Setter(
            this,
            try UInt64.toIota(mutatingSelf.ui64),
            exn
        )}
        try Env.check { exn in _ui64qSetter(
            this,
            try OptionalConverter<UInt64>.toIota(mutatingSelf.ui64q),
            exn
        )}
        try Env.check { exn in _i8Setter(
            this,
            try Int8.toIota(mutatingSelf.i8),
            exn
        )}
        try Env.check { exn in _i8qSetter(
            this,
            try OptionalConverter<Int8>.toIota(mutatingSelf.i8q),
            exn
        )}
        try Env.check { exn in _i16Setter(
            this,
            try Int16.toIota(mutatingSelf.i16),
            exn
        )}
        try Env.check { exn in _i16qSetter(
            this,
            try OptionalConverter<Int16>.toIota(mutatingSelf.i16q),
            exn
        )}
        try Env.check { exn in _i32Setter(
            this,
            try Int32.toIota(mutatingSelf.i32),
            exn
        )}
        try Env.check { exn in _i32qSetter(
            this,
            try OptionalConverter<Int32>.toIota(mutatingSelf.i32q),
            exn
        )}
        try Env.check { exn in _i64Setter(
            this,
            try Int64.toIota(mutatingSelf.i64),
            exn
        )}
        try Env.check { exn in _i64qSetter(
            this,
            try OptionalConverter<Int64>.toIota(mutatingSelf.i64q),
            exn
        )}
        try Env.check { exn in _fSetter(
            this,
            try Float.toIota(mutatingSelf.f),
            exn
        )}
        try Env.check { exn in _fqSetter(
            this,
            try OptionalConverter<Float>.toIota(mutatingSelf.fq),
            exn
        )}
        try Env.check { exn in _dSetter(
            this,
            try Double.toIota(mutatingSelf.d),
            exn
        )}
        try Env.check { exn in _dqSetter(
            this,
            try OptionalConverter<Double>.toIota(mutatingSelf.dq),
            exn
        )}
        return result
    }
}
