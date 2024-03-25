// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.TestAsyncFunctionsStruct: JavaMutator {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_const42_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            const42: try AsyncFunction0Converter<Swift.Int>.fromJava(
                env.GetObjectField(value, Self._java_const42_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(AsyncFunction0Converter<Swift.Int>.toJava(value.const42, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestAsyncFunctionsStruct"))
        _java_const42_id = try env.GetFieldID(javaClass, "const42", "Lkotlin/jvm/functions/Function1;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(Lkotlin/jvm/functions/Function1;)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetObjectField(
            this, Self._java_const42_id,
            AsyncFunction0Converter<Swift.Int>.toJava(mutatingSelf.const42, env: env)
        )
        return result
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout Self, inout Env) async throws -> R) async throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try await body(&mutatingSelf, &env)
        try env.SetObjectField(
            this, Self._java_const42_id,
            AsyncFunction0Converter<Swift.Int>.toJava(mutatingSelf.const42, env: env)
        )
        return result
    }
}
