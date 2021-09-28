import Foundation
@_exported import JNI
@_exported import FishyJoesCommonRuntime

public protocol JavaConvertible {
    associatedtype CType

    static var javaClass: jclass? { get }
    static var javaDescriptor: String { get }

    static func javaSetup(env: Env) throws

    init(fromJava value: CType, env: Env) throws
    init(fromJavaObject value: jobject?, env: Env) throws

    func toJava(env: Env) throws -> CType
    func toJavaObject(env: Env) throws -> jobject?
}

extension JavaConvertible where CType == jobject? {
    public func toJavaObject(env: Env) throws -> jobject? {
        try toJava(env: env)
    }
    public init(fromJavaObject value: jobject?, env: Env) throws {
        try self.init(fromJava: value, env: env)
    }
}

public protocol JavaMutable: JavaConvertible {
    func mutateJava(this: CType, env: Env) throws
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

extension Bool: JavaConvertible {
    public typealias CType = jboolean

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "Z" }
    private static var _valueMethodID: jmethodID!
    private static var _javaTrue: jobject!
    private static var _javaFalse: jobject!

    public init(fromJava value: CType, env: Env) throws {
        self = value == JNI_TRUE
    }

    public init(fromJavaObject value: jobject?, env: Env) throws {
        self = env.CallBooleanMethod(value, Self._valueMethodID)
    }

    public func toJava(env: Env) throws -> CType {
        self ? jboolean(JNI_TRUE) : jboolean(JNI_FALSE)
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        self ? Self._javaTrue : Self._javaFalse
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Boolean"))
        _valueMethodID = try javaNonNull(env.GetMethodID(javaClass, "booleanValue", "()Z"))
        let trueFieldID = try javaNonNull(env.GetStaticFieldID(javaClass, "TRUE", "Ljava/lang/Boolean;"))
        let falseFieldID = try javaNonNull(env.GetStaticFieldID(javaClass, "FALSE", "Ljava/lang/Boolean;"))
        _javaTrue = try env.globalRef(env.GetStaticObjectField(javaClass, trueFieldID))
        _javaFalse = try env.globalRef(env.GetStaticObjectField(javaClass, falseFieldID))
    }
}

extension Double: JavaConvertible {
    public typealias CType = jdouble

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "D" }
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public init(fromJava value: CType, env: Env) throws {
        self = value
    }

    public func toJava(env: Env) throws -> CType {
        self
    }

    public init(fromJavaObject value: jobject?, env: Env) throws {
        self = env.CallDoubleMethod(value, Self._valueMethodID)
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        try javaNonNull(env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(d: self)))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Double"))
        _valueMethodID = try javaNonNull(env.GetMethodID(javaClass, "doubleValue", "()D"))
        _constructorMethodID = try javaNonNull(env.GetMethodID(javaClass, "<init>", "(D)V"))
    }
}

extension Int64: JavaConvertible {
    public typealias CType = jlong

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "J" }
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public init(fromJava value: CType, env: Env) throws {
        self = Int64(value)
    }

    public func toJava(env: Env) throws -> CType {
        jlong(self)
    }

    public init(fromJavaObject value: jobject?, env: Env) throws {
        self = Int64(env.CallLongMethod(value, Self._valueMethodID))
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        try javaNonNull(env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(j: jlong(self))))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Long"))
        _valueMethodID = try javaNonNull(env.GetMethodID(javaClass, "longValue", "()J"))
        _constructorMethodID = try javaNonNull(env.GetMethodID(javaClass, "<init>", "(J)V"))
    }
}

extension Int32: JavaConvertible {
    public typealias CType = jint

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "I" }
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public init(fromJava value: CType, env: Env) throws {
        self = value
    }

    public func toJava(env: Env) throws -> CType {
        self
    }

    public init(fromJavaObject value: jobject?, env: Env) throws {
        self = env.CallIntMethod(value, Self._valueMethodID)
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        try javaNonNull(env.NewObject(Self.javaClass, Self._constructorMethodID, jvalue(i: self)))
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("java/lang/Int"))
        _valueMethodID = try javaNonNull(env.GetMethodID(javaClass, "intValue", "()I"))
        _constructorMethodID = try javaNonNull(env.GetMethodID(javaClass, "<init>", "(I)V"))
    }
}

extension Int: JavaConvertible {
    public typealias CType = Int64.CType
    public static var javaClass: jclass? { Int64.javaClass }
    public static var javaDescriptor: String { Int64.javaDescriptor }

    public init(fromJava value: CType, env: Env) throws {
        self = try Int(Int64(fromJava: value, env: env))
    }

    public func toJava(env: Env) throws -> CType {
        jlong(self)
    }

    public init(fromJavaObject value: jobject?, env: Env) throws {
        self = Int(try Int64(fromJavaObject: value, env: env))
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        try Int64(self).toJavaObject(env: env)
    }

