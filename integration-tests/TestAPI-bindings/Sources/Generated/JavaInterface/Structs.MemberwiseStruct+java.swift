// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Structs.MemberwiseStruct: JavaMutator {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_immutable_id: jfieldID!
    private static var _java_mutable_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            immutable: try Swift.String.fromJava(
                env.GetObjectField(value, Self._java_immutable_id),
                env: env
            ),
            mutable: try Swift.String.fromJava(
                env.GetObjectField(value, Self._java_mutable_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(Swift.String.toJava(value.immutable, env: env)),
            jvalue(Swift.String.toJava(value.mutable, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Structs$MemberwiseStruct"))
        _java_immutable_id = try env.GetFieldID(javaClass, "immutable", "Ljava/lang/String;")
        _java_mutable_id = try env.GetFieldID(javaClass, "mutable", "Ljava/lang/String;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/String;Ljava/lang/String;)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetObjectField(
            this, Self._java_immutable_id,
            Swift.String.toJava(mutatingSelf.immutable, env: env)
        )
        try env.SetObjectField(
            this, Self._java_mutable_id,
            Swift.String.toJava(mutatingSelf.mutable, env: env)
        )
        return result
    }
}
