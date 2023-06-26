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
                fnPtr: unsafeBitCast(java_AttributedString_Runs_indexBefore, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_indexAfter"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;"),
                fnPtr: unsafeBitCast(java_AttributedString_Runs_indexAfter, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_elementAt"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Run;"),
                fnPtr: unsafeBitCast(java_AttributedString_Runs_elementAt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_elementAtPosition"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Run;"),
                fnPtr: unsafeBitCast(java_AttributedString_Runs_elementAtPosition, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_Runs_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_Runs_endIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs;Lcom/cricut/fishyjoes/runtime/AttributedString$Runs;)Z"),
                fnPtr: unsafeBitCast(AttributedString.Runs._javaEquals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(AttributedString.Runs._javaHash, to: UnsafeMutableRawPointer.self)
            )
        )

        // Setup other types used by AttributedString.Runs
        try AttributedString.Runs.Index.javaSetup(env: env)
        try AttributedString.Runs.Run.javaSetup(env: env)
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.Runs) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs>.fromJava(this, env: env).value)
    }
    static let _javaEquals: @convention(c)(
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
    static let _javaHash: @convention(c)(
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
}
