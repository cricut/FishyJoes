@_exported import FishyJoesCommonRuntime
import Foundation
@_exported import JNI

// MARK: - Java Type Conversion Protocols

public protocol JavaConverter: Converter {
    associatedtype CType = jobject?

    static var javaClass: jclass? { get }

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

// MARK: - Java Value Convenience

extension jvalue {
    public init(_ value: jboolean) {
        self.init(z: value)
    }
    public init(_ value: jbyte) {
        self.init(b: value)
    }
    public init(_ value: jchar) {
        self.init(c: value)
    }
    public init(_ value: jshort) {
        self.init(s: value)
    }
    public init(_ value: jint) {
        self.init(i: value)
    }
    public init(_ value: jlong) {
        self.init(j: value)
    }
    public init(_ value: jfloat) {
        self.init(f: value)
    }
    public init(_ value: jdouble) {
        self.init(d: value)
    }
    public init(_ value: jobject?) {
        self.init(l: value)
    }
}

// MARK: - Primitive Type Conversions

extension VoidConverter: JavaConverter {
    public typealias CType = Void

    public static var javaClass: jclass?

    public static func fromJava(_ value: Void, env: Env) throws {}
    public static func toJava(_ value: Void, env: Env) throws {}

    public static func fromJava(object: jobject?, env: Env) throws {}
    public static func toJavaObject(_ value: Void, env: Env) throws -> jobject? { nil }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Object"))
    }
}

extension Bool: JavaConverter {
    public typealias CType = jboolean

    public static var javaClass: jclass?
    private static var _valueMethodID: jmethodID!
    private static var _javaTrue: jobject!
    private static var _javaFalse: jobject!

    public static func fromJava(_ value: jboolean, env: Env) throws -> Self {
        value == JNI_TRUE
    }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        try env.CallBooleanMethod(object, Self._valueMethodID) != JNI_FALSE
    }

    public static func toJava(_ value: Self, env: Env) throws -> jboolean {
        value ? jboolean(JNI_TRUE) : jboolean(JNI_FALSE)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
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

extension UInt8: JavaConverter {
    public typealias CType = jbyte

    public static var javaClass: jclass?
    private static var unsignedConverterClass: jclass?
    private static var coerceUnsigned: jmethodID!
    private static var coerceSigned: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { .init(bitPattern: value) }
    public static func toJava(_ value: Self, env: Env) throws -> CType { .init(bitPattern: value) }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        let signed = try env.CallStaticByteMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
        return .init(bitPattern: signed)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        let signed = CType(bitPattern: value)
        return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(signed))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("kotlin/UByte"))
        unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
        coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceUByteToByte", "(Lkotlin/UByte;)B")
        coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceByteToUByte", "(B)Lkotlin/UByte;")
    }
}

extension UInt16: JavaConverter {
    public typealias CType = jshort

    public static var javaClass: jclass?
    private static var unsignedConverterClass: jclass?
    private static var coerceUnsigned: jmethodID!
    private static var coerceSigned: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { .init(bitPattern: value) }
    public static func toJava(_ value: Self, env: Env) throws -> CType { .init(bitPattern: value) }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        let signed = try env.CallStaticShortMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
        return .init(bitPattern: signed)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        let signed = CType(bitPattern: value)
        return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(signed))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Short"))
        unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
        coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceUShortToShort", "(Lkotlin/UShort;)S")
        coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceShortToUShort", "(S)Lkotlin/UShort;")
    }
}

extension UInt32: JavaConverter {
    public typealias CType = jint

    public static var javaClass: jclass?
    private static var unsignedConverterClass: jclass?
    private static var coerceUnsigned: jmethodID!
    private static var coerceSigned: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { .init(bitPattern: value) }
    public static func toJava(_ value: Self, env: Env) throws -> CType { .init(bitPattern: value) }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        let signed = try env.CallStaticIntMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
        return .init(bitPattern: signed)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        let signed = CType(bitPattern: value)
        return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(signed))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Integer"))
        unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
        coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceUIntToInt", "(Lkotlin/UInt;)I")
        coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceIntToUInt", "(I)Lkotlin/UInt;")
    }
}

extension UInt64: JavaConverter {
    // NOTE: CType is jlong, which is defined as Int, but is guaranteed by the JNI to be 64-bits
    public typealias CType = jlong

