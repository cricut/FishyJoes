import Foundation

extension AttributedString: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedString {
        try Box<AttributedString>.fromJava(value, env: env).value
    }
    public static func toJava(_ value: AttributedString, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(javaClass,
            JNINativeMethod(
                name: bag.add("__jni_createEmpty"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_AttributedString_createEmpty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("(Ljava/lang/String;Lcom/cricut/fishyjoes/runtime/AttributeContainer;)Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_AttributedString_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_createFromSubstring"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedSubstring;)Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_AttributedString_createFromSubstring, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_substringForRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/AttributedSubstring;"),
                fnPtr: unsafeBitCast(java_AttributedString_substringForRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_append"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_append, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_insert"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_insert, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_removeSubrange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_removeSubrange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceSubrange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Lcom/cricut/fishyjoes/runtime/AttributedString;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_replaceSubrange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_setAttributes"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_setAttributes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_mergeAttributes"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;Lcom/cricut/fishyjoes/runtime/AttributedString$AttributeMergePolicy;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_mergeAttributes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceAttributes"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;Lcom/cricut/fishyjoes/runtime/AttributeContainer;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_replaceAttributes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_endIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_unicodeScalars"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$UnicodeScalarView;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_unicodeScalars, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_characters"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$CharacterView;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_characters, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_runs"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Runs;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_runs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_substring"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedSubstring;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_substring, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;Lcom/cricut/fishyjoes/runtime/AttributedString;)Z"),
                fnPtr: unsafeBitCast(_javaEquals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(_javaHash, to: UnsafeMutableRawPointer.self)
            )
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString) throws -> R) throws -> R {
        try body(&Box<AttributedString>.fromJava(this, env: env).value)
    }
    static let _javaEquals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                AttributedString.fromJava(lhs, env: _javaEnv) == AttributedString.fromJava(rhs, env: _javaEnv),
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
                Int32(truncatingIfNeeded: AttributedString.fromJava(_javaThis, env: _javaEnv).hashValue),
                env: _javaEnv
            )
        }
    }
}
