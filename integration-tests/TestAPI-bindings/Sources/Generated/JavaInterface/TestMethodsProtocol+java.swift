// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import CommonInterface
import FishyJoesJavaRuntime
import Foundation
import TestAPI

struct _JavaTestMethodsProtocol: TestMethodsProtocol {
    let _javaWitness: JavaReference

    static var _fooMethodID: jmethodID?
    public func foo() {
        let env = try! _javaWitness.currentThreadEnv()
        return try! FishyJoesCommonRuntime.VoidConverter.fromJava(
            env.CallVoidMethod(
                _javaWitness.object,
                Self._fooMethodID
            ),
            env: env
        )
    }

    static var _barMethodID: jmethodID?
    public func bar() -> Bool {
        let env = try! _javaWitness.currentThreadEnv()
        return try! Swift.Bool.fromJava(
            env.CallBooleanMethod(
                _javaWitness.object,
                Self._barMethodID
            ),
            env: env
        )
    }

    static var _bazMethodID: jmethodID?
    public func baz(qux: Bool) {
        let env = try! _javaWitness.currentThreadEnv()
        return try! FishyJoesCommonRuntime.VoidConverter.fromJava(
            env.CallVoidMethod(
                _javaWitness.object,
                Self._bazMethodID,
                jvalue(try Swift.Bool.toJava(qux, env: env))
            ),
            env: env
        )
    }

    static var _garplyMethodID: jmethodID?
    public func garply(_ _1: String) -> String {
        let env = try! _javaWitness.currentThreadEnv()
        return try! Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._garplyMethodID,
                jvalue(try Swift.String.toJava(_1, env: env))
            ),
            env: env
        )
    }

    static var _xyzzyMethodID: jmethodID?
    public func xyzzy(thud: Int, grault: Array<Double>) -> String {
        let env = try! _javaWitness.currentThreadEnv()
        return try! Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._xyzzyMethodID,
                jvalue(try Swift.Int.toJava(thud, env: env)),
                jvalue(try ArrayConverter<Swift.Double>.toJava(grault, env: env))
            ),
            env: env
        )
    }

    static var _plughMethodID: jmethodID?
    public func plugh(fred: (Bool, Double, Array<String>)) -> (Bool, Int, String) {
        let env = try! _javaWitness.currentThreadEnv()
        return try! Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._plughMethodID,
                jvalue(try Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.toJava(fred, env: env))
            ),
            env: env
        )
    }
}

extension _TestMethodsProtocolConverter: JavaMutator {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaTestMethodsProtocol(_javaWitness: try JavaReference(local: value, env: env))
    }
    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        try env.NewObject(
            externalWitnessClass,
            externalWitnessConstructor,
            jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout SwiftType) throws -> R) throws -> R {
        try body(&Box<SwiftType>.fromJava(this, env: env).value)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<SwiftType>.fromJava(this, env: env).value, &env)
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestMethodsProtocol"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_TestMethodsProtocol"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaTestMethodsProtocol._fooMethodID = try env.GetMethodID(javaClass, "foo", "()V")
        _JavaTestMethodsProtocol._barMethodID = try env.GetMethodID(javaClass, "bar", "()Z")
        _JavaTestMethodsProtocol._bazMethodID = try env.GetMethodID(javaClass, "baz", "(Z)V")
        _JavaTestMethodsProtocol._garplyMethodID = try env.GetMethodID(javaClass, "garply", "(Ljava/lang/String;)Ljava/lang/String;")
        _JavaTestMethodsProtocol._xyzzyMethodID = try env.GetMethodID(javaClass, "xyzzy", "(JLjava/util/List;)Ljava/lang/String;")
        _JavaTestMethodsProtocol._plughMethodID = try env.GetMethodID(javaClass, "plugh", "(Lkotlin/Triple;)Lkotlin/Triple;")
    }
}
