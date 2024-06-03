// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _JavaTestDifferingExportNameProtocol: TestAPI.TestDifferingExportNameProtocol {
    let _javaWitness: JavaReference

    static var _tataGetMethodID: jmethodID?
    public var tata: Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try Swift.Int.fromJava(
                env.CallLongMethod(_javaWitness.object, Self._tataGetMethodID),
                env: env
            )
        }
    }
}

extension TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter: JavaConverter {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static var externalCompanionClass: jclass?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaTestDifferingExportNameProtocol(_javaWitness: try JavaReference(local: value, env: env))
    }
    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        try env.NewObject(
            externalWitnessClass,
            externalWitnessConstructor,
            jvalue(pointer: Box(value).retainedOpaque())
        )
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestDifferingExportNameProtocolDiffy"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_TestDifferingExportNameProtocolDiffy"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaTestDifferingExportNameProtocol._tataGetMethodID = try env.GetMethodID(javaClass, "getTata", "()J")
        externalCompanionClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestDifferingExportNameProtocolDiffy$Companion"))
    }
}