    public static var javaClass: jclass?
    private static var unsignedConverterClass: jclass?
    private static var coerceUnsigned: jmethodID!
    private static var coerceSigned: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { .init(bitPattern: Int64(value)) }
    public static func toJava(_ value: Self, env: Env) throws -> CType { CType(Int64(bitPattern: value)) }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        let signed = try env.CallStaticLongMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
        return .init(bitPattern: Int64(signed))
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        let signed = Int64(bitPattern: value)
        return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(CType(signed)))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Long"))
        unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
        coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceULongToLong", "(Lkotlin/ULong;)J")
        coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceLongToULong", "(J)Lkotlin/ULong;")
    }
}

extension UInt: JavaConverter {
    public typealias CType = UInt64.CType

    public static var javaClass: jclass? { UInt64.javaClass }

    public static func fromJava(_ value: CType, env: Env) throws -> Self {
        try Self(UInt64.fromJava(value, env: env))
    }

    public static func toJava(_ value: Self, env: Env) throws -> CType {
        try UInt64.toJava(UInt64(value), env: env)
    }

    public static func fromJava(object value: jobject?, env: Env) throws -> Self {
        Self(try UInt64.fromJava(object: value, env: env))
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try UInt64.toJavaObject(UInt64(value), env: env)
    }

    public static func javaSetup(env: Env) throws {
        try UInt64.javaSetup(env: env)
    }
}

extension Int8: JavaConverter {
    public typealias CType = jbyte

    public static var javaClass: jclass?
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { value }
    public static func toJava(_ value: Self, env: Env) throws -> CType { value }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        try env.CallByteMethod(object, Self._valueMethodID)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(value))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Byte"))
        _valueMethodID = try env.GetMethodID(javaClass, "byteValue", "()B")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(B)V")
    }
}

extension Int16: JavaConverter {
    public typealias CType = jshort

    public static var javaClass: jclass?
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { value }
    public static func toJava(_ value: Self, env: Env) throws -> CType { value }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        try env.CallShortMethod(object, Self._valueMethodID)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(value))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Short"))
        _valueMethodID = try env.GetMethodID(javaClass, "shortValue", "()S")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(S)V")
    }
}

extension Int32: JavaConverter {
    public typealias CType = jint

    public static var javaClass: jclass?
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { value }
    public static func toJava(_ value: Self, env: Env) throws -> CType { value }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        try env.CallIntMethod(object, Self._valueMethodID)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(value))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Integer"))
        _valueMethodID = try env.GetMethodID(javaClass, "intValue", "()I")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(I)V")
    }
}

extension Int64: JavaConverter {
    // NOTE: CType is jlong, which is defined as Int, but is guaranteed by the JNI to be 64-bits
    public typealias CType = jlong

    public static var javaClass: jclass?
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: CType, env: Env) throws -> Self { Self(value) }
    public static func toJava(_ value: Self, env: Env) throws -> CType { CType(value) }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        Self(try env.CallLongMethod(object, Self._valueMethodID))
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(CType(value)))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Long"))
        _valueMethodID = try env.GetMethodID(javaClass, "longValue", "()J")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
    }
}

extension Int: JavaConverter {
    public typealias CType = Int64.CType

    public static var javaClass: jclass? { Int64.javaClass }

    public static func fromJava(_ value: CType, env: Env) throws -> Self {
        try Self(Int64.fromJava(value, env: env))
    }

    public static func toJava(_ value: Self, env: Env) throws -> CType {
        try Int64.toJava(Int64(value), env: env)
    }

    public static func fromJava(object value: jobject?, env: Env) throws -> Self {
        Self(try Int64.fromJava(object: value, env: env))
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try Int64.toJavaObject(Int64(value), env: env)
    }

    public static func javaSetup(env: Env) throws {
        try Int64.javaSetup(env: env)
    }
}

extension Float: JavaConverter {
    public typealias CType = jfloat

    public static var javaClass: jclass?
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jfloat, env: Env) throws -> Self { value }
    public static func toJava(_ value: Self, env: Env) throws -> jfloat { value }

    public static func fromJava(object: jobject?, env: Env) throws -> Self {
        try env.CallFloatMethod(object, Self._valueMethodID)
    }

    public static func toJavaObject(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(f: value))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Float"))
        _valueMethodID = try env.GetMethodID(javaClass, "floatValue", "()F")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(F)V")
    }
}

