// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _JavaAProtocol: TestAPI.AProtocol {
    let _javaWitness: JavaReference

    static var _fooGetMethodID: jmethodID?
    public var foo: Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try Swift.Int.fromJava(
                env.CallLongMethod(_javaWitness.object, Self._fooGetMethodID),
                env: env
            )
        }
    }

    static var _incrementMethodID: jmethodID?
    public func increment() throws {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try FishyJoesCommonRuntime.VoidConverter.fromJava(
            env.CallVoidMethod(
                _javaWitness.object,
                Self._incrementMethodID
            ),
            env: env
        )
    }
}

extension TestAPI_CommonInterface._AProtocolConverter: JavaMutator {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaAProtocol(_javaWitness: try JavaReference(local: value, env: env))
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
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AProtocol"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_AProtocol"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaAProtocol._fooGetMethodID = try env.GetMethodID(javaClass, "getFoo", "()J")
        _JavaAProtocol._incrementMethodID = try env.GetMethodID(javaClass, "increment", "()V")
    }
}
