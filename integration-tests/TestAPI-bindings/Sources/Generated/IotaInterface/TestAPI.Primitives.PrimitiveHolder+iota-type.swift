// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Primitives_PrimitiveHolder_setup")
public func TestAPI_Primitives_PrimitiveHolder_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.Primitives.PrimitiveHolder._ConstructorMethod,
    _ bGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType,
    _ bSetter: @escaping @convention(c) (foreignObject, Swift.Bool.CType, _ exn: foreignOutExn) -> Void,
    _ bqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Bool>.CType,
    _ bqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ ui8Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt8.CType,
    _ ui8Setter: @escaping @convention(c) (foreignObject, Swift.UInt8.CType, _ exn: foreignOutExn) -> Void,
    _ ui8qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt8>.CType,
    _ ui8qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.UInt8>.CType, _ exn: foreignOutExn) -> Void,
    _ ui16Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt16.CType,
    _ ui16Setter: @escaping @convention(c) (foreignObject, Swift.UInt16.CType, _ exn: foreignOutExn) -> Void,
    _ ui16qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt16>.CType,
    _ ui16qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.UInt16>.CType, _ exn: foreignOutExn) -> Void,
    _ ui32Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt32.CType,
    _ ui32Setter: @escaping @convention(c) (foreignObject, Swift.UInt32.CType, _ exn: foreignOutExn) -> Void,
    _ ui32qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt32>.CType,
    _ ui32qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.UInt32>.CType, _ exn: foreignOutExn) -> Void,
    _ ui64Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt64.CType,
    _ ui64Setter: @escaping @convention(c) (foreignObject, Swift.UInt64.CType, _ exn: foreignOutExn) -> Void,
    _ ui64qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt64>.CType,
    _ ui64qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.UInt64>.CType, _ exn: foreignOutExn) -> Void,
    _ uiGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt.CType,
    _ uiSetter: @escaping @convention(c) (foreignObject, Swift.UInt.CType, _ exn: foreignOutExn) -> Void,
    _ uiqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt>.CType,
    _ uiqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.UInt>.CType, _ exn: foreignOutExn) -> Void,
    _ i8Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int8.CType,
    _ i8Setter: @escaping @convention(c) (foreignObject, Swift.Int8.CType, _ exn: foreignOutExn) -> Void,
    _ i8qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int8>.CType,
    _ i8qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Int8>.CType, _ exn: foreignOutExn) -> Void,
    _ i16Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int16.CType,
    _ i16Setter: @escaping @convention(c) (foreignObject, Swift.Int16.CType, _ exn: foreignOutExn) -> Void,
    _ i16qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int16>.CType,
    _ i16qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Int16>.CType, _ exn: foreignOutExn) -> Void,
    _ i32Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int32.CType,
    _ i32Setter: @escaping @convention(c) (foreignObject, Swift.Int32.CType, _ exn: foreignOutExn) -> Void,
    _ i32qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int32>.CType,
    _ i32qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Int32>.CType, _ exn: foreignOutExn) -> Void,
    _ i64Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int64.CType,
    _ i64Setter: @escaping @convention(c) (foreignObject, Swift.Int64.CType, _ exn: foreignOutExn) -> Void,
    _ i64qGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int64>.CType,
    _ i64qSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Int64>.CType, _ exn: foreignOutExn) -> Void,
    _ iGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ iSetter: @escaping @convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void,
    _ iqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int>.CType,
    _ iqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Int>.CType, _ exn: foreignOutExn) -> Void,
    _ fGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Float.CType,
    _ fSetter: @escaping @convention(c) (foreignObject, Swift.Float.CType, _ exn: foreignOutExn) -> Void,
    _ fqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Float>.CType,
    _ fqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Float>.CType, _ exn: foreignOutExn) -> Void,
    _ dGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Double.CType,
    _ dSetter: @escaping @convention(c) (foreignObject, Swift.Double.CType, _ exn: foreignOutExn) -> Void,
    _ dqGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Double>.CType,
    _ dqSetter: @escaping @convention(c) (foreignObject, OptionalConverter<Swift.Double>.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Primitives.PrimitiveHolder._constructorMethod.isInitialized(env) { return }
    TestAPI.Primitives.PrimitiveHolder._constructorMethod[env] = constructorMethod
    TestAPI.Primitives.PrimitiveHolder._bGetter[env] = bGetter
    TestAPI.Primitives.PrimitiveHolder._bSetter[env] = bSetter
    TestAPI.Primitives.PrimitiveHolder._bqGetter[env] = bqGetter
    TestAPI.Primitives.PrimitiveHolder._bqSetter[env] = bqSetter
    TestAPI.Primitives.PrimitiveHolder._ui8Getter[env] = ui8Getter
    TestAPI.Primitives.PrimitiveHolder._ui8Setter[env] = ui8Setter
    TestAPI.Primitives.PrimitiveHolder._ui8qGetter[env] = ui8qGetter
    TestAPI.Primitives.PrimitiveHolder._ui8qSetter[env] = ui8qSetter
    TestAPI.Primitives.PrimitiveHolder._ui16Getter[env] = ui16Getter
    TestAPI.Primitives.PrimitiveHolder._ui16Setter[env] = ui16Setter
    TestAPI.Primitives.PrimitiveHolder._ui16qGetter[env] = ui16qGetter
    TestAPI.Primitives.PrimitiveHolder._ui16qSetter[env] = ui16qSetter
    TestAPI.Primitives.PrimitiveHolder._ui32Getter[env] = ui32Getter
    TestAPI.Primitives.PrimitiveHolder._ui32Setter[env] = ui32Setter
    TestAPI.Primitives.PrimitiveHolder._ui32qGetter[env] = ui32qGetter
    TestAPI.Primitives.PrimitiveHolder._ui32qSetter[env] = ui32qSetter
    TestAPI.Primitives.PrimitiveHolder._ui64Getter[env] = ui64Getter
    TestAPI.Primitives.PrimitiveHolder._ui64Setter[env] = ui64Setter
    TestAPI.Primitives.PrimitiveHolder._ui64qGetter[env] = ui64qGetter
    TestAPI.Primitives.PrimitiveHolder._ui64qSetter[env] = ui64qSetter
    TestAPI.Primitives.PrimitiveHolder._uiGetter[env] = uiGetter
    TestAPI.Primitives.PrimitiveHolder._uiSetter[env] = uiSetter
    TestAPI.Primitives.PrimitiveHolder._uiqGetter[env] = uiqGetter
    TestAPI.Primitives.PrimitiveHolder._uiqSetter[env] = uiqSetter
    TestAPI.Primitives.PrimitiveHolder._i8Getter[env] = i8Getter
    TestAPI.Primitives.PrimitiveHolder._i8Setter[env] = i8Setter
    TestAPI.Primitives.PrimitiveHolder._i8qGetter[env] = i8qGetter
    TestAPI.Primitives.PrimitiveHolder._i8qSetter[env] = i8qSetter
    TestAPI.Primitives.PrimitiveHolder._i16Getter[env] = i16Getter
    TestAPI.Primitives.PrimitiveHolder._i16Setter[env] = i16Setter
    TestAPI.Primitives.PrimitiveHolder._i16qGetter[env] = i16qGetter
    TestAPI.Primitives.PrimitiveHolder._i16qSetter[env] = i16qSetter
    TestAPI.Primitives.PrimitiveHolder._i32Getter[env] = i32Getter
    TestAPI.Primitives.PrimitiveHolder._i32Setter[env] = i32Setter
    TestAPI.Primitives.PrimitiveHolder._i32qGetter[env] = i32qGetter
    TestAPI.Primitives.PrimitiveHolder._i32qSetter[env] = i32qSetter
    TestAPI.Primitives.PrimitiveHolder._i64Getter[env] = i64Getter
    TestAPI.Primitives.PrimitiveHolder._i64Setter[env] = i64Setter
    TestAPI.Primitives.PrimitiveHolder._i64qGetter[env] = i64qGetter
    TestAPI.Primitives.PrimitiveHolder._i64qSetter[env] = i64qSetter
    TestAPI.Primitives.PrimitiveHolder._iGetter[env] = iGetter
    TestAPI.Primitives.PrimitiveHolder._iSetter[env] = iSetter
    TestAPI.Primitives.PrimitiveHolder._iqGetter[env] = iqGetter
    TestAPI.Primitives.PrimitiveHolder._iqSetter[env] = iqSetter
    TestAPI.Primitives.PrimitiveHolder._fGetter[env] = fGetter
    TestAPI.Primitives.PrimitiveHolder._fSetter[env] = fSetter
    TestAPI.Primitives.PrimitiveHolder._fqGetter[env] = fqGetter
    TestAPI.Primitives.PrimitiveHolder._fqSetter[env] = fqSetter
    TestAPI.Primitives.PrimitiveHolder._dGetter[env] = dGetter
    TestAPI.Primitives.PrimitiveHolder._dSetter[env] = dSetter
    TestAPI.Primitives.PrimitiveHolder._dqGetter[env] = dqGetter
    TestAPI.Primitives.PrimitiveHolder._dqSetter[env] = dqSetter
}

