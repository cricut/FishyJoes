// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Structs.ReferenceStruct: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        try Box<Structs.ReferenceStruct>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        try body(&Box<Structs.ReferenceStruct>.fromJava(this, env: env).value)
    }
    public static func javaSetup(env: Env) throws {
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Structs$ReferenceStruct"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    static let _javaEquals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                Structs.ReferenceStruct.fromJava(lhs, env: _javaEnv) == Structs.ReferenceStruct.fromJava(rhs, env: _javaEnv),
                env: _javaEnv
            )
        }
    }
}