    public static func javaSetup(env: Env) throws {
        try Int64.javaSetup(env: env)
    }
}

extension String: JavaConvertible {
    public typealias CType = jstring?

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "Ljava/lang/String;" }

    public init(fromJava value: CType, env: Env) throws {
        let length = env.GetStringLength(value)
        guard let chars = env.GetStringChars(value).0 else {
            throw JNIError(message: "string conversion failed")
        }
        self = String(utf16CodeUnits: chars, count: Int(length))
        env.ReleaseStringChars(value, chars)
    }

    public func toJava(env: Env) throws -> CType {
        let chars = Array(utf16)
        guard let jstr = env.NewString(chars, jsize(chars.count)) else {
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
        hasNextMethodID = try javaNonNull(env.GetMethodID(iteratorClass, "hasNext", "()Z"))
        nextMethodID = try javaNonNull(env.GetMethodID(iteratorClass, "next", "()Ljava/lang/Object;"))
    }
}

fileprivate enum JavaList {
    static var listClass: jclass?
    static var arrayListClass: jclass?
    static var iteratorMethodID: jmethodID?
    static var sizeMethodID: jmethodID?
    static var initMethodID: jmethodID?
    static var addMethodID: jmethodID?

    public static func javaSetup(env: Env) throws {
        guard listClass == nil else { return }

        try JavaIterator.javaSetup(env: env)

        listClass = try env.globalRef(env.FindClass("java/util/List"))
        iteratorMethodID = try javaNonNull(env.GetMethodID(listClass, "iterator", "()Ljava/util/Iterator;"))
        sizeMethodID = try javaNonNull(env.GetMethodID(listClass, "size", "()I"))

        arrayListClass = try env.globalRef(env.FindClass("java/util/ArrayList"))
        initMethodID = try javaNonNull(env.GetMethodID(arrayListClass, "<init>", "(I)V"))
        addMethodID = try javaNonNull(env.GetMethodID(arrayListClass, "add", "(Ljava/lang/Object;)Z"))
    }

    public static func forEach(_ listObject: jobject?, env: Env, body: (jobject) throws -> Void) throws {
        let iter = try javaNonNull(env.CallObjectMethod(listObject, iteratorMethodID))
        while (env.CallBooleanMethod(iter, JavaIterator.hasNextMethodID)) {
            let item = try javaNonNull(env.CallObjectMethod(iter, JavaIterator.nextMethodID))
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
        iteratorMethodID = try javaNonNull(env.GetMethodID(setClass, "iterator", "()Ljava/util/Iterator;"))

        hashSetClass = try env.globalRef(env.FindClass("java/util/HashSet"))
        initMethodID = try javaNonNull(env.GetMethodID(hashSetClass, "<init>", "(I)V"))
        addMethodID = try javaNonNull(env.GetMethodID(hashSetClass, "add", "(Ljava/lang/Object;)Z"))
    }

    public static func forEach(_ setObject: jobject?, env: Env, body: (jobject) throws -> Void) throws {
        let iter = try javaNonNull(env.CallObjectMethod(setObject, iteratorMethodID))
        while (env.CallBooleanMethod(iter, hasNextMethodID)) {
            let item = try javaNonNull(env.CallObjectMethod(iter, nextMethodID))
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
        entrySetMethodID = try javaNonNull(env.GetMethodID(mapClass, "entrySet", "()Ljava/util/Set;"))

        let entryClass = try javaNonNull(env.FindClass("java/util/Map$Entry"))
        getKeyMethodID = try javaNonNull(env.GetMethodID(entryClass, "getKey", "()Ljava/lang/Object;"))
        getValueMethodID = try javaNonNull(env.GetMethodID(entryClass, "getValue", "()Ljava/lang/Object;"))

        hashMapClass = try env.globalRef(env.FindClass("java/util/HashMap"))
        initMethodID = try javaNonNull(env.GetMethodID(hashMapClass, "<init>", "(I)V"))
        putMethodID = try javaNonNull(env.GetMethodID(hashMapClass, "put", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"))

        env.DeleteLocalRef(entryClass)
    }
}

extension Array: JavaConvertible where Element: JavaConvertible {
    public typealias CType = jobject?
    public static var javaClass: jclass? {
        JavaList.listClass
    }
    public static var javaDescriptor: String {
        "Ljava/util/List;"
    }

    public init(fromJava value: CType, env: Env) throws {
        //let length = env.CallIntMethod(value, JavaList.sizeMethodID)
        self.init()
        try JavaList.forEach(value, env: env) { item in
            append(try Element(fromJavaObject: item, env: env))
        }
    }

    public func toJava(env: Env) throws -> CType {
        let array = try javaNonNull(env.NewObject(JavaList.arrayListClass, JavaList.initMethodID, jvalue(i: jint(count))))
        for value in self {
            let javaValue = try value.toJavaObject(env: env)
            _ = env.CallBooleanMethod(array, JavaList.addMethodID, jvalue(l: javaValue))
            env.DeleteLocalRef(javaValue)
        }
        return array
    }

    public static func javaSetup(env: Env) throws {
        try JavaList.javaSetup(env: env)
    }
}

extension Dictionary: JavaConvertible where Key: JavaConvertible, Value: JavaConvertible {
    public typealias CType = jobject?
    public static var javaClass: jclass? {
        JavaMap.mapClass
    }
    public static var javaDescriptor: String {
        "Ljava/util/Map;"
    }

    public init(fromJava value: CType, env: Env) throws {
        let entries = try javaNonNull(env.CallObjectMethod(value, JavaMap.entrySetMethodID))
        self = [:]
        try JavaSet.forEach(entries, env: env) { entry in
            let key = env.CallObjectMethod(entry, JavaMap.getKeyMethodID)
            let value = env.CallObjectMethod(entry, JavaMap.getValueMethodID)
            self[try Key(fromJavaObject: key, env: env)] = try Value(fromJavaObject: value, env: env)
            env.DeleteLocalRef(key)
            env.DeleteLocalRef(value)
        }
    }

    public func toJava(env: Env) throws -> CType {
        let hashMap = try javaNonNull(env.NewObject(JavaMap.hashMapClass, JavaMap.initMethodID, jvalue(i: jint(count))))
        for (key, value) in self {
            let javaKey = try key.toJavaObject(env: env)
            let javaValue = try value.toJavaObject(env: env)
            let prevValue = env.CallObjectMethod(hashMap, JavaMap.putMethodID, jvalue(l: javaKey), jvalue(l: javaValue))
            env.DeleteLocalRef(javaKey)
            env.DeleteLocalRef(javaValue)
            env.DeleteLocalRef(prevValue)
        }
        return hashMap
    }

    public static func javaSetup(env: Env) throws {
        try JavaSet.javaSetup(env: env)
        try JavaMap.javaSetup(env: env)
    }
}

extension Set: JavaConvertible where Element: JavaConvertible {
    public typealias CType = jobject?
    public static var javaClass: jclass? {
        JavaSet.setClass
    }
    public static var javaDescriptor: String {
        "Ljava/util/Set;"
    }

    public init(fromJava value: CType, env: Env) throws {
        self = []
        try JavaSet.forEach(value, env: env) { entry in
            self.insert(try Element(fromJavaObject: value, env: env))
        }
    }

    public func toJava(env: Env) throws -> CType {
        let hashSet = try javaNonNull(env.NewObject(JavaSet.hashSetClass, JavaSet.initMethodID, jvalue(i: jint(count))))
        for value in self {
            let javaValue = try value.toJavaObject(env: env)
            _ = env.CallBooleanMethod(hashSet, JavaSet.addMethodID, jvalue(l: javaValue))
            env.DeleteLocalRef(javaValue)
        }
        return hashSet
    }

    public static func javaSetup(env: Env) throws {
        try JavaSet.javaSetup(env: env)
    }
}

extension Optional: JavaConvertible where Wrapped: JavaConvertible {
    public typealias CType = jobject?
    public static var javaClass: jclass? {
        Wrapped.javaClass
    }
    public static var javaDescriptor: String {
        Wrapped.javaDescriptor
    }

    public init(fromJava value: CType, env: Env) throws {
        if value == nil {
            self = nil
        } else {
            self = try Wrapped(fromJavaObject: value, env: env)
        }
    }

    public func toJava(env: Env) throws -> CType {
        if let wrapped = self {
            return try wrapped.toJavaObject(env: env)
        } else {
            return nil
        }
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
    }
}

public protocol SwiftTypeProxy: JavaConvertible {
    associatedtype ProxyFor
    static func proxyInit(fromJava value: CType, env: Env) throws -> ProxyFor
    static func proxyToJava(for object: ProxyFor, env: Env) throws -> CType
}

public struct Tuple2<T0: JavaConvertible, T1: JavaConvertible> {
    let e0: T0
    let e1: T1
}

public struct Tuple4<T0: JavaConvertible, T1: JavaConvertible, T2: JavaConvertible, T3: JavaConvertible> {
    let e0: T0
    let e1: T1
    let e2: T2
    let e3: T3
}

fileprivate var pairClass: jclass!
fileprivate var pairConstructor: jmethodID!
fileprivate var pairFirstMethod: jmethodID!
fileprivate var pairSecondMethod: jmethodID!

extension Tuple2: SwiftTypeProxy {
    public typealias ProxyFor = (T0, T1)
    public typealias CType = jobject?

    public static func proxyInit(fromJava value: CType, env: Env) throws -> ProxyFor {
        let proxy = try Self(fromJava: value, env: env)
        return (proxy.e0, proxy.e1)
    }

    public static func proxyToJava(for object: ProxyFor, env: Env) throws -> CType {
        try Tuple2(e0: object.0, e1: object.1).toJava(env: env)
    }

    public static var javaClass: jclass? {
        pairClass
    }
    public static var javaDescriptor: String {
        "Lkotlin/Pair;"
    }

    public init(fromJava value: CType, env: Env) throws {
        let v0 = env.CallObjectMethod(value, pairFirstMethod)
        let v1 = env.CallObjectMethod(value, pairSecondMethod)
        e0 = try T0.init(fromJavaObject: v0, env: env)
        e1 = try T1.init(fromJavaObject: v1, env: env)
    }

    public func toJava(env: Env) throws -> CType {
        let v0 = try jvalue(l: e0.toJavaObject(env: env))
        let v1 = try jvalue(l: e1.toJavaObject(env: env))
        let result = try javaNonNull(env.NewObject(pairClass, pairConstructor, v0, v1))
        env.DeleteLocalRef(v0.l)
        env.DeleteLocalRef(v1.l)
        return result
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        pairClass = try env.globalRef(env.FindClass("kotlin/Pair"))
        pairConstructor = try javaNonNull(env.GetMethodID(javaClass, "<init>", "(Ljava/lang/Object;Ljava/lang/Object;)V"))
        pairFirstMethod = try javaNonNull(env.GetMethodID(javaClass, "getFirst", "()Ljava/lang/Object;"))
        pairSecondMethod = try javaNonNull(env.GetMethodID(javaClass, "getSecond", "()Ljava/lang/Object;"))
    }
}


fileprivate var tuple4Class: jclass!
fileprivate var tuple4Constructor: jmethodID!
fileprivate var tuple4FirstMethod: jmethodID!
fileprivate var tuple4SecondMethod: jmethodID!
fileprivate var tuple4ThirdMethod: jmethodID!
fileprivate var tuple4FourthMethod: jmethodID!
extension Tuple4: SwiftTypeProxy {
    public typealias ProxyFor = (T0, T1, T2, T3)
    public typealias CType = jobject?

    public static func proxyInit(fromJava value: CType, env: Env) throws -> ProxyFor {
        let proxy = try Self(fromJava: value, env: env)
        return (proxy.e0, proxy.e1, proxy.e2, proxy.e3)
    }

    public static func proxyToJava(for object: ProxyFor, env: Env) throws -> CType {
        try Tuple4(e0: object.0, e1: object.1, e2: object.2, e3: object.3).toJava(env: env)
    }

    public static var javaClass: jclass? {
        tuple4Class
    }
    public static var javaDescriptor: String {
        "Lcom/cricut/fishyjoes/runtime/Tuple4;"
    }

    public init(fromJava value: CType, env: Env) throws {
        let v0 = env.CallObjectMethod(value, tuple4FirstMethod)
        let v1 = env.CallObjectMethod(value, tuple4SecondMethod)
        let v2 = env.CallObjectMethod(value, tuple4ThirdMethod)
        let v3 = env.CallObjectMethod(value, tuple4FourthMethod)
        e0 = try T0.init(fromJavaObject: v0, env: env)
        e1 = try T1.init(fromJavaObject: v1, env: env)
        e2 = try T2.init(fromJavaObject: v2, env: env)
        e3 = try T3.init(fromJavaObject: v3, env: env)
    }

    public func toJava(env: Env) throws -> CType {
        let v0 = try jvalue(l: e0.toJavaObject(env: env))
        let v1 = try jvalue(l: e1.toJavaObject(env: env))
        let v2 = try jvalue(l: e2.toJavaObject(env: env))
        let v3 = try jvalue(l: e3.toJavaObject(env: env))
        let result = try javaNonNull(env.NewObject(tuple4Class, tuple4Constructor, v0, v1, v2, v3))
        env.DeleteLocalRef(v0.l)
        env.DeleteLocalRef(v1.l)
        env.DeleteLocalRef(v2.l)
        env.DeleteLocalRef(v3.l)
        return result
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        tuple4Class = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/Tuple4"))
        tuple4Constructor = try javaNonNull(env.GetMethodID(javaClass, "<init>", "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"))
        tuple4FirstMethod = try javaNonNull(env.GetMethodID(javaClass, "getFirst", "()Ljava/lang/Object;"))
        tuple4SecondMethod = try javaNonNull(env.GetMethodID(javaClass, "getSecond", "()Ljava/lang/Object;"))
        tuple4ThirdMethod = try javaNonNull(env.GetMethodID(javaClass, "getThird", "()Ljava/lang/Object;"))
        tuple4FourthMethod = try javaNonNull(env.GetMethodID(javaClass, "getFourth", "()Ljava/lang/Object;"))
    }
}
