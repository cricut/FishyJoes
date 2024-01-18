// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.AssociatedDataEnum: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    static var _java_thing: jclass!
    static var _java_thing_init: jmethodID!
    static var _java_thing_field_value: jfieldID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        if env.IsInstanceOf(value, Self._java_thing) {
            return Self.thing(
                value: try Swift.Int.fromJava(env.GetLongField(value, Self._java_thing_field_value), env: env)
            )
        }
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for TestAPI.AssociatedDataEnum")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        case let .thing(value):
            return try env.NewObject(
                Self._java_thing,
                Self._java_thing_init,
                jvalue(Swift.Int.toJava(value, env: env))
            )
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AssociatedDataEnum"))
        _java_thing = try env.globalRef(env.FindClass("com/cricut/testapi/AssociatedDataEnum$Thing"))
        _java_thing_init = try env.GetMethodID(_java_thing, "<init>", "(J)V")
        _java_thing_field_value = try env.GetFieldID(_java_thing, "value", "J")
    }
}
