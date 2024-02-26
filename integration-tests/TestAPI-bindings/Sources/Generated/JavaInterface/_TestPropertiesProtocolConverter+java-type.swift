// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _JavaTestPropertiesProtocol: TestAPI.TestPropertiesProtocol {
    let _javaWitness: JavaReference

    static var _corgeGetMethodID: jmethodID?
    public var corge: String {
        get throws {
            let env = try _javaWitness.currentThreadEnv()
            return try Swift.String.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._corgeGetMethodID),
                env: env
            )
        }
    }

    static var _frobGetMethodID: jmethodID?
    public var frob: Array<Double> {
        get throws {
            let env = try _javaWitness.currentThreadEnv()
            return try ArrayConverter<Swift.Double>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._frobGetMethodID),
                env: env
            )
        }
    }
}

extension _TestPropertiesProtocolConverter: JavaMutator {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaTestPropertiesProtocol(_javaWitness: try JavaReference(local: value, env: env))
    }
    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        try env.NewObject(
            externalWitnessClass,
            externalWitnessConstructor,
            jvalue(pointer: Box(value).retainedOpaque())
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout SwiftType) throws -> R) throws -> R {
        try body(&Box<SwiftType>.fromJava(this, env: env).value)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<SwiftType>.fromJava(this, env: env).value, &env)
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestPropertiesProtocol"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_TestPropertiesProtocol"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaTestPropertiesProtocol._corgeGetMethodID = try env.GetMethodID(javaClass, "getCorge", "()Ljava/lang/String;")
        _JavaTestPropertiesProtocol._frobGetMethodID = try env.GetMethodID(javaClass, "getFrob", "()Ljava/util/List;")
    }
}
