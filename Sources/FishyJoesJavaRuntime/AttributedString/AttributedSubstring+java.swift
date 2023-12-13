import Foundation

extension AttributedSubstring: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedSubstring {
        try Box<AttributedSubstring>.fromJava(value, env: env).value
    }

    public static func toJava(_ value: AttributedSubstring, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedSubstring) throws -> R) throws -> R {
        try body(&Box<AttributedSubstring>.fromJava(this, env: env).value)
    }
    
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout AttributedSubstring, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<AttributedSubstring>.fromJava(this, env: env).value, &env)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedSubstring"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(
            javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_base"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(_java_base, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_string"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(_java_string, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_runs"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Runs;"),
                fnPtr: unsafeBitCast(_java_runs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_characters"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$CharacterView;"),
                fnPtr: unsafeBitCast(_java_characters, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_unicodeScalars"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$UnicodeScalarView;"),
                fnPtr: unsafeBitCast(_java_unicodeScalars, to: UnsafeMutableRawPointer.self)
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
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_substring"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedSubstring;"),
                fnPtr: unsafeBitCast(_java_substring, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_substringForRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/AttributedSubstring;"),
                fnPtr: unsafeBitCast(_java_substringForRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedSubstring;Lcom/cricut/fishyjoes/runtime/AttributedSubstring;)Z"),
                fnPtr: unsafeBitCast(AttributedSubstring._java_equals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(AttributedSubstring._java_hash, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_createEmpty"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedSubstring;"),
                fnPtr: unsafeBitCast(_java_createEmpty, to: UnsafeMutableRawPointer.self)
            )
        )
        try AttributedString.javaSetup(env: env)
        try AttributedString.Index.javaSetup(env: env)
        try AttributedString.UnicodeScalarView.javaSetup(env: env)
        try AttributedString.CharacterView.javaSetup(env: env)
        try AttributedString.Runs.javaSetup(env: env)
        try AttributeContainer.javaSetup(env: env)
    }

    private static let _java_base: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.toJava(AttributedSubstring.fromJava(_javaThis, env: _javaEnv).base, env: _javaEnv)
        }
    }

    private static let _java_string: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> String.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let s = try AttributedSubstring.fromJava(_javaThis, env: _javaEnv)
            return try String.toJava(String(s.characters), env: _javaEnv)
        }
    }

    private static let _java_runs: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Runs.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Runs.toJava(AttributedSubstring.fromJava(_javaThis, env: _javaEnv).runs, env: _javaEnv)
        }
    }

    private static let _java_characters: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.CharacterView.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.CharacterView.toJava(AttributedSubstring.fromJava(_javaThis, env: _javaEnv).characters, env: _javaEnv)
        }
    }

    private static let _java_unicodeScalars: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.UnicodeScalarView.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.UnicodeScalarView.toJava(AttributedSubstring.fromJava(_javaThis, env: _javaEnv).unicodeScalars, env: _javaEnv)
        }
    }

    private static let _java_startIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedSubstring.fromJava(_javaThis, env: _javaEnv).startIndex, env: _javaEnv)
        }
    }

    private static let _java_endIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedSubstring.fromJava(_javaThis, env: _javaEnv).endIndex, env: _javaEnv)
        }
    }

    private static let _java_substring: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedSubstring.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let s = try AttributedSubstring.fromJava(_javaThis, env: _javaEnv)
            return try AttributedSubstring.toJava(s[s.startIndex..<s.endIndex], env: _javaEnv)
        }
    }

    private static let _java_substringForRange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        RangeConverter<AttributedString.Index>.CType
    ) -> AttributedSubstring.CType = { _javaEnv, _javaThis, range in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedSubstring.toJava(
                AttributedSubstring.fromJava(_javaThis, env: _javaEnv)[
                    try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv)
                ],
                env: _javaEnv
            )
        }
    }

    private static let _java_equals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let lhsSubstring = try AttributedSubstring.fromJava(lhs, env: _javaEnv)
            let rhsSubstring = try AttributedSubstring.fromJava(rhs, env: _javaEnv)
            // TODO: A bug in AttributedSubstring causes a crash if empty substrings are compared for equality; remove when this is fixed
            // let equal = lhsSubstring == rhsSubstring
            let equal = (lhsSubstring.characters.isEmpty && rhsSubstring.characters.isEmpty) || lhsSubstring == rhsSubstring
            return try Bool.toJava(
                equal,
                env: _javaEnv
            )
        }
    }

    private static let _java_hash: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?
    ) -> Int32.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Int32.toJava(
                Int32(truncatingIfNeeded: AttributedSubstring.fromJava(_javaThis, env: _javaEnv).hashValue),
                env: _javaEnv
            )
        }
    }

    private static let _java_createEmpty: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedSubstring.CType = { _javaEnv, _ in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedSubstring.toJava(
                AttributedSubstring(
                ),
                env: _javaEnv
            )
        }
    }
}
