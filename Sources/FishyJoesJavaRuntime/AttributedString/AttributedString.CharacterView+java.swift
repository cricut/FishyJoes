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
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AttributedString$CharacterView"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString.CharacterView) throws -> R) throws -> R {
        try body(&Box<AttributedString.CharacterView>.fromJava(this, env: env).value)
    }
}
