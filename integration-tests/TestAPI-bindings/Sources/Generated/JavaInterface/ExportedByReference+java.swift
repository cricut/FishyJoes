// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension ExportedByReference: JavaMutator {
    public static var javaClass: jclass?
    private static var _refFieldID: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        let longRef = UInt(env.GetLongField(value, _refFieldID))
        return try Box<ExportedByReference>.takeUnretainedOpaque(javaNonNull(UnsafeMutablePointer(bitPattern: longRef))).value
    }
    static let _javaFinalizer: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> Void = { env, this in
        FishyJoesJavaRuntime.callbackBody(env) { env in
            let longRef = UInt(env.GetLongField(this, _refFieldID))
            Box<ExportedByReference>.releaseOpaque(try javaNonNull(UnsafeMutablePointer(bitPattern: longRef)))
        }
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/ExportedByReference"))
        _refFieldID = try env.GetFieldID(javaClass, "_swiftReference", "J")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        let longRef = UInt(env.GetLongField(this, _refFieldID))
        return try body(&Box<ExportedByReference>.takeUnretainedOpaque(javaNonNull(UnsafeMutablePointer(bitPattern: longRef))).value)
    }
    static let _javaEquals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                ExportedByReference.fromJava(lhs, env: _javaEnv) == ExportedByReference.fromJava(rhs, env: _javaEnv),
                env: _javaEnv
            )
        }
    }
    static let _javaToString: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?
    ) -> String.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try String.toJava(
                "\(ExportedByReference.fromJava(_javaThis, env: _javaEnv))",
                env: _javaEnv
            )
        }
    }
}
