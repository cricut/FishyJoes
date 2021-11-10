import Foundation
@_exported import JNI
@_exported import FishyJoesCommonRuntime

public protocol JavaConverter: Converter {
    associatedtype CType = jobject?

    static var javaClass: jclass? { get }
    static var javaDescriptor: String { get }

    static func javaSetup(env: Env) throws

    static func fromJava(_ value: CType, env: Env) throws -> SwiftType
    static func fromJava(object: jobject?, env: Env) throws -> SwiftType

    static func toJava(_ value: SwiftType, env: Env) throws -> CType
    static func toJavaObject(_ value: SwiftType, env: Env) throws -> jobject?
}

extension JavaConverter where CType == jobject? {
    public static func toJavaObject(_ value: SwiftType, env: Env) throws -> jobject? {
        try toJava(value, env: env)
    }
    public static func fromJava(object: jobject?, env: Env) throws -> SwiftType {
        try fromJava(object, env: env)
    }
}

public protocol JavaMutator: JavaConverter {
    static func mutateJava<R>(_ this: CType, env: Env, body: (inout SwiftType) throws -> R) throws -> R
}

extension jvalue {
    public init(_ object: jobject?) {
        self.init(l: object)
    }
    public init(_ double: Double) {
        self.init(d: double)
    }
    public init(_ int: Int) {
        self.init(j: jlong(int))
    }
}

extension Bool: JavaConverter {
    public typealias CType = jboolean

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "Z" }
    private static var _valueMethodID: jmethodID!
    private static var _javaTrue: jobject!
    private static var _javaFalse: jobject!

    public static func fromJava(_ value: jboolean, env: Env) throws -> Bool {
        value == JNI_TRUE
    }

    public static func fromJava(object: jobject?, env: Env) throws -> Bool {
        try env.CallBooleanMethod(object, Self._valueMethodID)
    }

    public static func toJava(_ value: Bool, env: Env) throws -> jboolean {
        value ? jboolean(JNI_TRUE) : jboolean(JNI_FALSE)
    }

    public static func toJavaObject(_ value: Bool, env: Env) throws -> jobject? {
        env.NewLocalRef(value ? Self._javaTrue : Self._javaFalse)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Boolean"))
        _valueMethodID = try env.GetMethodID(javaClass, "booleanValue", "()Z")
        let trueFieldID = try env.GetStaticFieldID(javaClass, "TRUE", "Ljava/lang/Boolean;")
        let falseFieldID = try env.GetStaticFieldID(javaClass, "FALSE", "Ljava/lang/Boolean;")
        _javaTrue = try env.globalRef(env.GetStaticObjectField(javaClass, trueFieldID))
        _javaFalse = try env.globalRef(env.GetStaticObjectField(javaClass, falseFieldID))
    }
}

extension Double: JavaConverter {
    public typealias CType = jdouble

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "D" }
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jdouble, env: Env) throws -> Double { value }
    public static func toJava(_ value: Double, env: Env) throws -> jdouble { value }

    public static func fromJava(object: jobject?, env: Env) throws -> Double{
        try env.CallDoubleMethod(object, Self._valueMethodID)
    }

    public static func toJavaObject(_ value: Double, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(d: value))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Double"))
        _valueMethodID = try env.GetMethodID(javaClass, "doubleValue", "()D")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(D)V")
    }
}

extension Int64: JavaConverter {
    public typealias CType = jlong

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "J" }
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jlong, env: Env) throws -> Int64 {
        Int64(value)
    }

    public static func toJava(_ value: Int64, env: Env) throws -> jlong {
        jlong(value)
    }

    public static func fromJava(object: jobject?, env: Env) throws -> Int64 {
        Int64(try env.CallLongMethod(object, Self._valueMethodID))
    }

    public static func toJavaObject(_ value: Int64, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(j: jlong(value)))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Long"))
        _valueMethodID = try env.GetMethodID(javaClass, "longValue", "()J")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
}

extension Int32: JavaConverter {
    public typealias CType = jint

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "I" }
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jint, env: Env) throws -> Int32 { value }
    public static func toJava(_ value: Int32, env: Env) throws -> jint { value }

    public static func fromJava(object: jobject?, env: Env) throws -> Int32 {
        try env.CallIntMethod(object, Self._valueMethodID)
    }

    public static func toJavaObject(_ value: Int32, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(i: value))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Int"))
        _valueMethodID = try env.GetMethodID(javaClass, "intValue", "()I")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(I)V")
    }
}

extension Int: JavaConverter {
    public typealias CType = Int64.CType

    public static var javaClass: jclass? { Int64.javaClass }
    public static var javaDescriptor: String { Int64.javaDescriptor }

    public static func fromJava(_ value: jlong, env: Env) throws -> Int {
        try Int(Int64.fromJava(value, env: env))
    }

