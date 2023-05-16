// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Primitives.PrimitiveHolder: JavaMutator {
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
            b: try Bool.fromJava(
                env.GetBooleanField(value, Self._java_b_id),
                env: env
            ),
            bq: try OptionalConverter<Bool>.fromJava(
                env.GetObjectField(value, Self._java_bq_id),
                env: env
            ),
            ui8: try UInt8.fromJava(
                env.GetByteField(value, Self._java_ui8_id),
                env: env
            ),
            ui8q: try OptionalConverter<UInt8>.fromJava(
                env.GetObjectField(value, Self._java_ui8q_id),
                env: env
            ),
            ui16: try UInt16.fromJava(
                env.GetShortField(value, Self._java_ui16_id),
                env: env
            ),
            ui16q: try OptionalConverter<UInt16>.fromJava(
                env.GetObjectField(value, Self._java_ui16q_id),
                env: env
            ),
            ui32: try UInt32.fromJava(
                env.GetIntField(value, Self._java_ui32_id),
                env: env
            ),
            ui32q: try OptionalConverter<UInt32>.fromJava(
                env.GetObjectField(value, Self._java_ui32q_id),
                env: env
            ),
            ui64: try UInt64.fromJava(
                env.GetLongField(value, Self._java_ui64_id),
                env: env
            ),
            ui64q: try OptionalConverter<UInt64>.fromJava(
                env.GetObjectField(value, Self._java_ui64q_id),
                env: env
            ),
            ui: try UInt.fromJava(
                env.GetLongField(value, Self._java_ui_id),
                env: env
            ),
            uiq: try OptionalConverter<UInt>.fromJava(
                env.GetObjectField(value, Self._java_uiq_id),
                env: env
            ),
            i8: try Int8.fromJava(
                env.GetByteField(value, Self._java_i8_id),
                env: env
            ),
            i8q: try OptionalConverter<Int8>.fromJava(
                env.GetObjectField(value, Self._java_i8q_id),
                env: env
            ),
            i16: try Int16.fromJava(
                env.GetShortField(value, Self._java_i16_id),
                env: env
            ),
            i16q: try OptionalConverter<Int16>.fromJava(
                env.GetObjectField(value, Self._java_i16q_id),
                env: env
            ),
            i32: try Int32.fromJava(
                env.GetIntField(value, Self._java_i32_id),
                env: env
            ),
            i32q: try OptionalConverter<Int32>.fromJava(
                env.GetObjectField(value, Self._java_i32q_id),
                env: env
            ),
            i64: try Int64.fromJava(
                env.GetLongField(value, Self._java_i64_id),
                env: env
            ),
            i64q: try OptionalConverter<Int64>.fromJava(
                env.GetObjectField(value, Self._java_i64q_id),
                env: env
            ),
            i: try Int.fromJava(
                env.GetLongField(value, Self._java_i_id),
                env: env
            ),
            iq: try OptionalConverter<Int>.fromJava(
                env.GetObjectField(value, Self._java_iq_id),
                env: env
            ),
            f: try Float.fromJava(
                env.GetFloatField(value, Self._java_f_id),
                env: env
            ),
            fq: try OptionalConverter<Float>.fromJava(
                env.GetObjectField(value, Self._java_fq_id),
                env: env
            ),
            d: try Double.fromJava(
                env.GetDoubleField(value, Self._java_d_id),
                env: env
            ),
            dq: try OptionalConverter<Double>.fromJava(
                env.GetObjectField(value, Self._java_dq_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(Bool.toJava(value.b, env: env)),
            jvalue(OptionalConverter<Bool>.toJava(value.bq, env: env)),
            jvalue(UInt8.toJava(value.ui8, env: env)),
            jvalue(OptionalConverter<UInt8>.toJava(value.ui8q, env: env)),
            jvalue(UInt16.toJava(value.ui16, env: env)),
            jvalue(OptionalConverter<UInt16>.toJava(value.ui16q, env: env)),
            jvalue(UInt32.toJava(value.ui32, env: env)),
            jvalue(OptionalConverter<UInt32>.toJava(value.ui32q, env: env)),
            jvalue(UInt64.toJava(value.ui64, env: env)),
            jvalue(OptionalConverter<UInt64>.toJava(value.ui64q, env: env)),
            jvalue(UInt.toJava(value.ui, env: env)),
            jvalue(OptionalConverter<UInt>.toJava(value.uiq, env: env)),
            jvalue(Int8.toJava(value.i8, env: env)),
            jvalue(OptionalConverter<Int8>.toJava(value.i8q, env: env)),
            jvalue(Int16.toJava(value.i16, env: env)),
            jvalue(OptionalConverter<Int16>.toJava(value.i16q, env: env)),
            jvalue(Int32.toJava(value.i32, env: env)),
            jvalue(OptionalConverter<Int32>.toJava(value.i32q, env: env)),
            jvalue(Int64.toJava(value.i64, env: env)),
            jvalue(OptionalConverter<Int64>.toJava(value.i64q, env: env)),
            jvalue(Int.toJava(value.i, env: env)),
            jvalue(OptionalConverter<Int>.toJava(value.iq, env: env)),
            jvalue(Float.toJava(value.f, env: env)),
            jvalue(OptionalConverter<Float>.toJava(value.fq, env: env)),
            jvalue(Double.toJava(value.d, env: env)),
            jvalue(OptionalConverter<Double>.toJava(value.dq, env: env))
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
            Bool.toJava(mutatingSelf.b, env: env)
        )
        try env.SetObjectField(
            this, Self._java_bq_id,
            OptionalConverter<Bool>.toJava(mutatingSelf.bq, env: env)
        )
        try env.SetByteField(
            this, Self._java_ui8_id,
            UInt8.toJava(mutatingSelf.ui8, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui8q_id,
            OptionalConverter<UInt8>.toJava(mutatingSelf.ui8q, env: env)
        )
        try env.SetShortField(
            this, Self._java_ui16_id,
            UInt16.toJava(mutatingSelf.ui16, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui16q_id,
            OptionalConverter<UInt16>.toJava(mutatingSelf.ui16q, env: env)
        )
        try env.SetIntField(
            this, Self._java_ui32_id,
            UInt32.toJava(mutatingSelf.ui32, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui32q_id,
            OptionalConverter<UInt32>.toJava(mutatingSelf.ui32q, env: env)
        )
        try env.SetLongField(
            this, Self._java_ui64_id,
            UInt64.toJava(mutatingSelf.ui64, env: env)
        )
        try env.SetObjectField(
            this, Self._java_ui64q_id,
            OptionalConverter<UInt64>.toJava(mutatingSelf.ui64q, env: env)
        )
        try env.SetLongField(
            this, Self._java_ui_id,
            UInt.toJava(mutatingSelf.ui, env: env)
        )
        try env.SetObjectField(
            this, Self._java_uiq_id,
            OptionalConverter<UInt>.toJava(mutatingSelf.uiq, env: env)
        )
        try env.SetByteField(
            this, Self._java_i8_id,
            Int8.toJava(mutatingSelf.i8, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i8q_id,
            OptionalConverter<Int8>.toJava(mutatingSelf.i8q, env: env)
        )
        try env.SetShortField(
            this, Self._java_i16_id,
            Int16.toJava(mutatingSelf.i16, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i16q_id,
            OptionalConverter<Int16>.toJava(mutatingSelf.i16q, env: env)
        )
        try env.SetIntField(
            this, Self._java_i32_id,
            Int32.toJava(mutatingSelf.i32, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i32q_id,
            OptionalConverter<Int32>.toJava(mutatingSelf.i32q, env: env)
        )
        try env.SetLongField(
            this, Self._java_i64_id,
            Int64.toJava(mutatingSelf.i64, env: env)
        )
        try env.SetObjectField(
            this, Self._java_i64q_id,
            OptionalConverter<Int64>.toJava(mutatingSelf.i64q, env: env)
        )
        try env.SetLongField(
            this, Self._java_i_id,
            Int.toJava(mutatingSelf.i, env: env)
        )
        try env.SetObjectField(
            this, Self._java_iq_id,
            OptionalConverter<Int>.toJava(mutatingSelf.iq, env: env)
        )
        try env.SetFloatField(
            this, Self._java_f_id,
            Float.toJava(mutatingSelf.f, env: env)
        )
        try env.SetObjectField(
            this, Self._java_fq_id,
            OptionalConverter<Float>.toJava(mutatingSelf.fq, env: env)
        )
        try env.SetDoubleField(
            this, Self._java_d_id,
            Double.toJava(mutatingSelf.d, env: env)
        )
        try env.SetObjectField(
            this, Self._java_dq_id,
            OptionalConverter<Double>.toJava(mutatingSelf.dq, env: env)
        )
        return result
    }
}
