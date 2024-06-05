@_exported import FishyJoesCommonRuntime
import Foundation
@_exported import JNI

// MARK: - Java Type Conversion Protocols

public protocol JavaConverter: Converter {
    // TODO: batch rename this to "JNIType"
    associatedtype CType = jobject?

    static var javaClass: jclass? { get }

    // only defined for protocols
    static var externalWitnessClass: jclass? { get }

    static func javaSetup(env: Env) throws

    static func fromJava(_ value: CType, env: Env) throws -> SwiftType
    static func fromJava(object: jobject?, env: Env) throws -> SwiftType

    static func toJava(_ value: SwiftType, env: Env) throws -> CType
    static func toJavaObject(_ value: SwiftType, env: Env) throws -> jobject?
}

extension JavaConverter {
    public static var externalWitnessClass: jclass? { nil }
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
    static func mutateJava<R>(_ this: CType, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R
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

// MARK: - String Type Conversion

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

// MARK: - Data Type Conversion

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

// MARK: - URL Type Conversion

extension URL: JavaConverter {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!
    private static var toExternalFormMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        let externalForm = try env.CallObjectMethod(value, toExternalFormMethodID)
        let urlString = try String.fromJava(object: externalForm, env: env)
        guard let url = URL(string: urlString) else { throw MalformedURLError(message: "Not a valid URL: \(urlString)") }
        return url
    }

    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        let urlString = value.absoluteString
        let externalForm = try String.toJava(urlString, env: env)
        return try env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(l: externalForm))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/net/URL"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(Ljava/lang/String;)V")
        toExternalFormMethodID = try env.GetMethodID(javaClass, "toExternalForm", "()Ljava/lang/String;")
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

private enum KotlinSwiftRange {
    static var rangeClass: jclass?
    static var rangeConstructor: jmethodID?
    static var rangeGetLowerBoundMethodID: jmethodID?
    static var rangeGetUpperBoundMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard rangeClass == nil else { return }
        rangeClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/SwiftRange"))
        rangeConstructor = try env.GetMethodID(rangeClass, "<init>", "(Ljava/lang/Comparable;Ljava/lang/Comparable;)V")
        rangeGetLowerBoundMethodID = try env.GetMethodID(rangeClass, "getLowerBound", "()Ljava/lang/Comparable;")
        rangeGetUpperBoundMethodID = try env.GetMethodID(rangeClass, "getUpperBound", "()Ljava/lang/Comparable;")
    }
}

extension RangeConverter: JavaConverter where BoundConverter: JavaConverter {
    public static var javaClass: jclass? {
        KotlinSwiftRange.rangeClass
    }

    public static func javaSetup(env: Env) throws {
        try KotlinSwiftRange.javaSetup(env: env)
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let lowerBound = try BoundConverter.fromJava(object: env.CallObjectMethod(value, KotlinSwiftRange.rangeGetLowerBoundMethodID), env: env)
        let upperBound = try BoundConverter.fromJava(object: env.CallObjectMethod(value, KotlinSwiftRange.rangeGetUpperBoundMethodID), env: env)
        guard lowerBound <= upperBound else {
            throw InvalidRangeError(message: "\(lowerBound)..<\(upperBound)")
        }
        return lowerBound..<upperBound
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let lowerBound = value.lowerBound
        let upperBound = value.upperBound
        return try env.NewObject(
            KotlinSwiftRange.rangeClass,
            KotlinSwiftRange.rangeConstructor,
            jvalue(l: BoundConverter.toJavaObject(lowerBound, env: env)),
            jvalue(l: BoundConverter.toJavaObject(upperBound, env: env))
        )
    }
}

