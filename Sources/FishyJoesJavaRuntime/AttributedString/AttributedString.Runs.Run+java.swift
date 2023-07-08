import Foundation

extension AttributedString.Runs.Run: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedString.Runs.Run {
        try Box<AttributedString.Runs.Run>.fromJava(value, env: env).value
    }

    public static func toJava(_ value: AttributedString.Runs.Run, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.Runs.Run) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs.Run>.fromJava(this, env: env).value)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString$Runs$Run"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(
            javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(_java_range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_attributes"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributeContainer;"),
                fnPtr: unsafeBitCast(_java_attributes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Run;Lcom/cricut/fishyjoes/runtime/AttributedString$Runs$Run;)Z"),
                fnPtr: unsafeBitCast(_java_equals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(_java_hash, to: UnsafeMutableRawPointer.self)
            )
        )
        try AttributedString.Index.javaSetup(env: env)
    }

    private static let _java_range: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> RangeConverter<AttributedString.Index>.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try RangeConverter<AttributedString.Index>.toJava(AttributedString.Runs.Run.fromJava(_javaThis, env: _javaEnv).range, env: _javaEnv)
        }
    }

    private static let _java_attributes: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributeContainer.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributeContainer.toJava(AttributedString.Runs.Run.fromJava(_javaThis, env: _javaEnv).attributes, env: _javaEnv)
        }
    }

    private static let _java_equals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                AttributedString.Runs.Run.fromJava(lhs, env: _javaEnv) == AttributedString.Runs.Run.fromJava(rhs, env: _javaEnv),
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
                Int32(truncatingIfNeeded: AttributedString("", attributes: AttributedString.Runs.Run.fromJava(_javaThis, env: _javaEnv).attributes).hashValue),
                env: _javaEnv
            )
        }
    }
}
