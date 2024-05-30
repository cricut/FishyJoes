// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.TestDefaultComputedPropertiesStruct: JavaMutator {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_spam_id: jfieldID!
    private static var _java_noot_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            spam: try Swift.Bool.fromJava(
                env.GetBooleanField(value, Self._java_spam_id),
                env: env
            ),
            noot: try Swift.Int.fromJava(
                env.GetLongField(value, Self._java_noot_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(Swift.Bool.toJava(value.spam, env: env)),
            jvalue(Swift.Int.toJava(value.noot, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestDefaultComputedPropertiesStruct"))
        _java_spam_id = try env.GetFieldID(javaClass, "spam", "Z")
        _java_noot_id = try env.GetFieldID(javaClass, "noot", "J")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(ZJ)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetBooleanField(
            this, Self._java_spam_id,
            Swift.Bool.toJava(mutatingSelf.spam, env: env)
        )
        try env.SetLongField(
            this, Self._java_noot_id,
            Swift.Int.toJava(mutatingSelf.noot, env: env)
        )
        return result
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout Self, inout Env) async throws -> R) async throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try await body(&mutatingSelf, &env)
        try env.SetBooleanField(
            this, Self._java_spam_id,
            Swift.Bool.toJava(mutatingSelf.spam, env: env)
        )
        try env.SetLongField(
            this, Self._java_noot_id,
            Swift.Int.toJava(mutatingSelf.noot, env: env)
        )
        return result
    }
}