private enum KotlinSwiftClosedRange {
    static var rangeClass: jclass?
    static var rangeConstructor: jmethodID?
    static var rangeGetLowerBoundMethodID: jmethodID?
    static var rangeGetUpperBoundMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard rangeClass == nil else { return }
        rangeClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/SwiftClosedRange"))
        rangeConstructor = try env.GetMethodID(rangeClass, "<init>", "(Ljava/lang/Comparable;Ljava/lang/Comparable;)V")
        rangeGetLowerBoundMethodID = try env.GetMethodID(rangeClass, "getLowerBound", "()Ljava/lang/Comparable;")
        rangeGetUpperBoundMethodID = try env.GetMethodID(rangeClass, "getUpperBound", "()Ljava/lang/Comparable;")
    }
}

extension ClosedRangeConverter: JavaConverter where BoundConverter: JavaConverter {
    public static var javaClass: jclass? {
        KotlinSwiftClosedRange.rangeClass
    }

    public static func javaSetup(env: Env) throws {
        try KotlinSwiftClosedRange.javaSetup(env: env)
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let lowerBound = try BoundConverter.fromJava(object: env.CallObjectMethod(value, KotlinSwiftClosedRange.rangeGetLowerBoundMethodID), env: env)
        let upperBound = try BoundConverter.fromJava(object: env.CallObjectMethod(value, KotlinSwiftClosedRange.rangeGetUpperBoundMethodID), env: env)
        guard lowerBound <= upperBound else {
            throw InvalidRangeError(message: "\(lowerBound)...\(upperBound)")
        }
        return lowerBound...upperBound
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let lowerBound = value.lowerBound
        let upperBound = value.upperBound
        return try env.NewObject(
            KotlinSwiftClosedRange.rangeClass,
            KotlinSwiftClosedRange.rangeConstructor,
            jvalue(l: BoundConverter.toJavaObject(lowerBound, env: env)),
            jvalue(l: BoundConverter.toJavaObject(upperBound, env: env))
        )
    }
}

private enum KotlinResult {
    static var resultClass: jclass?

    static var successClass: jclass?
    static var successConstructor: jmethodID?
    static var successFieldId: jfieldID?

    static var failureClass: jclass?
    static var failureConstructor: jmethodID?
    static var failureFieldId: jfieldID?

    public static func javaSetup(env: Env) throws {
        guard resultClass == nil else { return }
        resultClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/TypedResult"))

        successClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/TypedResult$Success"))
        successConstructor = try env.GetMethodID(successClass, "<init>", "(Ljava/lang/Object;)V")
        successFieldId = try env.GetFieldID(successClass, "value", "Ljava/lang/Object;")

        failureClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/TypedResult$Failure"))
        failureConstructor = try env.GetMethodID(failureClass, "<init>", "(Ljava/lang/Object;)V")
        failureFieldId = try env.GetFieldID(failureClass, "exception", "Ljava/lang/Object;")
    }
}

extension ResultConverter: JavaConverter where SuccessConverter: JavaConverter, FailureConverter: JavaConverter {
    public static var javaClass: jclass? {
        KotlinResult.resultClass
    }

    public static func javaSetup(env: Env) throws {
        try KotlinResult.javaSetup(env: env)
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, KotlinResult.successClass) {
            let successValue = env.GetObjectField(value, KotlinResult.successFieldId)
            return .success(try SuccessConverter.fromJava(object: successValue, env: env))
        } else if env.IsInstanceOf(value, KotlinResult.failureClass) {
            let failureValue = env.GetObjectField(value, KotlinResult.failureFieldId)
            return .failure(try FailureConverter.fromJava(object: failureValue, env: env))
        } else {
            fatalError("Unknown result type? This shouldn't be possible")
        }
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        switch value {
        case .success(let success):
            let successValue = try SuccessConverter.toJavaObject(success, env: env)
            return try env.NewObject(KotlinResult.successClass, KotlinResult.successConstructor, jvalue(successValue))
        case .failure(let failure):
            let failureValue = try FailureConverter.toJavaObject(failure, env: env)
            return try env.NewObject(KotlinResult.failureClass, KotlinResult.failureConstructor, jvalue(failureValue))
        }
    }
}
