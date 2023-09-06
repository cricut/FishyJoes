// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Primitives_PrimitiveHolder_setup")
public func TestAPI_Primitives_PrimitiveHolder_setup(
    envRef: EnvRef,
    constructorMethod: @escaping Primitives.PrimitiveHolder._ConstructorMethod,
    _ bGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Bool.CType,
    _ bSetter: @escaping @convention(c) (foreignObject, Bool.CType, _ exn: foreignOutExn) -> Void,
    _ bqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Bool>.CType,
    _ bqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ ui8Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt8.CType,
    _ ui8Setter: @escaping @convention(c) (foreignObject, UInt8.CType, _ exn: foreignOutExn) -> Void,
    _ ui8qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt8>.CType,
    _ ui8qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<UInt8>.CType, _ exn: foreignOutExn) -> Void,
    _ ui16Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt16.CType,
    _ ui16Setter: @escaping @convention(c) (foreignObject, UInt16.CType, _ exn: foreignOutExn) -> Void,
    _ ui16qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt16>.CType,
    _ ui16qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<UInt16>.CType, _ exn: foreignOutExn) -> Void,
    _ ui32Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt32.CType,
    _ ui32Setter: @escaping @convention(c) (foreignObject, UInt32.CType, _ exn: foreignOutExn) -> Void,
    _ ui32qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt32>.CType,
    _ ui32qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<UInt32>.CType, _ exn: foreignOutExn) -> Void,
    _ ui64Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt64.CType,
    _ ui64Setter: @escaping @convention(c) (foreignObject, UInt64.CType, _ exn: foreignOutExn) -> Void,
    _ ui64qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt64>.CType,
    _ ui64qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<UInt64>.CType, _ exn: foreignOutExn) -> Void,
    _ i8Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Int8.CType,
    _ i8Setter: @escaping @convention(c) (foreignObject, Int8.CType, _ exn: foreignOutExn) -> Void,
    _ i8qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int8>.CType,
    _ i8qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Int8>.CType, _ exn: foreignOutExn) -> Void,
    _ i16Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Int16.CType,
    _ i16Setter: @escaping @convention(c) (foreignObject, Int16.CType, _ exn: foreignOutExn) -> Void,
    _ i16qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int16>.CType,
    _ i16qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Int16>.CType, _ exn: foreignOutExn) -> Void,
    _ i32Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Int32.CType,
    _ i32Setter: @escaping @convention(c) (foreignObject, Int32.CType, _ exn: foreignOutExn) -> Void,
    _ i32qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int32>.CType,
    _ i32qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Int32>.CType, _ exn: foreignOutExn) -> Void,
    _ i64Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Int64.CType,
    _ i64Setter: @escaping @convention(c) (foreignObject, Int64.CType, _ exn: foreignOutExn) -> Void,
    _ i64qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int64>.CType,
    _ i64qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Int64>.CType, _ exn: foreignOutExn) -> Void,
    _ fGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Float.CType,
    _ fSetter: @escaping @convention(c) (foreignObject, Float.CType, _ exn: foreignOutExn) -> Void,
    _ fqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Float>.CType,
    _ fqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Float>.CType, _ exn: foreignOutExn) -> Void,
    _ dGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Double.CType,
    _ dSetter: @escaping @convention(c) (foreignObject, Double.CType, _ exn: foreignOutExn) -> Void,
    _ dqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Double>.CType,
    _ dqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Double>.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if Primitives.PrimitiveHolder._constructorMethod.isInitialized(env) { return }
    Primitives.PrimitiveHolder._constructorMethod[env] = constructorMethod
    Primitives.PrimitiveHolder._bGetter[env] = bGetter
    Primitives.PrimitiveHolder._bSetter[env] = bSetter
    Primitives.PrimitiveHolder._bqGetter[env] = bqGetter
    Primitives.PrimitiveHolder._bqSetter[env] = bqSetter
    Primitives.PrimitiveHolder._ui8Getter[env] = ui8Getter
    Primitives.PrimitiveHolder._ui8Setter[env] = ui8Setter
    Primitives.PrimitiveHolder._ui8qGetter[env] = ui8qGetter
    Primitives.PrimitiveHolder._ui8qSetter[env] = ui8qSetter
    Primitives.PrimitiveHolder._ui16Getter[env] = ui16Getter
    Primitives.PrimitiveHolder._ui16Setter[env] = ui16Setter
    Primitives.PrimitiveHolder._ui16qGetter[env] = ui16qGetter
    Primitives.PrimitiveHolder._ui16qSetter[env] = ui16qSetter
    Primitives.PrimitiveHolder._ui32Getter[env] = ui32Getter
    Primitives.PrimitiveHolder._ui32Setter[env] = ui32Setter
    Primitives.PrimitiveHolder._ui32qGetter[env] = ui32qGetter
    Primitives.PrimitiveHolder._ui32qSetter[env] = ui32qSetter
    Primitives.PrimitiveHolder._ui64Getter[env] = ui64Getter
    Primitives.PrimitiveHolder._ui64Setter[env] = ui64Setter
    Primitives.PrimitiveHolder._ui64qGetter[env] = ui64qGetter
    Primitives.PrimitiveHolder._ui64qSetter[env] = ui64qSetter
    Primitives.PrimitiveHolder._i8Getter[env] = i8Getter
    Primitives.PrimitiveHolder._i8Setter[env] = i8Setter
    Primitives.PrimitiveHolder._i8qGetter[env] = i8qGetter
    Primitives.PrimitiveHolder._i8qSetter[env] = i8qSetter
    Primitives.PrimitiveHolder._i16Getter[env] = i16Getter
    Primitives.PrimitiveHolder._i16Setter[env] = i16Setter
    Primitives.PrimitiveHolder._i16qGetter[env] = i16qGetter
    Primitives.PrimitiveHolder._i16qSetter[env] = i16qSetter
    Primitives.PrimitiveHolder._i32Getter[env] = i32Getter
    Primitives.PrimitiveHolder._i32Setter[env] = i32Setter
    Primitives.PrimitiveHolder._i32qGetter[env] = i32qGetter
    Primitives.PrimitiveHolder._i32qSetter[env] = i32qSetter
    Primitives.PrimitiveHolder._i64Getter[env] = i64Getter
    Primitives.PrimitiveHolder._i64Setter[env] = i64Setter
    Primitives.PrimitiveHolder._i64qGetter[env] = i64qGetter
    Primitives.PrimitiveHolder._i64qSetter[env] = i64qSetter
    Primitives.PrimitiveHolder._fGetter[env] = fGetter
    Primitives.PrimitiveHolder._fSetter[env] = fSetter
    Primitives.PrimitiveHolder._fqGetter[env] = fqGetter
    Primitives.PrimitiveHolder._fqSetter[env] = fqSetter
    Primitives.PrimitiveHolder._dGetter[env] = dGetter
    Primitives.PrimitiveHolder._dSetter[env] = dSetter
    Primitives.PrimitiveHolder._dqGetter[env] = dqGetter
    Primitives.PrimitiveHolder._dqSetter[env] = dqSetter
}

