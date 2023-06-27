import Foundation

extension AttributedString.CharacterView: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedString.CharacterView {
        try Box<AttributedString.CharacterView>.fromJava(value, env: env).value
    }
    
    public static func toJava(_ value: AttributedString.CharacterView, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.CharacterView) throws -> R) throws -> R {
        try body(&Box<AttributedString.CharacterView>.fromJava(this, env: env).value)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString$CharacterView"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(AttributedString.CharacterView.javaClass,
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
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(_java_elementAt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceSubrange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Ljava/util/List;)V"),
                fnPtr: unsafeBitCast(_java_replaceSubrange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_endIndex, to: UnsafeMutableRawPointer.self)
            )
        )
        try AttributedString.Index.javaSetup(env: env)
    }

    static let _java_indexBefore: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Index.CType
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis, i in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Index.toJava(
                AttributedString.CharacterView.fromJava(_javaThis, env: _javaEnv).index(
                    before: try AttributedString.Index.fromJava(i, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }

    static let _java_indexAfter: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Index.CType
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis, i in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Index.toJava(
                AttributedString.CharacterView.fromJava(_javaThis, env: _javaEnv).index(
                    after: try AttributedString.Index.fromJava(i, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }

    static let _java_elementAt: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Index.CType
    ) -> Swift.String.CType = { _javaEnv, _javaThis, index in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Swift.String.toJava(
                String(
                    AttributedString.CharacterView.fromJava(_javaThis, env: _javaEnv)[
                        try AttributedString.Index.fromJava(index, env: _javaEnv)
                    ]
                ),
                env: _javaEnv
            )
        }
    }

    static let _java_replaceSubrange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        RangeConverter<AttributedString.Index>.CType,
        ArrayConverter<Swift.String>.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, subrange, newElements in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.CharacterView.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.CharacterView.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.replaceSubrange(
                        try RangeConverter<AttributedString.Index>.fromJava(subrange, env: _javaEnv),
                        with: try ArrayConverter<Swift.String>.fromJava(newElements, env: _javaEnv).compactMap { Character($0) }
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    static let _java_startIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedString.CharacterView.fromJava(_javaThis, env: _javaEnv).startIndex, env: _javaEnv)
        }
    }

    static let _java_endIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedString.CharacterView.fromJava(_javaThis, env: _javaEnv).endIndex, env: _javaEnv)
        }
    }

}
