// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.TestProtocolClass: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> TestAPI.TestProtocolClass {
        try Box<TestAPI.TestProtocolClass>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: TestAPI.TestProtocolClass, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout TestAPI.TestProtocolClass, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<TestAPI.TestProtocolClass>.fromJava(this, env: env).value, &env)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestProtocolClass"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout TestAPI.TestProtocolClass) throws -> R) throws -> R {
        try body(&Box<TestAPI.TestProtocolClass>.fromJava(this, env: env).value)
    }
}
