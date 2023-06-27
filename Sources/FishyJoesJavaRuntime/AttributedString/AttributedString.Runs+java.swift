import Foundation

extension AttributedString.Runs: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedString.Runs {
        try Box<AttributedString.Runs>.fromJava(value, env: env).value
    }

    public static func toJava(_ value: AttributedString.Runs, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.Runs) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs>.fromJava(this, env: env).value)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString$Runs"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(AttributedString.Runs.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_indexBefore"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;"),
                fnPtr: unsafeBitCast(_java_indexBefore, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_indexAfter"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;"),
                fnPtr: unsafeBitCast(_java_indexAfter, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_elementAt"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Run;"),
                fnPtr: unsafeBitCast(_java_elementAt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_elementAtPosition"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Run;"),
                fnPtr: unsafeBitCast(_java_elementAtPosition, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;"),
                fnPtr: unsafeBitCast(_java_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;"),
                fnPtr: unsafeBitCast(_java_endIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs;Lcom/cricut/fishyjoes/runtime/AttributedString$Runs;)Z"),
                fnPtr: unsafeBitCast(_java_equals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(_java_hash, to: UnsafeMutableRawPointer.self)
            )
        )
        try AttributedString.Runs.Index.javaSetup(env: env)
        try AttributedString.Runs.Run.javaSetup(env: env)
    }

    private static let _java_equals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                AttributedString.Runs.fromJava(lhs, env: _javaEnv) == AttributedString.Runs.fromJava(rhs, env: _javaEnv),
                env: _javaEnv
            )
        }
    }

    private static let _java_hash: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?
    ) -> Int32.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let runHashes = try AttributedString.Runs.fromJava(_javaThis, env: _javaEnv)
                .lazy
                .map { AttributedString("", attributes: $0.attributes).hashValue }
            let hashValue = runHashes
                .reduce(into: Hasher()) { $0.combine($1) }
                .finalize()
            return try Int32.toJava(
                Int32(truncatingIfNeeded: hashValue),
                env: _javaEnv
            )
        }
    }

    private static let _java_indexBefore: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Runs.Index.CType
    ) -> AttributedString.Runs.Index.CType = { _javaEnv, _javaThis, i in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Runs.Index.toJava(
                AttributedString.Runs.fromJava(_javaThis, env: _javaEnv).index(
                    before: try AttributedString.Runs.Index.fromJava(i, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_indexAfter: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Runs.Index.CType
    ) -> AttributedString.Runs.Index.CType = { _javaEnv, _javaThis, i in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Runs.Index.toJava(
                AttributedString.Runs.fromJava(_javaThis, env: _javaEnv).index(
                    after: try AttributedString.Runs.Index.fromJava(i, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_elementAt: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Runs.Index.CType
    ) -> AttributedString.Runs.Run.CType = { _javaEnv, _javaThis, index in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Runs.Run.toJava(
                AttributedString.Runs.fromJava(_javaThis, env: _javaEnv)[
                    try AttributedString.Runs.Index.fromJava(index, env: _javaEnv)
                ],
                env: _javaEnv
            )
        }
    }

    private static let _java_elementAtPosition: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.Index.CType
    ) -> AttributedString.Runs.Run.CType = { _javaEnv, _javaThis, index in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.Runs.Run.toJava(
                AttributedString.Runs.fromJava(_javaThis, env: _javaEnv)[
                    try AttributedString.Index.fromJava(index, env: _javaEnv)
                ],
                env: _javaEnv
            )
        }
    }

    private static let _java_startIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Runs.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Runs.Index.toJava(AttributedString.Runs.fromJava(_javaThis, env: _javaEnv).startIndex, env: _javaEnv)
        }
    }

    private static let _java_endIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Runs.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Runs.Index.toJava(AttributedString.Runs.fromJava(_javaThis, env: _javaEnv).endIndex, env: _javaEnv)
        }
    }
}
