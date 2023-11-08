// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.Primitives.PrimitiveHolder: JavaMutator {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_b_id: jfieldID!
    private static var _java_bq_id: jfieldID!
    private static var _java_ui8_id: jfieldID!
    private static var _java_ui8q_id: jfieldID!
    private static var _java_ui16_id: jfieldID!
    private static var _java_ui16q_id: jfieldID!
    private static var _java_ui32_id: jfieldID!
    private static var _java_ui32q_id: jfieldID!
    private static var _java_ui64_id: jfieldID!
    private static var _java_ui64q_id: jfieldID!
    private static var _java_ui_id: jfieldID!
    private static var _java_uiq_id: jfieldID!
    private static var _java_i8_id: jfieldID!
    private static var _java_i8q_id: jfieldID!
    private static var _java_i16_id: jfieldID!
    private static var _java_i16q_id: jfieldID!
    private static var _java_i32_id: jfieldID!
    private static var _java_i32q_id: jfieldID!
    private static var _java_i64_id: jfieldID!
    private static var _java_i64q_id: jfieldID!
    private static var _java_i_id: jfieldID!
    private static var _java_iq_id: jfieldID!
    private static var _java_f_id: jfieldID!
    private static var _java_fq_id: jfieldID!
    private static var _java_d_id: jfieldID!
    private static var _java_dq_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            b: try Swift.Bool.fromJava(
                env.GetBooleanField(value, Self._java_b_id),
                env: env
            ),
            bq: try OptionalConverter<Swift.Bool>.fromJava(
                env.GetObjectField(value, Self._java_bq_id),
                env: env
            ),
            ui8: try Swift.UInt8.fromJava(
                env.GetByteField(value, Self._java_ui8_id),
                env: env
            ),
            ui8q: try OptionalConverter<Swift.UInt8>.fromJava(
                env.GetObjectField(value, Self._java_ui8q_id),
                env: env
            ),
            ui16: try Swift.UInt16.fromJava(
                env.GetShortField(value, Self._java_ui16_id),
                env: env
            ),
            ui16q: try OptionalConverter<Swift.UInt16>.fromJava(
                env.GetObjectField(value, Self._java_ui16q_id),
                env: env
            ),
            ui32: try Swift.UInt32.fromJava(
                env.GetIntField(value, Self._java_ui32_id),
                env: env
            ),
            ui32q: try OptionalConverter<Swift.UInt32>.fromJava(
                env.GetObjectField(value, Self._java_ui32q_id),
                env: env
            ),
            ui64: try Swift.UInt64.fromJava(
                env.GetLongField(value, Self._java_ui64_id),
                env: env
            ),
            ui64q: try OptionalConverter<Swift.UInt64>.fromJava(
                env.GetObjectField(value, Self._java_ui64q_id),
                env: env
            ),
            ui: try Swift.UInt.fromJava(
                env.GetLongField(value, Self._java_ui_id),
                env: env
            ),
            uiq: try OptionalConverter<Swift.UInt>.fromJava(
                env.GetObjectField(value, Self._java_uiq_id),
                env: env
            ),
            i8: try Swift.Int8.fromJava(
                env.GetByteField(value, Self._java_i8_id),
                env: env
            ),
            i8q: try OptionalConverter<Swift.Int8>.fromJava(
                env.GetObjectField(value, Self._java_i8q_id),
                env: env
            ),
            i16: try Swift.Int16.fromJava(
                env.GetShortField(value, Self._java_i16_id),
                env: env
            ),
            i16q: try OptionalConverter<Swift.Int16>.fromJava(
                env.GetObjectField(value, Self._java_i16q_id),
                env: env
            ),
            i32: try Swift.Int32.fromJava(
                env.GetIntField(value, Self._java_i32_id),
                env: env
            ),
            i32q: try OptionalConverter<Swift.Int32>.fromJava(
                env.GetObjectField(value, Self._java_i32q_id),
                env: env
            ),
            i64: try Swift.Int64.fromJava(
                env.GetLongField(value, Self._java_i64_id),
                env: env
            ),
            i64q: try OptionalConverter<Swift.Int64>.fromJava(
                env.GetObjectField(value, Self._java_i64q_id),
                env: env
            ),
            i: try Swift.Int.fromJava(
                env.GetLongField(value, Self._java_i_id),
                env: env
            ),
            iq: try OptionalConverter<Swift.Int>.fromJava(
                env.GetObjectField(value, Self._java_iq_id),
                env: env
            ),
            f: try Swift.Float.fromJava(
                env.GetFloatField(value, Self._java_f_id),
                env: env
            ),
            fq: try OptionalConverter<Swift.Float>.fromJava(
                env.GetObjectField(value, Self._java_fq_id),
                env: env
            ),
            d: try Swift.Double.fromJava(
                env.GetDoubleField(value, Self._java_d_id),
                env: env
            ),
            dq: try OptionalConverter<Swift.Double>.fromJava(
                env.GetObjectField(value, Self._java_dq_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(Swift.Bool.toJava(value.b, env: env)),
            jvalue(OptionalConverter<Swift.Bool>.toJava(value.bq, env: env)),
            jvalue(Swift.UInt8.toJava(value.ui8, env: env)),
            jvalue(OptionalConverter<Swift.UInt8>.toJava(value.ui8q, env: env)),
            jvalue(Swift.UInt16.toJava(value.ui16, env: env)),
            jvalue(OptionalConverter<Swift.UInt16>.toJava(value.ui16q, env: env)),
            jvalue(Swift.UInt32.toJava(value.ui32, env: env)),
            jvalue(OptionalConverter<Swift.UInt32>.toJava(value.ui32q, env: env)),
            jvalue(Swift.UInt64.toJava(value.ui64, env: env)),
            jvalue(OptionalConverter<Swift.UInt64>.toJava(value.ui64q, env: env)),
            jvalue(Swift.UInt.toJava(value.ui, env: env)),
            jvalue(OptionalConverter<Swift.UInt>.toJava(value.uiq, env: env)),
            jvalue(Swift.Int8.toJava(value.i8, env: env)),
            jvalue(OptionalConverter<Swift.Int8>.toJava(value.i8q, env: env)),
            jvalue(Swift.Int16.toJava(value.i16, env: env)),
            jvalue(OptionalConverter<Swift.Int16>.toJava(value.i16q, env: env)),
            jvalue(Swift.Int32.toJava(value.i32, env: env)),
            jvalue(OptionalConverter<Swift.Int32>.toJava(value.i32q, env: env)),
            jvalue(Swift.Int64.toJava(value.i64, env: env)),
            jvalue(OptionalConverter<Swift.Int64>.toJava(value.i64q, env: env)),
            jvalue(Swift.Int.toJava(value.i, env: env)),
            jvalue(OptionalConverter<Swift.Int>.toJava(value.iq, env: env)),
            jvalue(Swift.Float.toJava(value.f, env: env)),
            jvalue(OptionalConverter<Swift.Float>.toJava(value.fq, env: env)),
            jvalue(Swift.Double.toJava(value.d, env: env)),
            jvalue(OptionalConverter<Swift.Double>.toJava(value.dq, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Primitives$PrimitiveHolder"))
        _java_b_id = try env.GetFieldID(javaClass, "b", "Z")
        _java_bq_id = try env.GetFieldID(javaClass, "bq", "Ljava/lang/Boolean;")
        _java_ui8_id = try env.GetFieldID(javaClass, "ui8", "B")
        _java_ui8q_id = try env.GetFieldID(javaClass, "ui8q", "Lkotlin/UByte;")
        _java_ui16_id = try env.GetFieldID(javaClass, "ui16", "S")
        _java_ui16q_id = try env.GetFieldID(javaClass, "ui16q", "Lkotlin/UShort;")
        _java_ui32_id = try env.GetFieldID(javaClass, "ui32", "I")
        _java_ui32q_id = try env.GetFieldID(javaClass, "ui32q", "Lkotlin/UInt;")
        _java_ui64_id = try env.GetFieldID(javaClass, "ui64", "J")
        _java_ui64q_id = try env.GetFieldID(javaClass, "ui64q", "Lkotlin/ULong;")
        _java_ui_id = try env.GetFieldID(javaClass, "ui", "J")
        _java_uiq_id = try env.GetFieldID(javaClass, "uiq", "Lkotlin/ULong;")
        _java_i8_id = try env.GetFieldID(javaClass, "i8", "B")
        _java_i8q_id = try env.GetFieldID(javaClass, "i8q", "Ljava/lang/Byte;")
        _java_i16_id = try env.GetFieldID(javaClass, "i16", "S")
        _java_i16q_id = try env.GetFieldID(javaClass, "i16q", "Ljava/lang/Short;")
        _java_i32_id = try env.GetFieldID(javaClass, "i32", "I")
        _java_i32q_id = try env.GetFieldID(javaClass, "i32q", "Ljava/lang/Integer;")
        _java_i64_id = try env.GetFieldID(javaClass, "i64", "J")
        _java_i64q_id = try env.GetFieldID(javaClass, "i64q", "Ljava/lang/Long;")
        _java_i_id = try env.GetFieldID(javaClass, "i", "J")
        _java_iq_id = try env.GetFieldID(javaClass, "iq", "Ljava/lang/Long;")
        _java_f_id = try env.GetFieldID(javaClass, "f", "F")
        _java_fq_id = try env.GetFieldID(javaClass, "fq", "Ljava/lang/Float;")
        _java_d_id = try env.GetFieldID(javaClass, "d", "D")
        _java_dq_id = try env.GetFieldID(javaClass, "dq", "Ljava/lang/Double;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(ZLjava/lang/Boolean;BLkotlin/UByte;SLkotlin/UShort;ILkotlin/UInt;JLkotlin/ULong;JLkotlin/ULong;BLjava/lang/Byte;SLjava/lang/Short;ILjava/lang/Integer;JLjava/lang/Long;JLjava/lang/Long;FLjava/lang/Float;DLjava/lang/Double;)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetBooleanField(
            this, Self._java_b_id,
            Swift.Bool.toJava(mutatingSelf.b, env: env)
        )
        try env.SetObjectField(
            this, Self._java_bq_id,
            OptionalConverter<Swift.Bool>.toJava(mutatingSelf.bq, env: env)
        )
        try env.SetByteField(
            this, Self._java_ui8_id,
            Swift.UInt8.toJava(mutatingSelf.ui8, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui8q_id,
            OptionalConverter<Swift.UInt8>.toJava(mutatingSelf.ui8q, env: env)
        )
        try env.SetShortField(
            this, Self._java_ui16_id,
            Swift.UInt16.toJava(mutatingSelf.ui16, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui16q_id,
            OptionalConverter<Swift.UInt16>.toJava(mutatingSelf.ui16q, env: env)
        )
        try env.SetIntField(
            this, Self._java_ui32_id,
            Swift.UInt32.toJava(mutatingSelf.ui32, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui32q_id,
            OptionalConverter<Swift.UInt32>.toJava(mutatingSelf.ui32q, env: env)
        )
        try env.SetLongField(
            this, Self._java_ui64_id,
            Swift.UInt64.toJava(mutatingSelf.ui64, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui64q_id,
            OptionalConverter<Swift.UInt64>.toJava(mutatingSelf.ui64q, env: env)
        )
        try env.SetLongField(
            this, Self._java_ui_id,
            Swift.UInt.toJava(mutatingSelf.ui, env: env)
        )
        try env.SetObjectField(
            this, Self._java_uiq_id,
            OptionalConverter<Swift.UInt>.toJava(mutatingSelf.uiq, env: env)
        )
        try env.SetByteField(
            this, Self._java_i8_id,
            Swift.Int8.toJava(mutatingSelf.i8, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i8q_id,
            OptionalConverter<Swift.Int8>.toJava(mutatingSelf.i8q, env: env)
        )
        try env.SetShortField(
            this, Self._java_i16_id,
            Swift.Int16.toJava(mutatingSelf.i16, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i16q_id,
            OptionalConverter<Swift.Int16>.toJava(mutatingSelf.i16q, env: env)
        )
        try env.SetIntField(
            this, Self._java_i32_id,
            Swift.Int32.toJava(mutatingSelf.i32, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i32q_id,
            OptionalConverter<Swift.Int32>.toJava(mutatingSelf.i32q, env: env)
        )
        try env.SetLongField(
            this, Self._java_i64_id,
            Swift.Int64.toJava(mutatingSelf.i64, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i64q_id,
            OptionalConverter<Swift.Int64>.toJava(mutatingSelf.i64q, env: env)
        )
        try env.SetLongField(
            this, Self._java_i_id,
            Swift.Int.toJava(mutatingSelf.i, env: env)
        )
        try env.SetObjectField(
            this, Self._java_iq_id,
            OptionalConverter<Swift.Int>.toJava(mutatingSelf.iq, env: env)
        )
        try env.SetFloatField(
            this, Self._java_f_id,
            Swift.Float.toJava(mutatingSelf.f, env: env)
        )
        try env.SetObjectField(
            this, Self._java_fq_id,
            OptionalConverter<Swift.Float>.toJava(mutatingSelf.fq, env: env)
        )
        try env.SetDoubleField(
            this, Self._java_d_id,
            Swift.Double.toJava(mutatingSelf.d, env: env)
        )
        try env.SetObjectField(
            this, Self._java_dq_id,
            OptionalConverter<Swift.Double>.toJava(mutatingSelf.dq, env: env)
        )
        return result
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout Self, inout Env) async throws -> R) async throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try await body(&mutatingSelf, &env)
        try env.SetBooleanField(
            this, Self._java_b_id,
            Swift.Bool.toJava(mutatingSelf.b, env: env)
        )
        try env.SetObjectField(
            this, Self._java_bq_id,
            OptionalConverter<Swift.Bool>.toJava(mutatingSelf.bq, env: env)
        )
        try env.SetByteField(
            this, Self._java_ui8_id,
            Swift.UInt8.toJava(mutatingSelf.ui8, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui8q_id,
            OptionalConverter<Swift.UInt8>.toJava(mutatingSelf.ui8q, env: env)
        )
        try env.SetShortField(
            this, Self._java_ui16_id,
            Swift.UInt16.toJava(mutatingSelf.ui16, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui16q_id,
            OptionalConverter<Swift.UInt16>.toJava(mutatingSelf.ui16q, env: env)
        )
        try env.SetIntField(
            this, Self._java_ui32_id,
            Swift.UInt32.toJava(mutatingSelf.ui32, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui32q_id,
            OptionalConverter<Swift.UInt32>.toJava(mutatingSelf.ui32q, env: env)
        )
        try env.SetLongField(
            this, Self._java_ui64_id,
            Swift.UInt64.toJava(mutatingSelf.ui64, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui64q_id,
            OptionalConverter<Swift.UInt64>.toJava(mutatingSelf.ui64q, env: env)
        )
        try env.SetLongField(
            this, Self._java_ui_id,
            Swift.UInt.toJava(mutatingSelf.ui, env: env)
        )
        try env.SetObjectField(
            this, Self._java_uiq_id,
            OptionalConverter<Swift.UInt>.toJava(mutatingSelf.uiq, env: env)
        )
        try env.SetByteField(
            this, Self._java_i8_id,
            Swift.Int8.toJava(mutatingSelf.i8, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i8q_id,
            OptionalConverter<Swift.Int8>.toJava(mutatingSelf.i8q, env: env)
        )
        try env.SetShortField(
            this, Self._java_i16_id,
            Swift.Int16.toJava(mutatingSelf.i16, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i16q_id,
            OptionalConverter<Swift.Int16>.toJava(mutatingSelf.i16q, env: env)
        )
        try env.SetIntField(
            this, Self._java_i32_id,
            Swift.Int32.toJava(mutatingSelf.i32, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i32q_id,
            OptionalConverter<Swift.Int32>.toJava(mutatingSelf.i32q, env: env)
        )
        try env.SetLongField(
            this, Self._java_i64_id,
            Swift.Int64.toJava(mutatingSelf.i64, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i64q_id,
            OptionalConverter<Swift.Int64>.toJava(mutatingSelf.i64q, env: env)
        )
        try env.SetLongField(
            this, Self._java_i_id,
            Swift.Int.toJava(mutatingSelf.i, env: env)
        )
        try env.SetObjectField(
            this, Self._java_iq_id,
            OptionalConverter<Swift.Int>.toJava(mutatingSelf.iq, env: env)
        )
        try env.SetFloatField(
            this, Self._java_f_id,
            Swift.Float.toJava(mutatingSelf.f, env: env)
        )
        try env.SetObjectField(
            this, Self._java_fq_id,
            OptionalConverter<Swift.Float>.toJava(mutatingSelf.fq, env: env)
        )
        try env.SetDoubleField(
            this, Self._java_d_id,
            Swift.Double.toJava(mutatingSelf.d, env: env)
        )
        try env.SetObjectField(
            this, Self._java_dq_id,
            OptionalConverter<Swift.Double>.toJava(mutatingSelf.dq, env: env)
        )
        return result
    }
}
