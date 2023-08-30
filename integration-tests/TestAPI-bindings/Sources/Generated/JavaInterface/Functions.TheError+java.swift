// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Functions.TheError: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Functions.TheError {
        try Box<Functions.TheError>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: Functions.TheError, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Functions$TheError"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Functions.TheError) throws -> R) throws -> R {
        try body(&Box<Functions.TheError>.fromJava(this, env: env).value)
    }
    
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Functions.TheError) async throws -> R) async throws -> R {
        try await body(&Box<Functions.TheError>.fromJava(this, env: env).value)
    }
}
