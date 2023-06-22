// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension AttributedStringASDF.UnicodeScalarView: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedStringASDF.UnicodeScalarView {
        try Box<AttributedStringASDF.UnicodeScalarView>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: AttributedStringASDF.UnicodeScalarView, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AttributedString$UnicodeScalarView"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedStringASDF.UnicodeScalarView) throws -> R) throws -> R {
        try body(&Box<AttributedStringASDF.UnicodeScalarView>.fromJava(this, env: env).value)
    }
}
