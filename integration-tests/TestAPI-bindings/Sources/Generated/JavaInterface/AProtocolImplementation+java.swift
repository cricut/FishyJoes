// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension AProtocolImplementation: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_foo_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            foo: try Swift.String.fromJava(
                env.GetObjectField(value, Self._java_foo_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(Swift.String.toJava(value.foo, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AProtocolImplementation"))
        _java_foo_id = try env.GetFieldID(javaClass, "foo", "Ljava/lang/String;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/String;)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetObjectField(
            this, Self._java_foo_id,
            Swift.String.toJava(mutatingSelf.foo, env: env)
        )
        return result
    }
}