    public static func toJava(_ value: Self, env: Env) throws -> jlong {
        jlong(value)
    }

    public static func fromJava(object value: jobject?, env: Env) throws -> Int {
        Int(try Int64.fromJava(object: value, env: env))
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try Int64.toJavaObject(Int64(value), env: env)
    }

    public static func javaSetup(env: Env) throws {
        try Int64.javaSetup(env: env)
    }
}

extension String: JavaConverter {
    public typealias CType = jstring?

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "Ljava/lang/String;" }

    public static func fromJava(_ value: jstring?, env: Env) throws -> String {
        let length = env.GetStringLength(value)
        guard let chars = env.GetStringChars(value).0 else {
            throw JNIError(message: "string conversion failed")
        }
        defer { env.ReleaseStringChars(value, chars) }
        return String(utf16CodeUnits: chars, count: Int(length))
    }

    public static func toJava(_ value: Self, env: Env) throws -> jstring? {
        let chars = Array(value.utf16)
        guard let jstr = try env.NewString(chars, jsize(chars.count)) else {
            throw JNIError(message: "string allocation failed")
        }
        return jstr
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/String"))
    }
}

fileprivate enum JavaIterator {
    static var iteratorClass: jclass?
    static var nextMethodID: jmethodID?
    static var hasNextMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        iteratorClass = try env.globalRef(env.FindClass("java/util/Iterator"))
        hasNextMethodID = try env.GetMethodID(iteratorClass, "hasNext", "()Z")
        nextMethodID = try env.GetMethodID(iteratorClass, "next", "()Ljava/lang/Object;")
    }
}

fileprivate enum JavaList {
    static var listClass: jclass?
    static var arrayListClass: jclass?
    static var iteratorMethodID: jmethodID?
    static var initMethodID: jmethodID?
    static var addMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard listClass == nil else { return }

        try JavaIterator.javaSetup(env: env)

        listClass = try env.globalRef(env.FindClass("java/util/List"))
        iteratorMethodID = try env.GetMethodID(listClass, "iterator", "()Ljava/util/Iterator;")

        arrayListClass = try env.globalRef(env.FindClass("java/util/ArrayList"))
        initMethodID = try env.GetMethodID(arrayListClass, "<init>", "(I)V")
        addMethodID = try env.GetMethodID(arrayListClass, "add", "(Ljava/lang/Object;)Z")
    }

    public static func forEach(_ listObject: jobject?, env: Env, body: (jobject?) throws -> Void) throws {
        let iter = try env.CallObjectMethod(listObject, iteratorMethodID)
        while (try env.CallBooleanMethod(iter, JavaIterator.hasNextMethodID)) {
            let item = try env.CallObjectMethod(iter, JavaIterator.nextMethodID)
            try body(item)
            env.DeleteLocalRef(item)
        }
        env.DeleteLocalRef(iter)
    }
}

fileprivate enum JavaSet {
    static var setClass: jclass?
    static var hashSetClass: jclass?
    static var iteratorMethodID: jmethodID?
    static var nextMethodID: jmethodID?
    static var hasNextMethodID: jmethodID?
    static var initMethodID: jmethodID?
    static var addMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard setClass == nil else { return }

        try JavaIterator.javaSetup(env: env)

        setClass = try env.globalRef(env.FindClass("java/util/Set"))
        iteratorMethodID = try env.GetMethodID(setClass, "iterator", "()Ljava/util/Iterator;")

        hashSetClass = try env.globalRef(env.FindClass("java/util/HashSet"))
        initMethodID = try env.GetMethodID(hashSetClass, "<init>", "(I)V")
        addMethodID = try env.GetMethodID(hashSetClass, "add", "(Ljava/lang/Object;)Z")
    }

    public static func forEach(_ setObject: jobject?, env: Env, body: (jobject?) throws -> Void) throws {
        let iter = try env.CallObjectMethod(setObject, iteratorMethodID)
        while (try env.CallBooleanMethod(iter, hasNextMethodID)) {
            let item = try env.CallObjectMethod(iter, nextMethodID)
            try body(item)
            env.DeleteLocalRef(item)
        }
        env.DeleteLocalRef(iter)
    }
}

fileprivate enum JavaMap {
    static var mapClass: jclass?
    static var hashMapClass: jclass?
    static var entrySetMethodID: jmethodID?
    static var getKeyMethodID: jmethodID?
    static var getValueMethodID: jmethodID?
    static var initMethodID: jmethodID?
    static var putMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard mapClass == nil else { return }

        mapClass = try env.globalRef(env.FindClass("java/util/Map"))
        entrySetMethodID = try env.GetMethodID(mapClass, "entrySet", "()Ljava/util/Set;")

        let entryClass = try env.FindClass("java/util/Map$Entry")
        getKeyMethodID = try env.GetMethodID(entryClass, "getKey", "()Ljava/lang/Object;")
        getValueMethodID = try env.GetMethodID(entryClass, "getValue", "()Ljava/lang/Object;")

        hashMapClass = try env.globalRef(env.FindClass("java/util/HashMap"))
        initMethodID = try env.GetMethodID(hashMapClass, "<init>", "(I)V")
        putMethodID = try env.GetMethodID(hashMapClass, "put", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;")

        env.DeleteLocalRef(entryClass)
    }
}

