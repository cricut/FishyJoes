// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension SimpleEnum: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    static var _java_red: jclass!
    static var _java_red_INSTANCE: jfieldID!
    static var _java_green: jclass!
    static var _java_green_INSTANCE: jfieldID!
    static var _java_blue: jclass!
    static var _java_blue_INSTANCE: jfieldID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        if env.IsInstanceOf(value, Self._java_red) {
            return Self.red
        }
        if env.IsInstanceOf(value, Self._java_green) {
            return Self.green
        }
        if env.IsInstanceOf(value, Self._java_blue) {
            return Self.blue
        }
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for SimpleEnum")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        case .red:
            return env.GetStaticObjectField(Self._java_red, Self._java_red_INSTANCE)
        case .green:
            return env.GetStaticObjectField(Self._java_green, Self._java_green_INSTANCE)
        case .blue:
            return env.GetStaticObjectField(Self._java_blue, Self._java_blue_INSTANCE)
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/SimpleEnum"))
        _java_red = try env.globalRef(env.FindClass("com/cricut/testapi/SimpleEnum$Red"))
        _java_red_INSTANCE = try env.GetStaticFieldID(_java_red, "INSTANCE", "Lcom/cricut/testapi/SimpleEnum$Red;")
        _java_green = try env.globalRef(env.FindClass("com/cricut/testapi/SimpleEnum$Green"))
        _java_green_INSTANCE = try env.GetStaticFieldID(_java_green, "INSTANCE", "Lcom/cricut/testapi/SimpleEnum$Green;")
        _java_blue = try env.globalRef(env.FindClass("com/cricut/testapi/SimpleEnum$Blue"))
        _java_blue_INSTANCE = try env.GetStaticFieldID(_java_blue, "INSTANCE", "Lcom/cricut/testapi/SimpleEnum$Blue;")
    }
}
