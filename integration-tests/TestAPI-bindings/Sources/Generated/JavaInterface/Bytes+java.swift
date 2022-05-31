// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Bytes: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        try Box<Bytes>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Bytes"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        try body(&Box<Bytes>.fromJava(this, env: env).value)
    }
}
