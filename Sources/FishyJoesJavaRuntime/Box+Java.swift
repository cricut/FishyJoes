import Foundation
import JNI
import FishyJoesCommonRuntime

extension Box {
    public static func fromJava(_ value: jobject?, env: Env) throws -> Box<T> {
        try Box(inner: AnyBox.fromJava(value, env: env))
    }
}

extension AnyBox {
    static var javaClass: jclass?
    static var refFieldID: jfieldID?

    public static func fromJava(_ value: jobject?, env: Env) throws -> AnyBox {
        let longRef = UInt(env.GetLongField(value, refFieldID))
        return try takeUnretainedOpaque(javaNonNull(UnsafeMutablePointer(bitPattern: longRef)))
    }

    private static let finalize: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject) -> Void = { env, this in
        callbackBody(env) { env in
            let longRef = UInt(env.GetLongField(this, refFieldID))
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
