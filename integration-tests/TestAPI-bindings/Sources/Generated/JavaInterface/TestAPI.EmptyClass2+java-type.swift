// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.EmptyClass2: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> TestAPI.EmptyClass2 {
        try Box<TestAPI.EmptyClass2>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: TestAPI.EmptyClass2, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout TestAPI.EmptyClass2, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<TestAPI.EmptyClass2>.fromJava(this, env: env).value, &env)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/EmptyClass2"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout TestAPI.EmptyClass2) throws -> R) throws -> R {
        try body(&Box<TestAPI.EmptyClass2>.fromJava(this, env: env).value)
    }
    static let _javaEquals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                TestAPI.EmptyClass2.fromJava(lhs, env: _javaEnv) == TestAPI.EmptyClass2.fromJava(rhs, env: _javaEnv),
                env: _javaEnv
            )
        }
    }
    static let _javaHash: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?
    ) -> Int32.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Int32.toJava(
                Int32(truncatingIfNeeded: TestAPI.EmptyClass2.fromJava(_javaThis, env: _javaEnv).hashValue),
                env: _javaEnv
            )
        }
    }
}
