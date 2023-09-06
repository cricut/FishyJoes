// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    static var _java_thing: jclass!
    static var _java_thing_INSTANCE: jfieldID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        if env.IsInstanceOf(value, Self._java_thing) {
            return Self.thing
        }
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        case .thing:
            return env.GetStaticObjectField(Self._java_thing, Self._java_thing_INSTANCE)
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/UnicodeScalar_PuttingTypesIntoQuestionablePlaces"))
        _java_thing = try env.globalRef(env.FindClass("com/cricut/testapi/UnicodeScalar_PuttingTypesIntoQuestionablePlaces$Thing"))
        _java_thing_INSTANCE = try env.GetStaticFieldID(_java_thing, "INSTANCE", "Lcom/cricut/testapi/UnicodeScalar_PuttingTypesIntoQuestionablePlaces$Thing;")
    }
}
