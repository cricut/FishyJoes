// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.AsyncFunctions.TheError: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> TestAPI.AsyncFunctions.TheError {
        try Box<TestAPI.AsyncFunctions.TheError>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: TestAPI.AsyncFunctions.TheError, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AsyncFunctions$TheError"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout TestAPI.AsyncFunctions.TheError) throws -> R) throws -> R {
        try body(&Box<TestAPI.AsyncFunctions.TheError>.fromJava(this, env: env).value)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout TestAPI.AsyncFunctions.TheError, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<TestAPI.AsyncFunctions.TheError>.fromJava(this, env: env).value, &env)
    }
}
