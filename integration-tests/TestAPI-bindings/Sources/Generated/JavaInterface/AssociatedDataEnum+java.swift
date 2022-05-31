// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension AssociatedDataEnum: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    static var _java_thing: jclass!
    static var _java_thing_init: jmethodID!
    static var _java_thing_field_value: jfieldID!
    static var _java_other: jclass!
    static var _java_other_init: jmethodID!
    static var _java_other_field_0: jfieldID!
    static var _java_other_field_1: jfieldID!
    static var _java_bar: jclass!
    static var _java_bar_init: jmethodID!
    static var _java_bar_field_named: jfieldID!
    static var _java_bar_field_1: jfieldID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        if env.IsInstanceOf(value, Self._java_thing) {
            return .thing(
                value: try Int.fromJava(env.GetLongField(value, Self._java_thing_field_value), env: env)
            )
        }
        if env.IsInstanceOf(value, Self._java_other) {
            return .other(
                try Swift.String.fromJava(env.GetObjectField(value, Self._java_other_field_0), env: env),
                try Int.fromJava(env.GetLongField(value, Self._java_other_field_1), env: env)
            )
        }
        if env.IsInstanceOf(value, Self._java_bar) {
            return .bar(
                named: try Swift.String.fromJava(env.GetObjectField(value, Self._java_bar_field_named), env: env),
                try AssociatedDataEnum.fromJava(env.GetObjectField(value, Self._java_bar_field_1), env: env)
            )
        }
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for AssociatedDataEnum")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        case let .thing(value):
            return try env.NewObject(
                Self._java_thing,
                Self._java_thing_init,
                jvalue(Int.toJava(value, env: env))
            )
        case let .other(unnamed, _1):
            return try env.NewObject(
                Self._java_other,
                Self._java_other_init,
                jvalue(Swift.String.toJava(unnamed, env: env)),
                jvalue(Int.toJava(_1, env: env))
            )
        case let .bar(named, _1):
            return try env.NewObject(
                Self._java_bar,
                Self._java_bar_init,
                jvalue(Swift.String.toJava(named, env: env)),
                jvalue(AssociatedDataEnum.toJava(_1, env: env))
            )
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AssociatedDataEnum"))
        _java_thing = try env.globalRef(env.FindClass("com/cricut/testapi/AssociatedDataEnum$Thing"))
        _java_thing_init = try env.GetMethodID(_java_thing, "<init>", "(J)V")
        _java_thing_field_value = try env.GetFieldID(_java_thing, "value", "J")
        _java_other = try env.globalRef(env.FindClass("com/cricut/testapi/AssociatedDataEnum$Other"))
        _java_other_init = try env.GetMethodID(_java_other, "<init>", "(Ljava/lang/String;J)V")
        _java_other_field_0 = try env.GetFieldID(_java_other, "unnamed", "Ljava/lang/String;")
        _java_other_field_1 = try env.GetFieldID(_java_other, "_1", "J")
        _java_bar = try env.globalRef(env.FindClass("com/cricut/testapi/AssociatedDataEnum$Bar"))
        _java_bar_init = try env.GetMethodID(_java_bar, "<init>", "(Ljava/lang/String;Lcom/cricut/testapi/AssociatedDataEnum;)V")
        _java_bar_field_named = try env.GetFieldID(_java_bar, "named", "Ljava/lang/String;")
        _java_bar_field_1 = try env.GetFieldID(_java_bar, "_1", "Lcom/cricut/testapi/AssociatedDataEnum;")
    }
}
