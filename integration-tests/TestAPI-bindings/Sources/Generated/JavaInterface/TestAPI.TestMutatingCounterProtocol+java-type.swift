// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _JavaTestMutatingCounterProtocol: TestAPI.TestMutatingCounterProtocol {
    let _javaWitness: JavaReference

    static var _countGetMethodID: jmethodID?
    public var count: Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try Swift.Int.fromJava(
                env.CallLongMethod(_javaWitness.object, Self._countGetMethodID),
                env: env
            )
        }
    }

    static var _tickMethodID: jmethodID?
    public func tick() throws {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try FishyJoesCommonRuntime.VoidConverter.fromJava(
            env.CallVoidMethod(
                _javaWitness.object,
                Self._tickMethodID
            ),
            env: env
        )
    }

    static var _witnessMethodID: jmethodID?
    public func witness() throws -> TestMutatingCounterProtocol {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._witnessMethodID
            ),
            env: env
        )
    }

    static var _tickTwiceMethodID: jmethodID?
    public func tickTwice() throws {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try FishyJoesCommonRuntime.VoidConverter.fromJava(
            env.CallVoidMethod(
                _javaWitness.object,
                Self._tickTwiceMethodID
            ),
            env: env
        )
    }
}

extension TestAPI_CommonInterface._TestMutatingCounterProtocolConverter: JavaMutator {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static var externalCompanionClass: jclass?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaTestMutatingCounterProtocol(_javaWitness: try JavaReference(local: value, env: env))
    }
    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        try env.NewObject(
            externalWitnessClass,
            externalWitnessConstructor,
            jvalue(pointer: Box(value).retainedOpaque())
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout SwiftType) throws -> R) throws -> R {
        if env.IsInstanceOf(this, AnyBox.javaClass) {
            let box = try Box<SwiftType>.fromJava(this, env: env)
            return try body(&box.value)
        }
        var javaWitness: any _TestMutatingCounterProtocolConverter.SwiftType = _JavaTestMutatingCounterProtocol(_javaWitness: try JavaReference(local: this, env: env))
        return try body(&javaWitness)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<SwiftType>.fromJava(this, env: env).value, &env)
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestMutatingCounterProtocol"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_TestMutatingCounterProtocol"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaTestMutatingCounterProtocol._countGetMethodID = try env.GetMethodID(javaClass, "getCount", "()J")
        _JavaTestMutatingCounterProtocol._tickMethodID = try env.GetMethodID(javaClass, "tick", "()V")
        _JavaTestMutatingCounterProtocol._witnessMethodID = try env.GetMethodID(javaClass, "witness", "()Lcom/cricut/testapi/TestMutatingCounterProtocol;")
        externalCompanionClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestMutatingCounterProtocol$Companion"))
        _JavaTestMutatingCounterProtocol._tickTwiceMethodID = try env.GetMethodID(javaClass, "tickTwice", "()V")
    }
}
