// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension AttributedStringASDF.AttributeMergePolicy: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    static var _java_keepNew: jclass!
    static var _java_keepNew_INSTANCE: jfieldID!
    static var _java_keepCurrent: jclass!
    static var _java_keepCurrent_INSTANCE: jfieldID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        if env.IsInstanceOf(value, Self._java_keepNew) {
            return Self.keepNew
        }
        if env.IsInstanceOf(value, Self._java_keepCurrent) {
            return Self.keepCurrent
        }
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for AttributedStringASDF.AttributeMergePolicy")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        case .keepNew:
            return env.GetStaticObjectField(Self._java_keepNew, Self._java_keepNew_INSTANCE)
        case .keepCurrent:
            return env.GetStaticObjectField(Self._java_keepCurrent, Self._java_keepCurrent_INSTANCE)
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AttributedString$AttributeMergePolicy"))
        _java_keepNew = try env.globalRef(env.FindClass("com/cricut/testapi/AttributedString$AttributeMergePolicy$KeepNew"))
        _java_keepNew_INSTANCE = try env.GetStaticFieldID(_java_keepNew, "INSTANCE", "Lcom/cricut/testapi/AttributedString$AttributeMergePolicy$KeepNew;")
        _java_keepCurrent = try env.globalRef(env.FindClass("com/cricut/testapi/AttributedString$AttributeMergePolicy$KeepCurrent"))
        _java_keepCurrent_INSTANCE = try env.GetStaticFieldID(_java_keepCurrent, "INSTANCE", "Lcom/cricut/testapi/AttributedString$AttributeMergePolicy$KeepCurrent;")
    }
}