extension TestAPI.Primitives.PrimitiveHolder: IotaMutator {
    fileprivate static let _bGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType>()
    fileprivate static let _bSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Bool.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _bqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Bool>.CType>()
    fileprivate static let _bqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui8Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt8.CType>()
    fileprivate static let _ui8Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.UInt8.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui8qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt8>.CType>()
    fileprivate static let _ui8qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.UInt8>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui16Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt16.CType>()
    fileprivate static let _ui16Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.UInt16.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui16qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt16>.CType>()
    fileprivate static let _ui16qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.UInt16>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui32Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt32.CType>()
    fileprivate static let _ui32Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.UInt32.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui32qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt32>.CType>()
    fileprivate static let _ui32qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.UInt32>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui64Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt64.CType>()
    fileprivate static let _ui64Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.UInt64.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _ui64qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt64>.CType>()
    fileprivate static let _ui64qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.UInt64>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _uiGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.UInt.CType>()
    fileprivate static let _uiSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.UInt.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _uiqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.UInt>.CType>()
    fileprivate static let _uiqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.UInt>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i8Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int8.CType>()
    fileprivate static let _i8Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int8.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i8qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int8>.CType>()
    fileprivate static let _i8qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Int8>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i16Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int16.CType>()
    fileprivate static let _i16Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int16.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i16qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int16>.CType>()
    fileprivate static let _i16qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Int16>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i32Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int32.CType>()
    fileprivate static let _i32Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int32.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i32qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int32>.CType>()
    fileprivate static let _i32qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Int32>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i64Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int64.CType>()
    fileprivate static let _i64Setter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int64.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _i64qGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int64>.CType>()
    fileprivate static let _i64qSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Int64>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _iGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    fileprivate static let _iSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _iqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Int>.CType>()
    fileprivate static let _iqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Int>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _fGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Float.CType>()
    fileprivate static let _fSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Float.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _fqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Float>.CType>()
    fileprivate static let _fqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Float>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _dGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Double.CType>()
    fileprivate static let _dSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Double.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _dqGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.Double>.CType>()
    fileprivate static let _dqSetter = Env.CallbackMap<@convention(c) (foreignObject, OptionalConverter<Swift.Double>.CType, _ exn: foreignOutExn) -> Void>()
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
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            b: try Swift.Bool.consumeIota(
                try env.check { exn in _bGetter[env](value, exn) },
                env: env
            ),
            bq: try OptionalConverter<Swift.Bool>.consumeIota(
                try env.check { exn in _bqGetter[env](value, exn) },
                env: env
            ),
            ui8: try Swift.UInt8.consumeIota(
                try env.check { exn in _ui8Getter[env](value, exn) },
                env: env
            ),
            ui8q: try OptionalConverter<Swift.UInt8>.consumeIota(
                try env.check { exn in _ui8qGetter[env](value, exn) },
                env: env
            ),
            ui16: try Swift.UInt16.consumeIota(
                try env.check { exn in _ui16Getter[env](value, exn) },
                env: env
            ),
            ui16q: try OptionalConverter<Swift.UInt16>.consumeIota(
                try env.check { exn in _ui16qGetter[env](value, exn) },
                env: env
            ),
            ui32: try Swift.UInt32.consumeIota(
                try env.check { exn in _ui32Getter[env](value, exn) },
                env: env
            ),
            ui32q: try OptionalConverter<Swift.UInt32>.consumeIota(
                try env.check { exn in _ui32qGetter[env](value, exn) },
                env: env
            ),
            ui64: try Swift.UInt64.consumeIota(
                try env.check { exn in _ui64Getter[env](value, exn) },
                env: env
            ),
            ui64q: try OptionalConverter<Swift.UInt64>.consumeIota(
                try env.check { exn in _ui64qGetter[env](value, exn) },
                env: env
            ),
            ui: try Swift.UInt.consumeIota(
                try env.check { exn in _uiGetter[env](value, exn) },
                env: env
            ),
            uiq: try OptionalConverter<Swift.UInt>.consumeIota(
                try env.check { exn in _uiqGetter[env](value, exn) },
                env: env
            ),
            i8: try Swift.Int8.consumeIota(
                try env.check { exn in _i8Getter[env](value, exn) },
                env: env
            ),
            i8q: try OptionalConverter<Swift.Int8>.consumeIota(
                try env.check { exn in _i8qGetter[env](value, exn) },
                env: env
            ),
            i16: try Swift.Int16.consumeIota(
                try env.check { exn in _i16Getter[env](value, exn) },
                env: env
            ),
            i16q: try OptionalConverter<Swift.Int16>.consumeIota(
                try env.check { exn in _i16qGetter[env](value, exn) },
                env: env
            ),
            i32: try Swift.Int32.consumeIota(
                try env.check { exn in _i32Getter[env](value, exn) },
                env: env
            ),
            i32q: try OptionalConverter<Swift.Int32>.consumeIota(
                try env.check { exn in _i32qGetter[env](value, exn) },
                env: env
            ),
            i64: try Swift.Int64.consumeIota(
                try env.check { exn in _i64Getter[env](value, exn) },
                env: env
            ),
            i64q: try OptionalConverter<Swift.Int64>.consumeIota(
                try env.check { exn in _i64qGetter[env](value, exn) },
                env: env
            ),
            i: try Swift.Int.consumeIota(
                try env.check { exn in _iGetter[env](value, exn) },
                env: env
            ),
            iq: try OptionalConverter<Swift.Int>.consumeIota(
                try env.check { exn in _iqGetter[env](value, exn) },
                env: env
            ),
            f: try Swift.Float.consumeIota(
                try env.check { exn in _fGetter[env](value, exn) },
                env: env
            ),
            fq: try OptionalConverter<Swift.Float>.consumeIota(
                try env.check { exn in _fqGetter[env](value, exn) },
                env: env
            ),
            d: try Swift.Double.consumeIota(
                try env.check { exn in _dGetter[env](value, exn) },
                env: env
            ),
            dq: try OptionalConverter<Swift.Double>.consumeIota(
                try env.check { exn in _dqGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.Bool.toIota(value.b, env: env),
                try OptionalConverter<Swift.Bool>.toIota(value.bq, env: env),
                try Swift.UInt8.toIota(value.ui8, env: env),
                try OptionalConverter<Swift.UInt8>.toIota(value.ui8q, env: env),
                try Swift.UInt16.toIota(value.ui16, env: env),
                try OptionalConverter<Swift.UInt16>.toIota(value.ui16q, env: env),
                try Swift.UInt32.toIota(value.ui32, env: env),
                try OptionalConverter<Swift.UInt32>.toIota(value.ui32q, env: env),
                try Swift.UInt64.toIota(value.ui64, env: env),
                try OptionalConverter<Swift.UInt64>.toIota(value.ui64q, env: env),
                try Swift.UInt.toIota(value.ui, env: env),
                try OptionalConverter<Swift.UInt>.toIota(value.uiq, env: env),
                try Swift.Int8.toIota(value.i8, env: env),
                try OptionalConverter<Swift.Int8>.toIota(value.i8q, env: env),
                try Swift.Int16.toIota(value.i16, env: env),
                try OptionalConverter<Swift.Int16>.toIota(value.i16q, env: env),
                try Swift.Int32.toIota(value.i32, env: env),
                try OptionalConverter<Swift.Int32>.toIota(value.i32q, env: env),
                try Swift.Int64.toIota(value.i64, env: env),
                try OptionalConverter<Swift.Int64>.toIota(value.i64q, env: env),
                try Swift.Int.toIota(value.i, env: env),
                try OptionalConverter<Swift.Int>.toIota(value.iq, env: env),
                try Swift.Float.toIota(value.f, env: env),
                try OptionalConverter<Swift.Float>.toIota(value.fq, env: env),
                try Swift.Double.toIota(value.d, env: env),
                try OptionalConverter<Swift.Double>.toIota(value.dq, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        do {
            let box = try Box<SwiftType>.peekIota(this, env: env)
            box.value = value
        } catch {
            try env.check { exn in _bSetter[env](
                this,
                try Swift.Bool.toIota(value.b, env: env),
                exn
            )}
            try env.check { exn in _bqSetter[env](
                this,
                try OptionalConverter<Swift.Bool>.toIota(value.bq, env: env),
                exn
            )}
            try env.check { exn in _ui8Setter[env](
                this,
                try Swift.UInt8.toIota(value.ui8, env: env),
                exn
            )}
            try env.check { exn in _ui8qSetter[env](
                this,
                try OptionalConverter<Swift.UInt8>.toIota(value.ui8q, env: env),
                exn
            )}
            try env.check { exn in _ui16Setter[env](
                this,
                try Swift.UInt16.toIota(value.ui16, env: env),
                exn
            )}
            try env.check { exn in _ui16qSetter[env](
                this,
                try OptionalConverter<Swift.UInt16>.toIota(value.ui16q, env: env),
                exn
            )}
            try env.check { exn in _ui32Setter[env](
                this,
                try Swift.UInt32.toIota(value.ui32, env: env),
                exn
            )}
            try env.check { exn in _ui32qSetter[env](
                this,
                try OptionalConverter<Swift.UInt32>.toIota(value.ui32q, env: env),
                exn
            )}
            try env.check { exn in _ui64Setter[env](
                this,
                try Swift.UInt64.toIota(value.ui64, env: env),
                exn
            )}
            try env.check { exn in _ui64qSetter[env](
                this,
                try OptionalConverter<Swift.UInt64>.toIota(value.ui64q, env: env),
                exn
            )}
            try env.check { exn in _uiSetter[env](
                this,
                try Swift.UInt.toIota(value.ui, env: env),
                exn
            )}
            try env.check { exn in _uiqSetter[env](
                this,
                try OptionalConverter<Swift.UInt>.toIota(value.uiq, env: env),
                exn
            )}
            try env.check { exn in _i8Setter[env](
                this,
                try Swift.Int8.toIota(value.i8, env: env),
                exn
            )}
            try env.check { exn in _i8qSetter[env](
                this,
                try OptionalConverter<Swift.Int8>.toIota(value.i8q, env: env),
                exn
            )}
            try env.check { exn in _i16Setter[env](
                this,
                try Swift.Int16.toIota(value.i16, env: env),
                exn
            )}
            try env.check { exn in _i16qSetter[env](
                this,
                try OptionalConverter<Swift.Int16>.toIota(value.i16q, env: env),
                exn
            )}
            try env.check { exn in _i32Setter[env](
                this,
                try Swift.Int32.toIota(value.i32, env: env),
                exn
            )}
            try env.check { exn in _i32qSetter[env](
                this,
                try OptionalConverter<Swift.Int32>.toIota(value.i32q, env: env),
                exn
            )}
            try env.check { exn in _i64Setter[env](
                this,
                try Swift.Int64.toIota(value.i64, env: env),
                exn
            )}
            try env.check { exn in _i64qSetter[env](
                this,
                try OptionalConverter<Swift.Int64>.toIota(value.i64q, env: env),
                exn
            )}
            try env.check { exn in _iSetter[env](
                this,
                try Swift.Int.toIota(value.i, env: env),
                exn
            )}
            try env.check { exn in _iqSetter[env](
                this,
                try OptionalConverter<Swift.Int>.toIota(value.iq, env: env),
                exn
            )}
            try env.check { exn in _fSetter[env](
                this,
                try Swift.Float.toIota(value.f, env: env),
                exn
            )}
            try env.check { exn in _fqSetter[env](
                this,
                try OptionalConverter<Swift.Float>.toIota(value.fq, env: env),
                exn
            )}
            try env.check { exn in _dSetter[env](
                this,
                try Swift.Double.toIota(value.d, env: env),
                exn
            )}
            try env.check { exn in _dqSetter[env](
                this,
                try OptionalConverter<Swift.Double>.toIota(value.dq, env: env),
                exn
            )}
        }
    }
}
