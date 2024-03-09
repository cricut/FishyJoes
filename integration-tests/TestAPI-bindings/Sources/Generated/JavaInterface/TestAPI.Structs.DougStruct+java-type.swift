// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.Structs.DougStruct: JavaMutator {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_str_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            str: try Swift.String.fromJava(
                env.GetObjectField(value, Self._java_str_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(Swift.String.toJava(value.str, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Structs$DougStruct"))
        _java_str_id = try env.GetFieldID(javaClass, "str", "Ljava/lang/String;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/String;)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetObjectField(
            this, Self._java_str_id,
            Swift.String.toJava(mutatingSelf.str, env: env)
        )
        return result
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout Self, inout Env) async throws -> R) async throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try await body(&mutatingSelf, &env)
        try env.SetObjectField(
            this, Self._java_str_id,
            Swift.String.toJava(mutatingSelf.str, env: env)
        )
        return result
    }
}
