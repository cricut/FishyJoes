import Foundation

extension AttributeContainer: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    
    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributeContainer {
        try Box<AttributeContainer>.fromJava(value, env: env).value
    }

    public static func toJava(_ value: AttributeContainer, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributeContainer) throws -> R) throws -> R {
        try body(&Box<AttributeContainer>.fromJava(this, env: env).value)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributeContainer"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(AttributeContainer.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_createEmpty"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributeContainer;"),
                fnPtr: unsafeBitCast(_java_createEmpty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_createWithLanguageIdentifier"),
                signature: bag.add("(Ljava/lang/String;)Lcom/cricut/fishyjoes/runtime/AttributeContainer;"),
                fnPtr: unsafeBitCast(_java_createWithLanguageIdentifier, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_createWithLink"),
                signature: bag.add("(Ljava/lang/String;)Lcom/cricut/fishyjoes/runtime/AttributeContainer;"),
                fnPtr: unsafeBitCast(_java_createWithLink, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;Lcom/cricut/fishyjoes/runtime/AttributeContainer;)Z"),
                fnPtr: unsafeBitCast(_java_equals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(_java_hash, to: UnsafeMutableRawPointer.self)
            )
        )
    }

    static let _java_equals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                AttributeContainer.fromJava(lhs, env: _javaEnv) == AttributeContainer.fromJava(rhs, env: _javaEnv),
                env: _javaEnv
            )
        }
    }

    static let _java_hash: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?
    ) -> Int32.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Int32.toJava(
                Int32(truncatingIfNeeded: AttributedString("", attributes: AttributeContainer.fromJava(_javaThis, env: _javaEnv)).hashValue),
                env: _javaEnv
            )
        }
    }

    static let _java_createEmpty: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributeContainer.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributeContainer.toJava(
                AttributeContainer(
                ),
                env: _javaEnv
            )
        }
    }

    // TODO: Add `AttributeContainer.Builder` with language identifier
    static let _java_createWithLanguageIdentifier: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        Swift.String.CType
    ) -> AttributeContainer.CType = { _javaEnv, _javaThis, languageIdentifier in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributeContainer.toJava(
                try AttributeContainer().languageIdentifier(Swift.String.fromJava(languageIdentifier, env: _javaEnv)),
                env: _javaEnv
            )
        }
    }

    // TODO: Add `AttributeContainer.Builder` with link
    static let _java_createWithLink: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        Swift.String.CType
    ) -> AttributeContainer.CType = { _javaEnv, _javaThis, linkString in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let linkSwiftString = try Swift.String.fromJava(linkString, env: _javaEnv)
            guard let link = URL(string: linkSwiftString) else {
                // TODO: Not a JNI error, but this is just test code
                throw JNIError(message: "could not convert \"\(linkSwiftString)\" to a valid URL")
            }
            return try AttributeContainer.toJava(
                AttributeContainer().link(link),
                env: _javaEnv
            )
        }
    }
}
