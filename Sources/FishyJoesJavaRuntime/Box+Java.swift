import FishyJoesCommonRuntime
import Foundation
import JNI

extension Box {
    public static func fromJava(_ value: jobject?, env: Env) throws -> Box<T> {
        try Box(inner: AnyBox.fromJava(value, env: env))
    }

    public func toJava(env: Env) throws -> jobject? {
        try box.toJava(env: env)
    }
}

extension AnyBox {
    public static var javaClass: jclass?
    static var initMethodID: jmethodID?
    static var refFieldID: jfieldID?

    public static func fromJava(_ value: jobject?, env: Env) throws -> AnyBox {
        let longRef = UInt(pointerValue: env.GetLongField(value, refFieldID))
        return try takeUnretainedOpaque(javaNonNull(UnsafeMutablePointer(bitPattern: longRef)))
    }

    public func toJava(env: Env) throws -> jobject? {
        let ptr = JVALUE.from(pointer: retainedOpaque())
        return try env.NewObject(AnyBox.javaClass, AnyBox.initMethodID, ptr)
    }

    private static let finalize: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject) -> Void = { env, this in
        callbackBody(env) { env in
            let longRef = UInt(pointerValue: env.GetLongField(this, refFieldID))
            releaseOpaque(try javaNonNull(UnsafeMutablePointer(bitPattern: longRef)))
        }
    }

    private static let toString: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject) -> jobject? = { env, this in
        callbackBody(env) { env in
            try String.toJava("\(fromJava(this, env: env).value)", env: env)
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }

        let bag = CStringBag()

        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/SwiftReference"))
        initMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        refFieldID = try env.GetFieldID(javaClass, "swiftReference", "J")

        try env.RegisterNatives(
            javaClass,
            JNINativeMethod(
                name: bag.add("swiftFinalize"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(finalize, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("swiftToString"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(toString, to: UnsafeMutableRawPointer.self)
            )
        )
    }
}
