// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension Collections.CollectionHolder: JavaConverter {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_boolArray_id: jfieldID!
    private static var _java_boolSet_id: jfieldID!
    private static var _java_boolDictionary_id: jfieldID!
    private static var _java_integerArray_id: jfieldID!
    private static var _java_integerSet_id: jfieldID!
    private static var _java_integerDictionary_id: jfieldID!
    private static var _java_stringArray_id: jfieldID!
    private static var _java_stringSet_id: jfieldID!
    private static var _java_stringDictionary_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            boolArray: try ArrayConverter<Bool>.fromJava(
                env.GetObjectField(value, Self._java_boolArray_id),
                env: env
            ),
            boolSet: try SetConverter<Bool>.fromJava(
                env.GetObjectField(value, Self._java_boolSet_id),
                env: env
            ),
            boolDictionary: try DictionaryConverter<Bool, Bool>.fromJava(
                env.GetObjectField(value, Self._java_boolDictionary_id),
                env: env
            ),
            integerArray: try ArrayConverter<Int>.fromJava(
                env.GetObjectField(value, Self._java_integerArray_id),
                env: env
            ),
            integerSet: try SetConverter<Int>.fromJava(
                env.GetObjectField(value, Self._java_integerSet_id),
                env: env
            ),
            integerDictionary: try DictionaryConverter<Int, Int>.fromJava(
                env.GetObjectField(value, Self._java_integerDictionary_id),
                env: env
            ),
            stringArray: try ArrayConverter<Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_stringArray_id),
                env: env
            ),
            stringSet: try SetConverter<Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_stringSet_id),
                env: env
            ),
            stringDictionary: try DictionaryConverter<Swift.String, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_stringDictionary_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(ArrayConverter<Bool>.toJava(value.boolArray, env: env)),
            jvalue(SetConverter<Bool>.toJava(value.boolSet, env: env)),
            jvalue(DictionaryConverter<Bool, Bool>.toJava(value.boolDictionary, env: env)),
            jvalue(ArrayConverter<Int>.toJava(value.integerArray, env: env)),
            jvalue(SetConverter<Int>.toJava(value.integerSet, env: env)),
            jvalue(DictionaryConverter<Int, Int>.toJava(value.integerDictionary, env: env)),
            jvalue(ArrayConverter<Swift.String>.toJava(value.stringArray, env: env)),
            jvalue(SetConverter<Swift.String>.toJava(value.stringSet, env: env)),
            jvalue(DictionaryConverter<Swift.String, Swift.String>.toJava(value.stringDictionary, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/Collections$CollectionHolder"))
        _java_boolArray_id = try env.GetFieldID(javaClass, "boolArray", "Ljava/util/List;")
        _java_boolSet_id = try env.GetFieldID(javaClass, "boolSet", "Ljava/util/Set;")
        _java_boolDictionary_id = try env.GetFieldID(javaClass, "boolDictionary", "Ljava/util/Map;")
        _java_integerArray_id = try env.GetFieldID(javaClass, "integerArray", "Ljava/util/List;")
        _java_integerSet_id = try env.GetFieldID(javaClass, "integerSet", "Ljava/util/Set;")
        _java_integerDictionary_id = try env.GetFieldID(javaClass, "integerDictionary", "Ljava/util/Map;")
        _java_stringArray_id = try env.GetFieldID(javaClass, "stringArray", "Ljava/util/List;")
        _java_stringSet_id = try env.GetFieldID(javaClass, "stringSet", "Ljava/util/Set;")
        _java_stringDictionary_id = try env.GetFieldID(javaClass, "stringDictionary", "Ljava/util/Map;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(Ljava/util/List;Ljava/util/Set;Ljava/util/Map;Ljava/util/List;Ljava/util/Set;Ljava/util/Map;Ljava/util/List;Ljava/util/Set;Ljava/util/Map;)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetObjectField(
            this, Self._java_boolArray_id,
            ArrayConverter<Bool>.toJava(mutatingSelf.boolArray, env: env)
        )
        try env.SetObjectField(
            this, Self._java_boolSet_id,
            SetConverter<Bool>.toJava(mutatingSelf.boolSet, env: env)
        )
        try env.SetObjectField(
            this, Self._java_boolDictionary_id,
            DictionaryConverter<Bool, Bool>.toJava(mutatingSelf.boolDictionary, env: env)
        )
        try env.SetObjectField(
            this, Self._java_integerArray_id,
            ArrayConverter<Int>.toJava(mutatingSelf.integerArray, env: env)
        )
        try env.SetObjectField(
            this, Self._java_integerSet_id,
            SetConverter<Int>.toJava(mutatingSelf.integerSet, env: env)
        )
        try env.SetObjectField(
            this, Self._java_integerDictionary_id,
            DictionaryConverter<Int, Int>.toJava(mutatingSelf.integerDictionary, env: env)
        )
        try env.SetObjectField(
            this, Self._java_stringArray_id,
            ArrayConverter<Swift.String>.toJava(mutatingSelf.stringArray, env: env)
        )
        try env.SetObjectField(
            this, Self._java_stringSet_id,
            SetConverter<Swift.String>.toJava(mutatingSelf.stringSet, env: env)
        )
        try env.SetObjectField(
            this, Self._java_stringDictionary_id,
            DictionaryConverter<Swift.String, Swift.String>.toJava(mutatingSelf.stringDictionary, env: env)
        )
        return result
    }
}
