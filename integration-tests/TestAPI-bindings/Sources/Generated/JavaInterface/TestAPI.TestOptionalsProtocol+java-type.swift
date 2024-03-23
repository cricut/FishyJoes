// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _JavaTestOptionalsProtocol: TestAPI.TestOptionalsProtocol {
    let _javaWitness: JavaReference

    static var _flarpGetMethodID: jmethodID?
    public var flarp: Optional<String> {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try OptionalConverter<Swift.String>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._flarpGetMethodID),
                env: env
            )
        }
    }

    static var _wombatMethodID: jmethodID?
    public func wombat(zxc: Optional<Int>) throws -> Optional<Double> {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try OptionalConverter<Swift.Double>.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._wombatMethodID,
                jvalue(try OptionalConverter<Swift.Int>.toJava(zxc, env: env))
            ),
            env: env
        )
    }

    static var _spqrMethodID: jmethodID?
    public func spqr(_ pippo: AssociatedDataEnum) throws -> Int {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.Int.fromJava(
            env.CallLongMethod(
                _javaWitness.object,
                Self._spqrMethodID,
                jvalue(try TestAPI.AssociatedDataEnum.toJava(pippo, env: env))
            ),
            env: env
        )
    }
}

extension TestAPI_CommonInterface._TestOptionalsProtocolConverter: JavaMutator {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaTestOptionalsProtocol(_javaWitness: try JavaReference(local: value, env: env))
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
        var javaWitness = _JavaTestOptionalsProtocol(_javaWitness: try JavaReference(local: this, env: env)) as SwiftType
        return try body(&javaWitness)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<SwiftType>.fromJava(this, env: env).value, &env)
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestOptionalsProtocol"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_TestOptionalsProtocol"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaTestOptionalsProtocol._flarpGetMethodID = try env.GetMethodID(javaClass, "getFlarp", "()Ljava/lang/String;")
        _JavaTestOptionalsProtocol._wombatMethodID = try env.GetMethodID(javaClass, "wombat", "(Ljava/lang/Long;)Ljava/lang/Double;")
        _JavaTestOptionalsProtocol._spqrMethodID = try env.GetMethodID(javaClass, "spqr", "(Lcom/cricut/testapi/AssociatedDataEnum;)J")
    }
}