extension Double: JavaConverter {
    public typealias CType = jdouble

    public static var javaClass: jclass?
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jdouble, env: Env) throws -> Double { value }
    public static func toJava(_ value: Double, env: Env) throws -> jdouble { value }

    public static func fromJava(object: jobject?, env: Env) throws -> Double {
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

// MARK: - Less-Primitive Type Conversions

extension String: JavaConverter {
    public typealias CType = jstring?

    public static var javaClass: jclass?

    public static func fromJava(_ value: jstring?, env: Env) throws -> Self {
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

extension Data: JavaConverter {
    public typealias CType = jbyteArray?

    public static var javaClass: jclass?

    public static func fromJava(_ value: jbyteArray?, env: Env) throws -> Self {
        let length = env.GetArrayLength(value)
        let result = try env.GetByteArrayElements(value)
        defer {
            if let value = value, let elements = result.0 {
                env.ReleaseByteArrayElements(value, elements, JNI_ABORT)
            }
        }
        guard let elements = result.0 else {
            throw JNIError(message: "memory allocation failed")
        }
        return Data(bytes: elements, count: Int(length))
    }

    public static func toJava(_ value: Self, env: Env) throws -> jbyteArray? {
        let length = jsize(value.count)
        guard length > 0 else {
            return nil
        }
        guard let byteArray = try env.NewByteArray(length) else {
            throw JNIError(message: "memory allocation failed")
        }
        try value.withUnsafeBytes { pointer in
            guard let bytes = pointer.baseAddress?.assumingMemoryBound(to: jbyte.self) else {
                throw JNIError(message: "memory access failed")
            }
            try env.SetByteArrayRegion(byteArray, 0, length, bytes)
        }
        return byteArray
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("[B"))
    }
}

// MARK: - Generics Type Conversions

private enum JavaIterator {
    static var iteratorClass: jclass?
    static var nextMethodID: jmethodID?
    static var hasNextMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard iteratorClass == nil else { return }
        iteratorClass = try env.globalRef(env.FindClass("java/util/Iterator"))
        hasNextMethodID = try env.GetMethodID(iteratorClass, "hasNext", "()Z")
        nextMethodID = try env.GetMethodID(iteratorClass, "next", "()Ljava/lang/Object;")
    }
}

private enum JavaList {
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
        while try env.CallBooleanMethod(iter, JavaIterator.hasNextMethodID) != JNI_FALSE {
            let item = try env.CallObjectMethod(iter, JavaIterator.nextMethodID)
            try body(item)
            env.DeleteLocalRef(item)
        }
        env.DeleteLocalRef(iter)
    }
}

private enum JavaMap {
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

private enum JavaSet {
    static var setClass: jclass?
    static var hashSetClass: jclass?
    static var iteratorMethodID: jmethodID?
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
        while try env.CallBooleanMethod(iter, JavaIterator.hasNextMethodID) != JNI_FALSE {
            let item = try env.CallObjectMethod(iter, JavaIterator.nextMethodID)
            try body(item)
            env.DeleteLocalRef(item)
        }
        env.DeleteLocalRef(iter)
    }
}