extension ArrayConverter: JavaConverter where ElementConverter: JavaConverter {
    public static var javaClass: jclass? {
        JavaList.listClass
    }
    public static var javaDescriptor: String {
        "Ljava/util/List;"
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        var result = SwiftType()
        try JavaList.forEach(value, env: env) { item in
            result.append(try ElementConverter.fromJava(object: item, env: env))
        }
        return result
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let array = try env.NewObject(JavaList.arrayListClass, JavaList.initMethodID, jvalue(i: jint(value.count)))
        for element in value {
            let javaElement = try ElementConverter.toJavaObject(element, env: env)
            _ = try env.CallBooleanMethod(array, JavaList.addMethodID, jvalue(l: javaElement))
            env.DeleteLocalRef(javaElement)
        }
        return array
    }

    public static func javaSetup(env: Env) throws {
        try JavaList.javaSetup(env: env)
        try ElementConverter.javaSetup(env: env)
    }
}

extension DictionaryConverter: JavaConverter where
    KeyConverter: JavaConverter,
    KeyConverter.SwiftType: Hashable,
    ValueConverter: JavaConverter
{
    public static var javaClass: jclass? {
        JavaMap.mapClass
    }
    public static var javaDescriptor: String {
        "Ljava/util/Map;"
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let entries = try env.CallObjectMethod(value, JavaMap.entrySetMethodID)
        var result = SwiftType()
        try JavaSet.forEach(entries, env: env) { entry in
            let key = try env.CallObjectMethod(entry, JavaMap.getKeyMethodID)
            let value = try env.CallObjectMethod(entry, JavaMap.getValueMethodID)
            result[try KeyConverter.fromJava(object: key, env: env)] = try ValueConverter.fromJava(object: value, env: env)
            env.DeleteLocalRef(key)
            env.DeleteLocalRef(value)
        }
        return result
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let hashMap = try env.NewObject(JavaMap.hashMapClass, JavaMap.initMethodID, jvalue(i: jint(value.count)))
        for (key, value) in value {
            let javaKey = try KeyConverter.toJavaObject(key, env: env)
            let javaValue = try ValueConverter.toJavaObject(value, env: env)
            let prevValue = try env.CallObjectMethod(hashMap, JavaMap.putMethodID, jvalue(l: javaKey), jvalue(l: javaValue))
            env.DeleteLocalRef(javaKey)
            env.DeleteLocalRef(javaValue)
            env.DeleteLocalRef(prevValue)
        }
        return hashMap
    }

    public static func javaSetup(env: Env) throws {
        try JavaSet.javaSetup(env: env)
        try JavaMap.javaSetup(env: env)
        try KeyConverter.javaSetup(env: env)
        try ValueConverter.javaSetup(env: env)
    }
}

extension SetConverter: JavaConverter where ElementConverter: JavaConverter, ElementConverter.SwiftType: Hashable {
    public static var javaClass: jclass? {
        JavaSet.setClass
    }
    public static var javaDescriptor: String {
        "Ljava/util/Set;"
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        var result = SwiftType()
        try JavaSet.forEach(value, env: env) { entry in
            result.insert(try ElementConverter.fromJava(object: value, env: env))
        }
        return result
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let hashSet = try env.NewObject(JavaSet.hashSetClass, JavaSet.initMethodID, jvalue(i: jint(value.count)))
        for element in value {
            let javaElement = try ElementConverter.toJavaObject(element, env: env)
            _ = try env.CallBooleanMethod(hashSet, JavaSet.addMethodID, jvalue(l: javaElement))
            env.DeleteLocalRef(javaElement)
        }
        return hashSet
    }

    public static func javaSetup(env: Env) throws {
        try JavaSet.javaSetup(env: env)
        try ElementConverter.javaSetup(env: env)
    }
}

extension OptionalConverter: JavaConverter where WrappedConverter: JavaConverter {
    public static var javaClass: jclass? {
        WrappedConverter.javaClass
    }
    public static var javaDescriptor: String {
        WrappedConverter.javaDescriptor
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if value == nil {
            return nil
        } else {
            return try WrappedConverter.fromJava(object: value, env: env)
        }
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        if let wrapped = value {
            return try WrappedConverter.toJavaObject(wrapped, env: env)
        } else {
            return nil
        }
    }

