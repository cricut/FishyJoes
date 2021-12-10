// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Primitives.PrimitiveHolder: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "Lcom/cricut/testapi/Primitives$PrimitiveHolder;" }
    private static var _java_b_id: jfieldID!
    private static var _java_bq_id: jfieldID!
    private static var _java_ui8_id: jfieldID!
    private static var _java_ui8q_id: jfieldID!
    private static var _java_ui16_id: jfieldID!
    private static var _java_ui16q_id: jfieldID!
    private static var _java_ui32_id: jfieldID!
    private static var _java_ui32q_id: jfieldID!
    private static var _java_i8_id: jfieldID!
    private static var _java_i8q_id: jfieldID!
    private static var _java_i16_id: jfieldID!
    private static var _java_i16q_id: jfieldID!
    private static var _java_i32_id: jfieldID!
    private static var _java_i32q_id: jfieldID!
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
            jvalue(Int8.toJava(value.i8, env: env)),
            jvalue(OptionalConverter<Int8>.toJava(value.i8q, env: env)),
            jvalue(Int16.toJava(value.i16, env: env)),
            jvalue(OptionalConverter<Int16>.toJava(value.i16q, env: env)),
            jvalue(Int32.toJava(value.i32, env: env)),
            jvalue(OptionalConverter<Int32>.toJava(value.i32q, env: env)),
            jvalue(Float.toJava(value.f, env: env)),
            jvalue(OptionalConverter<Float>.toJava(value.fq, env: env)),
            jvalue(Double.toJava(value.d, env: env)),
            jvalue(OptionalConverter<Double>.toJava(value.dq, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Primitives$PrimitiveHolder"))
        _java_b_id = try env.GetFieldID(javaClass, "b", "Z")
        _java_bq_id = try env.GetFieldID(javaClass, "bq", "Ljava/lang/Boolean;")
        _java_ui8_id = try env.GetFieldID(javaClass, "ui8", "B")
        _java_ui8q_id = try env.GetFieldID(javaClass, "ui8q", "Lkotlin/UByte;")
        _java_ui16_id = try env.GetFieldID(javaClass, "ui16", "S")
        _java_ui16q_id = try env.GetFieldID(javaClass, "ui16q", "Lkotlin/UShort;")
        _java_ui32_id = try env.GetFieldID(javaClass, "ui32", "I")
        _java_ui32q_id = try env.GetFieldID(javaClass, "ui32q", "Lkotlin/UInt;")
        _java_i8_id = try env.GetFieldID(javaClass, "i8", "B")
        _java_i8q_id = try env.GetFieldID(javaClass, "i8q", "Ljava/lang/Byte;")
        _java_i16_id = try env.GetFieldID(javaClass, "i16", "S")
        _java_i16q_id = try env.GetFieldID(javaClass, "i16q", "Ljava/lang/Short;")
        _java_i32_id = try env.GetFieldID(javaClass, "i32", "I")
        _java_i32q_id = try env.GetFieldID(javaClass, "i32q", "Ljava/lang/Integer;")
        _java_f_id = try env.GetFieldID(javaClass, "f", "F")
        _java_fq_id = try env.GetFieldID(javaClass, "fq", "Ljava/lang/Float;")
        _java_d_id = try env.GetFieldID(javaClass, "d", "D")
        _java_dq_id = try env.GetFieldID(javaClass, "dq", "Ljava/lang/Double;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(ZLjava/lang/Boolean;BLkotlin/UByte;SLkotlin/UShort;ILkotlin/UInt;BLjava/lang/Byte;SLjava/lang/Short;ILjava/lang/Integer;FLjava/lang/Float;DLjava/lang/Double;)V")
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
