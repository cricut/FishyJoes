// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _JavaTestDefaultComputedProperties: TestAPI.TestDefaultComputedProperties {
    let _javaWitness: JavaReference

    static var _nootGetMethodID: jmethodID?
    public var noot: Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try Swift.Int.fromJava(
                env.CallLongMethod(_javaWitness.object, Self._nootGetMethodID),
                env: env
            )
        }
    }

    static var _plutoGetMethodID: jmethodID?
    public var pluto: String {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try Swift.String.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._plutoGetMethodID),
                env: env
            )
        }
    }
}

extension TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter: JavaConverter {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static var externalCompanionClass: jclass?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaTestDefaultComputedProperties(_javaWitness: try JavaReference(local: value, env: env))
    }
    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        try env.NewObject(
            externalWitnessClass,
            externalWitnessConstructor,
            jvalue(pointer: Box(value).retainedOpaque())
        )
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestDefaultComputedProperties"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_TestDefaultComputedProperties"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaTestDefaultComputedProperties._nootGetMethodID = try env.GetMethodID(javaClass, "getNoot", "()J")
        _JavaTestDefaultComputedProperties._plutoGetMethodID = try env.GetMethodID(javaClass, "getPlutonic", "()Ljava/lang/String;")
        externalCompanionClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestDefaultComputedProperties$Companion"))
    }
}
