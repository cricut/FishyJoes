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
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString$UnicodeScalarView"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(AttributedString.UnicodeScalarView.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_indexBefore"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_AttributedString_UnicodeScalarView_indexBefore, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_indexAfter"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_AttributedString_UnicodeScalarView_indexAfter, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_indexOffsetByDistance"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;J)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_AttributedString_UnicodeScalarView_indexOffsetByDistance, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_elementAt"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)I"),
                fnPtr: unsafeBitCast(java_AttributedString_UnicodeScalarView_elementAt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceSubrange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Ljava/util/List;)V"),
                fnPtr: unsafeBitCast(java_AttributedString_UnicodeScalarView_replaceSubrange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_UnicodeScalarView_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_get_AttributedString_UnicodeScalarView_endIndex, to: UnsafeMutableRawPointer.self)
            )
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.UnicodeScalarView) throws -> R) throws -> R {
        try body(&Box<AttributedString.UnicodeScalarView>.fromJava(this, env: env).value)
    }
}
