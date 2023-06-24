import Foundation

extension AttributedString.Index: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedString.Index {
        try Box<AttributedString.Index>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: AttributedString.Index, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString$Index"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(javaClass,
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Z"),
                fnPtr: unsafeBitCast(AttributedString.Index._javaEquals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(AttributedString.Index._javaHash, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_compare"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)I"),
                fnPtr: unsafeBitCast(AttributedString.Index._javaCompare, to: UnsafeMutableRawPointer.self)
            )
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.Index) throws -> R) throws -> R {
        try body(&Box<AttributedString.Index>.fromJava(this, env: env).value)
    }
    static let _javaEquals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                AttributedString.Index.fromJava(lhs, env: _javaEnv) == AttributedString.Index.fromJava(rhs, env: _javaEnv),
                env: _javaEnv
            )
        }
    }
    static let _javaHash: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?
    ) -> Int32.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Int32.toJava(
                // TODO: hashValue
                0,//Int32(truncatingIfNeeded: AttributedString.Index.fromJava(_javaThis, env: _javaEnv).hashValue),
                env: _javaEnv
            )
        }
    }
    static let _javaCompare: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?
    ) -> Int32.CType = { _javaEnv, _javaThis, other in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let thisComparable = try AttributedString.Index.fromJava(_javaThis, env: _javaEnv)
            let otherComparable = try AttributedString.Index.fromJava(other, env: _javaEnv)
            return try Int32.toJava(
                thisComparable == otherComparable ? 0 : thisComparable < otherComparable ? -1 : 1,
                env: _javaEnv
            )
        }
    }
}
