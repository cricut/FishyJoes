// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.AttributedStrings: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for TestAPI.AttributedStrings")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        // Uninhabited type
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AttributedStrings"))
    }
}
