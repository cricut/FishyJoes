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
                fnPtr: unsafeBitCast(java_AttributedString_CharacterView_indexBefore, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_indexAfter"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_AttributedString_CharacterView_indexAfter, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_elementAt"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_AttributedString_CharacterView_elementAt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceSubrange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Ljava/util/List;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_CharacterView_replaceSubrange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_CharacterView_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_CharacterView_endIndex, to: UnsafeMutableRawPointer.self)
            )
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.CharacterView) throws -> R) throws -> R {
        try body(&Box<AttributedString.CharacterView>.fromJava(this, env: env).value)
    }
}
