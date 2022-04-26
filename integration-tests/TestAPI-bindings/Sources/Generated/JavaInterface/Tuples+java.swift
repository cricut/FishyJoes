// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Tuples: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        throw JNIError(message: "invalid enum \(try env.javaDescription(value)) for Tuples")
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        switch value {
        }
    }

    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Tuples"))
    }
}