extension Primitives.PrimitiveHolder: IotaMutator {
    fileprivate static let _bGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Bool.CType>()
    fileprivate static let _bSetter = Env.CallbackMap<@convention(c) (foreignObject, Bool.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _bqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Bool>.CType>()
    fileprivate static let _bqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui8Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt8.CType>()
    fileprivate static let _ui8Setter = Env.CallbackMap<@convention(c) (foreignObject, UInt8.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui8qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt8>.CType>()
    fileprivate static let _ui8qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<UInt8>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui16Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt16.CType>()
    fileprivate static let _ui16Setter = Env.CallbackMap<@convention(c) (foreignObject, UInt16.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui16qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt16>.CType>()
    fileprivate static let _ui16qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<UInt16>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui32Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt32.CType>()
    fileprivate static let _ui32Setter = Env.CallbackMap<@convention(c) (foreignObject, UInt32.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui32qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt32>.CType>()
    fileprivate static let _ui32qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<UInt32>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui64Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> UInt64.CType>()
    fileprivate static let _ui64Setter = Env.CallbackMap<@convention(c) (foreignObject, UInt64.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui64qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<UInt64>.CType>()
    fileprivate static let _ui64qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<UInt64>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i8Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Int8.CType>()
    fileprivate static let _i8Setter = Env.CallbackMap<@convention(c) (foreignObject, Int8.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i8qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int8>.CType>()
    fileprivate static let _i8qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Int8>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i16Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Int16.CType>()
    fileprivate static let _i16Setter = Env.CallbackMap<@convention(c) (foreignObject, Int16.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i16qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int16>.CType>()
    fileprivate static let _i16qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Int16>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i32Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Int32.CType>()
    fileprivate static let _i32Setter = Env.CallbackMap<@convention(c) (foreignObject, Int32.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i32qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int32>.CType>()
    fileprivate static let _i32qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Int32>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i64Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Int64.CType>()
    fileprivate static let _i64Setter = Env.CallbackMap<@convention(c) (foreignObject, Int64.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i64qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Int64>.CType>()
    fileprivate static let _i64qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Int64>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _fGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Float.CType>()
    fileprivate static let _fSetter = Env.CallbackMap<@convention(c) (foreignObject, Float.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _fqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Float>.CType>()
    fileprivate static let _fqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Float>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _dGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Double.CType>()
    fileprivate static let _dSetter = Env.CallbackMap<@convention(c) (foreignObject, Double.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _dqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Double>.CType>()
    fileprivate static let _dqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Double>.CType, _ exn: foreignOutExn) -> Void>()
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
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            b: try Bool.consumeIota(
                try env.check { exn in _bGetter[env](value, exn) },
                env: env
            ),
            bq: try OptionalConverter<Bool>.consumeIota(
                try env.check { exn in _bqGetter[env](value, exn) },
                env: env
            ),
            ui8: try UInt8.consumeIota(
                try env.check { exn in _ui8Getter[env](value, exn) },
                env: env
            ),
            ui8q: try OptionalConverter<UInt8>.consumeIota(
                try env.check { exn in _ui8qGetter[env](value, exn) },
                env: env
            ),
            ui16: try UInt16.consumeIota(
                try env.check { exn in _ui16Getter[env](value, exn) },
                env: env
            ),
            ui16q: try OptionalConverter<UInt16>.consumeIota(
                try env.check { exn in _ui16qGetter[env](value, exn) },
                env: env
            ),
            ui32: try UInt32.consumeIota(
                try env.check { exn in _ui32Getter[env](value, exn) },
                env: env
            ),
            ui32q: try OptionalConverter<UInt32>.consumeIota(
                try env.check { exn in _ui32qGetter[env](value, exn) },
                env: env
            ),
            ui64: try UInt64.consumeIota(
                try env.check { exn in _ui64Getter[env](value, exn) },
                env: env
            ),
            ui64q: try OptionalConverter<UInt64>.consumeIota(
                try env.check { exn in _ui64qGetter[env](value, exn) },
                env: env
            ),
            i8: try Int8.consumeIota(
                try env.check { exn in _i8Getter[env](value, exn) },
                env: env
            ),
            i8q: try OptionalConverter<Int8>.consumeIota(
                try env.check { exn in _i8qGetter[env](value, exn) },
                env: env
            ),
            i16: try Int16.consumeIota(
                try env.check { exn in _i16Getter[env](value, exn) },
                env: env
            ),
            i16q: try OptionalConverter<Int16>.consumeIota(
                try env.check { exn in _i16qGetter[env](value, exn) },
                env: env
            ),
            i32: try Int32.consumeIota(
                try env.check { exn in _i32Getter[env](value, exn) },
                env: env
            ),
            i32q: try OptionalConverter<Int32>.consumeIota(
                try env.check { exn in _i32qGetter[env](value, exn) },
                env: env
            ),
            i64: try Int64.consumeIota(
                try env.check { exn in _i64Getter[env](value, exn) },
                env: env
            ),
            i64q: try OptionalConverter<Int64>.consumeIota(
                try env.check { exn in _i64qGetter[env](value, exn) },
                env: env
            ),
            f: try Float.consumeIota(
                try env.check { exn in _fGetter[env](value, exn) },
                env: env
            ),
            fq: try OptionalConverter<Float>.consumeIota(
                try env.check { exn in _fqGetter[env](value, exn) },
                env: env
            ),
            d: try Double.consumeIota(
                try env.check { exn in _dGetter[env](value, exn) },
                env: env
            ),
            dq: try OptionalConverter<Double>.consumeIota(
                try env.check { exn in _dqGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Bool.toIota(value.b, env: env),
                try OptionalConverter<Bool>.toIota(value.bq, env: env),
                try UInt8.toIota(value.ui8, env: env),
                try OptionalConverter<UInt8>.toIota(value.ui8q, env: env),
                try UInt16.toIota(value.ui16, env: env),
                try OptionalConverter<UInt16>.toIota(value.ui16q, env: env),
                try UInt32.toIota(value.ui32, env: env),
                try OptionalConverter<UInt32>.toIota(value.ui32q, env: env),
                try UInt64.toIota(value.ui64, env: env),
                try OptionalConverter<UInt64>.toIota(value.ui64q, env: env),
                try Int8.toIota(value.i8, env: env),
                try OptionalConverter<Int8>.toIota(value.i8q, env: env),
                try Int16.toIota(value.i16, env: env),
                try OptionalConverter<Int16>.toIota(value.i16q, env: env),
                try Int32.toIota(value.i32, env: env),
                try OptionalConverter<Int32>.toIota(value.i32q, env: env),
                try Int64.toIota(value.i64, env: env),
                try OptionalConverter<Int64>.toIota(value.i64q, env: env),
                try Float.toIota(value.f, env: env),
                try OptionalConverter<Float>.toIota(value.fq, env: env),
                try Double.toIota(value.d, env: env),
                try OptionalConverter<Double>.toIota(value.dq, env: env),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this, env: env)
        let result = try body(&mutatingSelf)
        try env.check { exn in _bSetter[env](
            this,
            try Bool.toIota(mutatingSelf.b, env: env),
            exn
        )}
        try env.check { exn in _bqSetter[env](
            this,
            try OptionalConverter<Bool>.toIota(mutatingSelf.bq, env: env),
            exn
        )}
        try env.check { exn in _ui8Setter[env](
            this,
            try UInt8.toIota(mutatingSelf.ui8, env: env),
            exn
        )}
        try env.check { exn in _ui8qSetter[env](
            this,
            try OptionalConverter<UInt8>.toIota(mutatingSelf.ui8q, env: env),
            exn
        )}
        try env.check { exn in _ui16Setter[env](
            this,
            try UInt16.toIota(mutatingSelf.ui16, env: env),
            exn
        )}
        try env.check { exn in _ui16qSetter[env](
            this,
            try OptionalConverter<UInt16>.toIota(mutatingSelf.ui16q, env: env),
            exn
        )}
        try env.check { exn in _ui32Setter[env](
            this,
            try UInt32.toIota(mutatingSelf.ui32, env: env),
            exn
        )}
        try env.check { exn in _ui32qSetter[env](
            this,
            try OptionalConverter<UInt32>.toIota(mutatingSelf.ui32q, env: env),
            exn
        )}
        try env.check { exn in _ui64Setter[env](
            this,
            try UInt64.toIota(mutatingSelf.ui64, env: env),
            exn
        )}
        try env.check { exn in _ui64qSetter[env](
            this,
            try OptionalConverter<UInt64>.toIota(mutatingSelf.ui64q, env: env),
            exn
        )}
        try env.check { exn in _i8Setter[env](
            this,
            try Int8.toIota(mutatingSelf.i8, env: env),
            exn
        )}
        try env.check { exn in _i8qSetter[env](
            this,
            try OptionalConverter<Int8>.toIota(mutatingSelf.i8q, env: env),
            exn
        )}
        try env.check { exn in _i16Setter[env](
            this,
            try Int16.toIota(mutatingSelf.i16, env: env),
            exn
        )}
        try env.check { exn in _i16qSetter[env](
            this,
            try OptionalConverter<Int16>.toIota(mutatingSelf.i16q, env: env),
            exn
        )}
        try env.check { exn in _i32Setter[env](
            this,
            try Int32.toIota(mutatingSelf.i32, env: env),
            exn
        )}
        try env.check { exn in _i32qSetter[env](
            this,
            try OptionalConverter<Int32>.toIota(mutatingSelf.i32q, env: env),
            exn
        )}
        try env.check { exn in _i64Setter[env](
            this,
            try Int64.toIota(mutatingSelf.i64, env: env),
            exn
        )}
        try env.check { exn in _i64qSetter[env](
            this,
            try OptionalConverter<Int64>.toIota(mutatingSelf.i64q, env: env),
            exn
        )}
        try env.check { exn in _fSetter[env](
            this,
            try Float.toIota(mutatingSelf.f, env: env),
            exn
        )}
        try env.check { exn in _fqSetter[env](
            this,
            try OptionalConverter<Float>.toIota(mutatingSelf.fq, env: env),
            exn
        )}
        try env.check { exn in _dSetter[env](
            this,
            try Double.toIota(mutatingSelf.d, env: env),
            exn
        )}
        try env.check { exn in _dqSetter[env](
            this,
            try OptionalConverter<Double>.toIota(mutatingSelf.dq, env: env),
            exn
        )}
        return result
    }
}