extension ArrayConverter: JavaConverter where ElementConverter: JavaConverter {
    public static var javaClass: jclass? {
        JavaList.listClass
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
    ValueConverter: JavaConverter {
    public static var javaClass: jclass? {
        JavaMap.mapClass
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

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        var result = SwiftType()
        try JavaSet.forEach(value, env: env) { _ in
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

// MARK: - Optional Type Conversion

extension OptionalConverter: JavaConverter where WrappedConverter: JavaConverter {
    public static var javaClass: jclass? {
        WrappedConverter.javaClass
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

// MARK: - Range Type Conversion

private enum KotlinRange {
    static var rangesKTClass: jclass?
    static var rangeToComparableMethodID: jmethodID?
    static var rangeToFloatMethodID: jmethodID?
    static var rangeToDoubleMethodID: jmethodID?

    static var rangeInterface: jclass?
    static var rangeStartMethodID: jmethodID?
    static var rangeEndInclusiveMethodID: jmethodID?

    static var intRangeClass: jclass?
    static var intRangeInitMethodID: jmethodID?

    static var longRangeClass: jclass?
    static var longRangeInitMethodID: jmethodID?

    static var uintRangeClass: jclass?
    static var uintRangeInitMethodID: jmethodID?

    static var ulongRangeClass: jclass?
    static var ulongRangeInitMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard rangesKTClass == nil else { return }

        rangesKTClass = try env.globalRef(env.FindClass("kotlin/ranges/RangesKt"))
        rangeToComparableMethodID = try env.GetStaticMethodID(rangesKTClass, "rangeTo", "(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lkotlin/ranges/ClosedRange;")
        rangeToFloatMethodID = try env.GetStaticMethodID(rangesKTClass, "rangeTo", "(FF)Lkotlin/ranges/ClosedFloatingPointRange;")
        rangeToDoubleMethodID = try env.GetStaticMethodID(rangesKTClass, "rangeTo", "(DD)Lkotlin/ranges/ClosedFloatingPointRange;")

        rangeInterface = try env.globalRef(env.FindClass("kotlin/ranges/ClosedRange"))
        rangeStartMethodID = try env.GetMethodID(rangeInterface, "getStart", "()Ljava/lang/Comparable;")
        rangeEndInclusiveMethodID = try env.GetMethodID(rangeInterface, "getEndInclusive", "()Ljava/lang/Comparable;")

        intRangeClass = try env.globalRef(env.FindClass("kotlin/ranges/IntRange"))
        intRangeInitMethodID = try env.GetMethodID(intRangeClass, "<init>", "(II)V")

        longRangeClass = try env.globalRef(env.FindClass("kotlin/ranges/LongRange"))
        longRangeInitMethodID = try env.GetMethodID(longRangeClass, "<init>", "(JJ)V")

        uintRangeClass = try env.globalRef(env.FindClass("kotlin/ranges/UIntRange"))
        uintRangeInitMethodID = try env.GetMethodID(uintRangeClass, "<init>", "(IILkotlin/jvm/internal/DefaultConstructorMarker;)V")

        ulongRangeClass = try env.globalRef(env.FindClass("kotlin/ranges/ULongRange"))
        ulongRangeInitMethodID = try env.GetMethodID(ulongRangeClass, "<init>", "(JJLkotlin/jvm/internal/DefaultConstructorMarker;)V")
    }
}

extension RangeConverter: JavaConverter where BoundConverter: JavaConverter {
    public static var javaClass: jclass? {
        // TODO: Can we use kotlin.ranges.OpenEndRange? It is only available in 1.7 and later
        KotlinRange.rangeInterface
    }

    public static func javaSetup(env: Env) throws {
        try KotlinRange.javaSetup(env: env)
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let start = try env.CallObjectMethod(value, KotlinRange.rangeStartMethodID)
        let lower = try BoundConverter.fromJava(object: start, env: env)
        // TODO: Can use endExclusive method from Kotlin 1.7?
//        let endExclusive = try env.CallObjectMethod(value, KotlinRange.rangeEndExclusiveMethodID)
//        let upper = try BoundConverter.fromJava(object: endExclusive, env: env)
        let endInclusive = try env.CallObjectMethod(value, KotlinRange.rangeEndInclusiveMethodID)
        let beforeUpper = try BoundConverter.fromJava(object: endInclusive, env: env)
        let upper = beforeUpper + 1

        guard lower <= upper else {
            throw RangeOutOfBoundsError(invalidRange: "\(lower)..<\(upper)")
        }
        return lower..<upper
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let start = value.lowerBound
        guard let endInclusive = (value.upperBound &- 1) > value.upperBound ? nil : value.upperBound - 1 else {
            throw RangeOutOfBoundsError(invalidRange: "\(value.lowerBound)...(\(value.upperBound) - 1)")
        }
        switch (start, endInclusive) {
        case let (start, endInclusive) as (Int8, Int8):
            return try env.NewObject(
                KotlinRange.intRangeClass,
                KotlinRange.intRangeInitMethodID,
                jvalue(i: jint(start)),
                jvalue(i: jint(endInclusive))
            )
        case let (start, endInclusive) as (Int16, Int16):
            return try env.NewObject(
                KotlinRange.intRangeClass,
                KotlinRange.intRangeInitMethodID,
                jvalue(i: jint(start)),
                jvalue(i: jint(endInclusive))
            )
        case let (start, endInclusive) as (Int32, Int32):
            return try env.NewObject(
                KotlinRange.intRangeClass,
                KotlinRange.intRangeInitMethodID,
                jvalue(i: jint(start)),
                jvalue(i: jint(endInclusive))
            )
        case let (start, endInclusive) as (Int64, Int64):
            return try env.NewObject(
                KotlinRange.longRangeClass,
                KotlinRange.longRangeInitMethodID,
                jvalue(j: jlong(start)),
                jvalue(j: jlong(endInclusive))
            )
        case let (start, endInclusive) as (Int, Int):
            return try env.NewObject(
                KotlinRange.longRangeClass,
                KotlinRange.longRangeInitMethodID,
                jvalue(j: jlong(start)),
                jvalue(j: jlong(endInclusive))
            )
        case let (start, endInclusive) as (UInt8, UInt8):
            return try env.NewObject(
                KotlinRange.uintRangeClass,
                KotlinRange.uintRangeInitMethodID,
                jvalue(i: jint(start)),
                jvalue(i: jint(endInclusive)),
                jvalue(l: nil)
            )
        case let (start, endInclusive) as (UInt16, UInt16):
            return try env.NewObject(
                KotlinRange.uintRangeClass,
                KotlinRange.uintRangeInitMethodID,
                jvalue(i: jint(start)),
                jvalue(i: jint(endInclusive)),
                jvalue(l: nil)
            )
        case let (start, endInclusive) as (UInt32, UInt32):
            return try env.NewObject(
                KotlinRange.uintRangeClass,
                KotlinRange.uintRangeInitMethodID,
                jvalue(i: jint(bitPattern: start)),
                jvalue(i: jint(bitPattern: endInclusive)),
                jvalue(l: nil)
            )
        case let (start, endInclusive) as (UInt64, UInt64):
            return try env.NewObject(
                KotlinRange.ulongRangeClass,
                KotlinRange.ulongRangeInitMethodID,
                jvalue(j: jlong(bitPattern: start)),
                jvalue(j: jlong(bitPattern: endInclusive)),
                jvalue(l: nil)
            )
        case let (start, endInclusive) as (UInt, UInt):
            return try env.NewObject(
                KotlinRange.ulongRangeClass,
                KotlinRange.ulongRangeInitMethodID,
                jvalue(j: jlong(bitPattern: UInt64(start))),
                jvalue(j: jlong(bitPattern: UInt64(endInclusive))),
                jvalue(l: nil)
            )
        default:
            // TODO: Open-ended ranges for non-integer types
//            return try env.CallStaticObjectMethod(
//                KotlinRange.rangesKTClass,
//                KotlinRange.rangeToComparableMethodID,
//                jvalue(l: BoundConverter.toJavaObject(value.lowerBound, env: env)),
//                jvalue(l: BoundConverter.toJavaObject(value.upperBound, env: env))
//            )
            fatalError("Open ended range with non-integer bound \"\(type(of: start))\" is unsupported")
        }
    }
}

extension ClosedRangeConverter: JavaConverter where BoundConverter: JavaConverter {
    public static var javaClass: jclass? {
        KotlinRange.rangeInterface
    }

    public static func javaSetup(env: Env) throws {
        try KotlinRange.javaSetup(env: env)
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let start = try env.CallObjectMethod(value, KotlinRange.rangeStartMethodID)
        let endInclusive = try env.CallObjectMethod(value, KotlinRange.rangeEndInclusiveMethodID)
        let lower = try BoundConverter.fromJava(object: start, env: env)
        let upper = try BoundConverter.fromJava(object: endInclusive, env: env)
        guard lower < upper else {
            // TODO: Empty closed ranges are expressed in Kotlin by having endInclusive < start. Should return an "empty" closed range somehow instead?
            throw RangeOutOfBoundsError(invalidRange: "\(lower)...\(upper)")
        }
        return lower...upper
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        switch value {
        case let value as ClosedRange<Int8>:
            return try env.NewObject(
                KotlinRange.intRangeClass,
                KotlinRange.intRangeInitMethodID,
                jvalue(i: jint(value.lowerBound)),
                jvalue(i: jint(value.upperBound))
            )
        case let value as ClosedRange<Int16>:
            return try env.NewObject(
                KotlinRange.intRangeClass,
                KotlinRange.intRangeInitMethodID,
                jvalue(i: jint(value.lowerBound)),
                jvalue(i: jint(value.upperBound))
            )
        case let value as ClosedRange<Int32>:
            return try env.NewObject(
                KotlinRange.intRangeClass,
                KotlinRange.intRangeInitMethodID,
                jvalue(i: jint(value.lowerBound)),
                jvalue(i: jint(value.upperBound))
            )
        case let value as ClosedRange<Int64>:
            return try env.NewObject(
                KotlinRange.longRangeClass,
                KotlinRange.longRangeInitMethodID,
                jvalue(j: jlong(value.lowerBound)),
                jvalue(j: jlong(value.upperBound))
            )
        case let value as ClosedRange<Int>:
            return try env.NewObject(
                KotlinRange.longRangeClass,
                KotlinRange.longRangeInitMethodID,
                jvalue(j: jlong(value.lowerBound)),
                jvalue(j: jlong(value.upperBound))
            )
        case let value as ClosedRange<UInt8>:
            return try env.NewObject(
                KotlinRange.uintRangeClass,
                KotlinRange.uintRangeInitMethodID,
                jvalue(i: jint(value.lowerBound)),
                jvalue(i: jint(value.upperBound)),
                jvalue(l: nil)
            )
        case let value as ClosedRange<UInt16>:
            return try env.NewObject(
                KotlinRange.uintRangeClass,
                KotlinRange.uintRangeInitMethodID,
                jvalue(i: jint(value.lowerBound)),
                jvalue(i: jint(value.upperBound)),
                jvalue(l: nil)
            )
        case let value as ClosedRange<UInt32>:
            return try env.NewObject(
                KotlinRange.uintRangeClass,
                KotlinRange.uintRangeInitMethodID,
                jvalue(i: jint(bitPattern: value.lowerBound)),
                jvalue(i: jint(bitPattern: value.upperBound)),
                jvalue(l: nil)
            )
        case let value as ClosedRange<UInt64>:
            return try env.NewObject(
                KotlinRange.ulongRangeClass,
                KotlinRange.ulongRangeInitMethodID,
                jvalue(j: jlong(bitPattern: value.lowerBound)),
                jvalue(j: jlong(bitPattern: value.upperBound)),
                jvalue(l: nil)
            )
        case let value as ClosedRange<UInt>:
            return try env.NewObject(
                KotlinRange.ulongRangeClass,
                KotlinRange.ulongRangeInitMethodID,
                jvalue(j: jlong(bitPattern: UInt64(value.lowerBound))),
                jvalue(j: jlong(bitPattern: UInt64(value.upperBound))),
                jvalue(l: nil)
            )
        case let value as ClosedRange<Float>:
            return try env.CallStaticObjectMethod(
                KotlinRange.rangesKTClass,
                KotlinRange.rangeToFloatMethodID,
                jvalue(f: value.lowerBound),
                jvalue(f: value.upperBound)
            )
        case let value as ClosedRange<Double>:
            return try env.CallStaticObjectMethod(
                KotlinRange.rangesKTClass,
                KotlinRange.rangeToDoubleMethodID,
                jvalue(d: value.lowerBound),
                jvalue(d: value.upperBound)
            )
        default:
            return try env.CallStaticObjectMethod(
                KotlinRange.rangesKTClass,
                KotlinRange.rangeToComparableMethodID,
                jvalue(l: BoundConverter.toJavaObject(value.lowerBound, env: env)),
                jvalue(l: BoundConverter.toJavaObject(value.upperBound, env: env))
            )
        }
    }
}

// MARK: - Tuple Type Conversions

private var pairClass: jclass!
private var pairConstructor: jmethodID!
private var pairFirstMethod: jmethodID!
private var pairSecondMethod: jmethodID!

extension Tuple2Converter: JavaConverter where T0: JavaConverter, T1: JavaConverter {
    public static var javaClass: jclass? {
        pairClass
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

private var tripleClass: jclass!
private var tripleConstructor: jmethodID!
private var tripleFirstMethod: jmethodID!
private var tripleSecondMethod: jmethodID!
private var tripleThirdMethod: jmethodID!

extension Tuple3Converter: JavaConverter where T0: JavaConverter, T1: JavaConverter, T2: JavaConverter {
    public static var javaClass: jclass? {
        tripleClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let v0 = try env.CallObjectMethod(value, tripleFirstMethod)
        let v1 = try env.CallObjectMethod(value, tripleSecondMethod)
        let v2 = try env.CallObjectMethod(value, tripleThirdMethod)
        return (
            try T0.fromJava(object: v0, env: env),
            try T1.fromJava(object: v1, env: env),
            try T2.fromJava(object: v2, env: env)
        )
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let v0 = try jvalue(l: T0.toJavaObject(value.0, env: env))
        let v1 = try jvalue(l: T1.toJavaObject(value.1, env: env))
        let v2 = try jvalue(l: T2.toJavaObject(value.2, env: env))
        let result = try env.NewObject(tripleClass, tripleConstructor, v0, v1, v2)
        env.DeleteLocalRef(v0.l)
        env.DeleteLocalRef(v1.l)
        env.DeleteLocalRef(v2.l)
        return result
    }

    public static func javaSetup(env: Env) throws {
        try T0.javaSetup(env: env)
        try T1.javaSetup(env: env)
        try T2.javaSetup(env: env)

        guard javaClass == nil else { return }
        tripleClass = try env.globalRef(env.FindClass("kotlin/Triple"))
        tripleConstructor = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
        tripleFirstMethod = try env.GetMethodID(javaClass, "getFirst", "()Ljava/lang/Object;")
        tripleSecondMethod = try env.GetMethodID(javaClass, "getSecond", "()Ljava/lang/Object;")
        tripleThirdMethod = try env.GetMethodID(javaClass, "getThird", "()Ljava/lang/Object;")
    }
}

private var tuple4Class: jclass!
private var tuple4Constructor: jmethodID!
private var tuple4FirstMethod: jmethodID!
private var tuple4SecondMethod: jmethodID!
private var tuple4ThirdMethod: jmethodID!
private var tuple4FourthMethod: jmethodID!

extension Tuple4Converter: JavaConverter where T0: JavaConverter, T1: JavaConverter, T2: JavaConverter, T3: JavaConverter {
    public static var javaClass: jclass? {
        tuple4Class
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

private var tuple5Class: jclass!
private var tuple5Constructor: jmethodID!
private var tuple5FirstMethod: jmethodID!
private var tuple5SecondMethod: jmethodID!
private var tuple5ThirdMethod: jmethodID!
private var tuple5FourthMethod: jmethodID!
private var tuple5FifthMethod: jmethodID!

extension Tuple5Converter: JavaConverter where T0: JavaConverter, T1: JavaConverter, T2: JavaConverter, T3: JavaConverter, T4: JavaConverter {
    public static var javaClass: jclass? {
        tuple5Class
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let v0 = try env.CallObjectMethod(value, tuple5FirstMethod)
        let v1 = try env.CallObjectMethod(value, tuple5SecondMethod)
        let v2 = try env.CallObjectMethod(value, tuple5ThirdMethod)
        let v3 = try env.CallObjectMethod(value, tuple5FourthMethod)
        let v4 = try env.CallObjectMethod(value, tuple5FifthMethod)
        return (
            try T0.fromJava(object: v0, env: env),
            try T1.fromJava(object: v1, env: env),
            try T2.fromJava(object: v2, env: env),
            try T3.fromJava(object: v3, env: env),
            try T4.fromJava(object: v4, env: env)
        )
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let v0 = try jvalue(l: T0.toJavaObject(value.0, env: env))
        let v1 = try jvalue(l: T1.toJavaObject(value.1, env: env))
        let v2 = try jvalue(l: T2.toJavaObject(value.2, env: env))
        let v3 = try jvalue(l: T3.toJavaObject(value.3, env: env))
        let v4 = try jvalue(l: T4.toJavaObject(value.4, env: env))
        let result = try env.NewObject(tuple5Class, tuple5Constructor, v0, v1, v2, v3, v4)
        env.DeleteLocalRef(v0.l)
        env.DeleteLocalRef(v1.l)
        env.DeleteLocalRef(v2.l)
        env.DeleteLocalRef(v3.l)
        env.DeleteLocalRef(v4.l)
        return result
    }

    public static func javaSetup(env: Env) throws {
        try T0.javaSetup(env: env)
        try T1.javaSetup(env: env)
        try T2.javaSetup(env: env)
        try T3.javaSetup(env: env)
        try T4.javaSetup(env: env)

        guard javaClass == nil else { return }
        tuple5Class = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/Tuple5"))
        tuple5Constructor = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
        tuple5FirstMethod = try env.GetMethodID(javaClass, "getFirst", "()Ljava/lang/Object;")
        tuple5SecondMethod = try env.GetMethodID(javaClass, "getSecond", "()Ljava/lang/Object;")
        tuple5ThirdMethod = try env.GetMethodID(javaClass, "getThird", "()Ljava/lang/Object;")
        tuple5FourthMethod = try env.GetMethodID(javaClass, "getFourth", "()Ljava/lang/Object;")
        tuple5FifthMethod = try env.GetMethodID(javaClass, "getFifth", "()Ljava/lang/Object;")
    }
}

private var tuple6Class: jclass!
private var tuple6Constructor: jmethodID!
private var tuple6FirstMethod: jmethodID!
private var tuple6SecondMethod: jmethodID!
private var tuple6ThirdMethod: jmethodID!
private var tuple6FourthMethod: jmethodID!
private var tuple6FifthMethod: jmethodID!
private var tuple6SixthMethod: jmethodID!

extension Tuple6Converter: JavaConverter where T0: JavaConverter, T1: JavaConverter, T2: JavaConverter, T3: JavaConverter, T4: JavaConverter, T5: JavaConverter {
    public static var javaClass: jclass? {
        tuple6Class
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let v0 = try env.CallObjectMethod(value, tuple6FirstMethod)
        let v1 = try env.CallObjectMethod(value, tuple6SecondMethod)
        let v2 = try env.CallObjectMethod(value, tuple6ThirdMethod)
        let v3 = try env.CallObjectMethod(value, tuple6FourthMethod)
        let v4 = try env.CallObjectMethod(value, tuple6FifthMethod)
        let v5 = try env.CallObjectMethod(value, tuple6SixthMethod)
        return (
            try T0.fromJava(object: v0, env: env),
            try T1.fromJava(object: v1, env: env),
            try T2.fromJava(object: v2, env: env),
            try T3.fromJava(object: v3, env: env),
            try T4.fromJava(object: v4, env: env),
            try T5.fromJava(object: v5, env: env)
        )
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let v0 = try jvalue(l: T0.toJavaObject(value.0, env: env))
        let v1 = try jvalue(l: T1.toJavaObject(value.1, env: env))
        let v2 = try jvalue(l: T2.toJavaObject(value.2, env: env))
        let v3 = try jvalue(l: T3.toJavaObject(value.3, env: env))
        let v4 = try jvalue(l: T4.toJavaObject(value.4, env: env))
        let v5 = try jvalue(l: T5.toJavaObject(value.5, env: env))
        let result = try env.NewObject(tuple6Class, tuple6Constructor, v0, v1, v2, v3, v4, v5)
        env.DeleteLocalRef(v0.l)
        env.DeleteLocalRef(v1.l)
        env.DeleteLocalRef(v2.l)
        env.DeleteLocalRef(v3.l)
        env.DeleteLocalRef(v4.l)
        env.DeleteLocalRef(v5.l)
        return result
    }

    public static func javaSetup(env: Env) throws {
        try T0.javaSetup(env: env)
        try T1.javaSetup(env: env)
        try T2.javaSetup(env: env)
        try T3.javaSetup(env: env)
        try T4.javaSetup(env: env)
        try T5.javaSetup(env: env)

        guard javaClass == nil else { return }
        tuple6Class = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/Tuple6"))
        tuple6Constructor = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
        tuple6FirstMethod = try env.GetMethodID(javaClass, "getFirst", "()Ljava/lang/Object;")
        tuple6SecondMethod = try env.GetMethodID(javaClass, "getSecond", "()Ljava/lang/Object;")
        tuple6ThirdMethod = try env.GetMethodID(javaClass, "getThird", "()Ljava/lang/Object;")
        tuple6FourthMethod = try env.GetMethodID(javaClass, "getFourth", "()Ljava/lang/Object;")
        tuple6FifthMethod = try env.GetMethodID(javaClass, "getFifth", "()Ljava/lang/Object;")
        tuple6SixthMethod = try env.GetMethodID(javaClass, "getSixth", "()Ljava/lang/Object;")
    }
}
