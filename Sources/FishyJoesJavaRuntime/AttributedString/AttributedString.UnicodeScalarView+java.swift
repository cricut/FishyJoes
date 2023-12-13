import Foundation

extension AttributedString.UnicodeScalarView: JavaMutator {
    
    
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedString.UnicodeScalarView {
        try Box<AttributedString.UnicodeScalarView>.fromJava(value, env: env).value
    }

    public static func toJava(_ value: AttributedString.UnicodeScalarView, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.UnicodeScalarView) throws -> R) throws -> R {
        try body(&Box<AttributedString.UnicodeScalarView>.fromJava(this, env: env).value)
    }
    
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout AttributedString.UnicodeScalarView, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<AttributedString.UnicodeScalarView>.fromJava(this, env: env).value, &env)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString$UnicodeScalarView"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(
            javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_endIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_indexBefore"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_indexBefore, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_indexAfter"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_indexAfter, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_elementAt"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)I"),
                fnPtr: unsafeBitCast(_java_elementAt, to: UnsafeMutableRawPointer.self)
            )
        )
        try AttributedString.Index.javaSetup(env: env)
    }

    private static let _java_startIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedString.UnicodeScalarView.fromJava(_javaThis, env: _javaEnv).startIndex, env: _javaEnv)
        }
    }

    private static let _java_endIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedString.UnicodeScalarView.fromJava(_javaThis, env: _javaEnv).endIndex, env: _javaEnv)
        }
    }

    private static let _java_indexBefore: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Index.CType
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis, i in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Index.toJava(
                AttributedString.UnicodeScalarView.fromJava(_javaThis, env: _javaEnv).index(
                    before: try AttributedString.Index.fromJava(i, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_indexAfter: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Index.CType
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis, i in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Index.toJava(
                AttributedString.UnicodeScalarView.fromJava(_javaThis, env: _javaEnv).index(
                    after: try AttributedString.Index.fromJava(i, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_elementAt: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Index.CType
    ) -> UInt32.CType = { _javaEnv, _javaThis, index in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try UInt32.toJava(
                AttributedString.UnicodeScalarView.fromJava(_javaThis, env: _javaEnv)[
                    try AttributedString.Index.fromJava(index, env: _javaEnv)
                ].value,
                env: _javaEnv
            )
        }
    }
}