    public static func javaSetup(env: Env) throws {
        try WrappedConverter.javaSetup(env: env)
    }
}

fileprivate var pairClass: jclass!
fileprivate var pairConstructor: jmethodID!
fileprivate var pairFirstMethod: jmethodID!
fileprivate var pairSecondMethod: jmethodID!

extension Tuple2Converter: JavaConverter where T0: JavaConverter, T1: JavaConverter {
    public static var javaClass: jclass? {
        pairClass
    }
    public static var javaDescriptor: String {
        "Lkotlin/Pair;"
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let v0 = try env.CallObjectMethod(value, pairFirstMethod)
        let v1 = try env.CallObjectMethod(value, pairSecondMethod)
        return (
            try T0.fromJava(object: v0, env: env),
            try T1.fromJava(object: v1, env: env)
        )
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let v0 = try jvalue(l: T0.toJavaObject(value.0, env: env))
        let v1 = try jvalue(l: T1.toJavaObject(value.1, env: env))
        let result = try env.NewObject(pairClass, pairConstructor, v0, v1)
        env.DeleteLocalRef(v0.l)
        env.DeleteLocalRef(v1.l)
        return result
    }

    public static func javaSetup(env: Env) throws {
        try T0.javaSetup(env: env)
        try T1.javaSetup(env: env)

        guard javaClass == nil else { return }
        pairClass = try env.globalRef(env.FindClass("kotlin/Pair"))
        pairConstructor = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/Object;Ljava/lang/Object;)V")
        pairFirstMethod = try env.GetMethodID(javaClass, "getFirst", "()Ljava/lang/Object;")
        pairSecondMethod = try env.GetMethodID(javaClass, "getSecond", "()Ljava/lang/Object;")
    }
}


fileprivate var tuple4Class: jclass!
fileprivate var tuple4Constructor: jmethodID!
fileprivate var tuple4FirstMethod: jmethodID!
fileprivate var tuple4SecondMethod: jmethodID!
fileprivate var tuple4ThirdMethod: jmethodID!
fileprivate var tuple4FourthMethod: jmethodID!
extension Tuple4Converter: JavaConverter where T0: JavaConverter, T1: JavaConverter, T2: JavaConverter, T3: JavaConverter {
    public static var javaClass: jclass? {
        tuple4Class
    }
    public static var javaDescriptor: String {
        "Lcom/cricut/fishyjoes/runtime/Tuple4;"
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let v0 = try env.CallObjectMethod(value, tuple4FirstMethod)
        let v1 = try env.CallObjectMethod(value, tuple4SecondMethod)
        let v2 = try env.CallObjectMethod(value, tuple4ThirdMethod)
        let v3 = try env.CallObjectMethod(value, tuple4FourthMethod)
        return (
            try T0.fromJava(object: v0, env: env),
            try T1.fromJava(object: v1, env: env),
            try T2.fromJava(object: v2, env: env),
            try T3.fromJava(object: v3, env: env)
        )
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let v0 = try jvalue(l: T0.toJavaObject(value.0, env: env))
        let v1 = try jvalue(l: T1.toJavaObject(value.1, env: env))
        let v2 = try jvalue(l: T2.toJavaObject(value.2, env: env))
        let v3 = try jvalue(l: T3.toJavaObject(value.3, env: env))
        let result = try env.NewObject(tuple4Class, tuple4Constructor, v0, v1, v2, v3)
        env.DeleteLocalRef(v0.l)
        env.DeleteLocalRef(v1.l)
        env.DeleteLocalRef(v2.l)
        env.DeleteLocalRef(v3.l)
        return result
    }

    public static func javaSetup(env: Env) throws {
        try T0.javaSetup(env: env)
        try T1.javaSetup(env: env)
        try T2.javaSetup(env: env)
        try T3.javaSetup(env: env)

        guard javaClass == nil else { return }
        tuple4Class = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/Tuple4"))
        tuple4Constructor = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
        tuple4FirstMethod = try env.GetMethodID(javaClass, "getFirst", "()Ljava/lang/Object;")
        tuple4SecondMethod = try env.GetMethodID(javaClass, "getSecond", "()Ljava/lang/Object;")
        tuple4ThirdMethod = try env.GetMethodID(javaClass, "getThird", "()Ljava/lang/Object;")
        tuple4FourthMethod = try env.GetMethodID(javaClass, "getFourth", "()Ljava/lang/Object;")
    }
}

extension VoidConverter: JavaConverter {
    public typealias CType = Void

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "V" }

    public static func fromJava(_ value: Void, env: Env) throws -> Void {}
    public static func toJava(_ value: Void, env: Env) throws -> Void {}

    public static func fromJava(object: jobject?, env: Env) throws -> Void {}
    public static func toJavaObject(_ value: Void, env: Env) throws -> jobject? { nil }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Object"))
    }
}
