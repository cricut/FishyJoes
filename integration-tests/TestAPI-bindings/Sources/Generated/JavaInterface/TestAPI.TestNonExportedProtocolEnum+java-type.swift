// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.TestNonExportedProtocolEnum: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    static var _java_hogehoge: jclass!
    static var _java_hogehoge_INSTANCE: jfieldID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        if env.IsInstanceOf(value, Self._java_hogehoge) {
            return Self.hogehoge
        }
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for TestAPI.TestNonExportedProtocolEnum")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        case .hogehoge:
            return env.GetStaticObjectField(Self._java_hogehoge, Self._java_hogehoge_INSTANCE)
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestNonExportedProtocolEnum"))
        _java_hogehoge = try env.globalRef(env.FindClass("com/cricut/testapi/TestNonExportedProtocolEnum$Hogehoge"))
        _java_hogehoge_INSTANCE = try env.GetStaticFieldID(_java_hogehoge, "INSTANCE", "Lcom/cricut/testapi/TestNonExportedProtocolEnum$Hogehoge;")
    }
}
