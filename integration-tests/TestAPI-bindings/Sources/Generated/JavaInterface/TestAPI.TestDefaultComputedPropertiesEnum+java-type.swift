// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.TestDefaultComputedPropertiesEnum: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    static var _java_qux: jclass!
    static var _java_qux_INSTANCE: jfieldID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        if env.IsInstanceOf(value, Self._java_qux) {
            return Self.qux
        }
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for TestAPI.TestDefaultComputedPropertiesEnum")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        case .qux:
            return env.GetStaticObjectField(Self._java_qux, Self._java_qux_INSTANCE)
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestDefaultComputedPropertiesEnum"))
        _java_qux = try env.globalRef(env.FindClass("com/cricut/testapi/TestDefaultComputedPropertiesEnum$Qux"))
        _java_qux_INSTANCE = try env.GetStaticFieldID(_java_qux, "INSTANCE", "Lcom/cricut/testapi/TestDefaultComputedPropertiesEnum$Qux;")
    }
}
