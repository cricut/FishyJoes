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
        self.init(j: int)
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
        self = env.fns.CallBooleanMethodA(env.env, value, Self._valueMethodID, nil) == JNI_TRUE
    }

    public func toJava(env: Env) throws -> CType {
        self ? jboolean(JNI_TRUE) : jboolean(JNI_FALSE)
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        self ? Self._javaTrue : Self._javaFalse
    }

    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.fns.FindClass(env.env, "java/lang/Boolean"))
        _valueMethodID = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "booleanValue", "()Z"))
        let trueFieldID = try javaNonNull(env.fns.GetStaticFieldID(env.env, javaClass, "TRUE", "Ljava/lang/Boolean;"))
        let falseFieldID = try javaNonNull(env.fns.GetStaticFieldID(env.env, javaClass, "FALSE", "Ljava/lang/Boolean;"))
        _javaTrue = try env.globalRef(env.fns.GetStaticObjectField(env.env, javaClass, trueFieldID))
        _javaFalse = try env.globalRef(env.fns.GetStaticObjectField(env.env, javaClass, falseFieldID))
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
        self = env.fns.CallDoubleMethodA(env.env, value, Self._valueMethodID, nil)
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        var arg = jvalue(d: self)
        return try javaNonNull(env.fns.NewObjectA(env.env, Self.javaClass, Self._constructorMethodID, &arg))
    }

    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.fns.FindClass(env.env, "java/lang/Double"))
        _valueMethodID = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "doubleValue", "()D"))
        _constructorMethodID = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "<init>", "(D)V"))
    }
}

extension Int: JavaConvertible {
    public typealias CType = jlong

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "J" }
    private static var _valueMethodID: jmethodID!
    private static var _constructorMethodID: jmethodID!

    public init(fromJava value: CType, env: Env) throws {
        self = value
    }

    public func toJava(env: Env) throws -> CType {
        self
    }

    public init(fromJavaObject value: jobject?, env: Env) throws {
        self = env.fns.CallLongMethodA(env.env, value, Self._valueMethodID, nil)
    }

    public func toJavaObject(env: Env) throws -> jobject? {
        var arg = jvalue(j: self)
        return try javaNonNull(env.fns.NewObjectA(env.env, Self.javaClass, Self._constructorMethodID, &arg))
    }

    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.fns.FindClass(env.env, "java/lang/Long"))
        _valueMethodID = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "longValue", "()J"))
        _constructorMethodID = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "<init>", "(J)V"))
    }
}

extension String: JavaConvertible {
    public typealias CType = jstring?

    public static var javaClass: jclass?
    public static var javaDescriptor: String { "Ljava/lang/String;" }

    public init(fromJava value: CType, env: Env) throws {
        let length = env.fns.GetStringLength(env.env, value)
        guard let chars = env.fns.GetStringChars(env.env, value, nil) else {
            throw JNIError(message: "string conversion failed")
        }
        self = String(utf16CodeUnits: chars, count: Int(length))
        env.fns.ReleaseStringChars(env.env, value, chars)
    }

    public func toJava(env: Env) throws -> CType {
        let chars = Array(utf16)
        guard let jstr = env.fns.NewString(env.env, chars, jsize(chars.count)) else {
            throw JNIError(message: "string allocation failed")
        }
        return jstr
    }

    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.fns.FindClass(env.env, "java/lang/String"))
    }
}

// extension Set: JavaConvertible where Element: JavaConvertible {
//     public init(fromJava value: jvalue, env: Env) throws {
//         throw JSException(message: "TODO: implement Swift.Set.init(fromJava:env:)")
//     }

//     public func toJava(env: Env) throws -> jvalue {
//         var global: jvalue
//         try check(napi_get_global(env, &global))
//         var setConstructor: jvalue
//         try check(napi_get_named_property(env, global, "Set", &setConstructor))

//         var array: jvalue
//         try check(napi_create_array_with_length(env, self.count, &array))

//         for (index, value) in self.enumerated() {
//             try check(napi_set_element(env, array, UInt32(index), value.toJava(env: env)))
//         }

//         var result: jvalue
//         try check(napi_new_instance(env, setConstructor, 1, &array, &result))
//         return result
//     }
// }

// extension Dictionary: JavaConvertible where Key: JavaConvertible, Value: JavaConvertible {
//     public init(fromJava value: jvalue, env: Env) throws {
//         throw JSException(message: "TODO: implement Swift.Dictionary.init(fromJava:env:)")
//     }

//     public func toJava(env: Env) throws -> jvalue {
//         var global: jvalue
//         try check(napi_get_global(env, &global))
//         var mapConstructor: jvalue
//         try check(napi_get_named_property(env, global, "Map", &mapConstructor))

//         var map: jvalue
//         try check(napi_new_instance(env, mapConstructor, 0, nil, &map))

//         var mapSet: jvalue
//         try check(napi_get_named_property(env, map, "set", &mapSet))

//         var unusedOut: jvalue
//         for (key, value) in self {
//             try check(napi_call_function(env, map, mapSet, 2, [key.toJava(env: env), value.toJava(env: env)], &unusedOut))
//         }

//         return map
//     }
// }

fileprivate var arrayJavaClasses: [ObjectIdentifier: jclass] = [:]
// TODO: unboxed arrays
extension Array: JavaConvertible where Element: JavaConvertible {
    public typealias CType = jarray?
    public static var javaClass: jclass? {
        fatalError("\(#file):\(#line): TODO")
        // "[Ljava/lang/object;"
    }
    public static var javaDescriptor: String {
        "[" + Element.javaDescriptor
    }

    public init(fromJava value: CType, env: Env) throws {
        let length = env.fns.GetArrayLength(env.env, value)
        self = try (0..<length).map { index in
            let element = try javaNonNull(env.fns.GetObjectArrayElement(env.env, value, index))
            return try Element(fromJavaObject: element, env: env)
        }
    }

    public func toJava(env: Env) throws -> CType {
        let array = try javaNonNull(env.fns.NewObjectArray(env.env, jsize(self.count), Element.javaClass, nil))
        for (index, value) in self.enumerated() {
            try env.fns.SetObjectArrayElement(env.env, array, jsize(index), value.toJavaObject(env: env))
        }
        return array
    }

    public static func javaSetup(env: Env) throws {
    }
}

extension Dictionary: JavaConvertible where Key: JavaConvertible, Value: JavaConvertible {
    public typealias CType = jobject?
    public static var javaClass: jclass? {
        fatalError("\(#file):\(#line): TODO")
        // "[Ljava/lang/object;"
    }
    public static var javaDescriptor: String {
        "Ljava/util/Map;"
    }

    public init(fromJava value: CType, env: Env) throws {
        fatalError("\(#file):\(#line): TODO")
        // let length = env.fns.GetArrayLength(env.env, value)
        // self = try (0..<length).map { index in
        //     let element = try javaNonNull(env.fns.GetObjectArrayElement(env.env, value, index))
        //     return try Element(fromJavaObject: element, env: env)
        // }
    }

    public func toJava(env: Env) throws -> CType {
        fatalError("\(#file):\(#line): TODO")
        // let array = try javaNonNull(env.fns.NewObjectArray(env.env, jsize(self.count), Element.javaClass, nil))
        // for (index, value) in self.enumerated() {
        //     try env.fns.SetObjectArrayElement(env.env, array, jsize(index), value.toJavaObject(env: env))
        // }
        // return array
    }

    public static func javaSetup(env: Env) throws {
    }
}

extension Set: JavaConvertible where Element: JavaConvertible {
    public typealias CType = jobject?
    public static var javaClass: jclass? {
        fatalError("\(#file):\(#line): TODO")
        // "[Ljava/lang/object;"
    }
    public static var javaDescriptor: String {
        "Ljava/util/Map;"
    }

    public init(fromJava value: CType, env: Env) throws {
        fatalError("\(#file):\(#line): TODO")
        // let length = env.fns.GetArrayLength(env.env, value)
        // self = try (0..<length).map { index in
        //     let element = try javaNonNull(env.fns.GetObjectArrayElement(env.env, value, index))
        //     return try Element(fromJavaObject: element, env: env)
        // }
    }

    public func toJava(env: Env) throws -> CType {
        fatalError("\(#file):\(#line): TODO")
        // let array = try javaNonNull(env.fns.NewObjectArray(env.env, jsize(self.count), Element.javaClass, nil))
        // for (index, value) in self.enumerated() {
        //     try env.fns.SetObjectArrayElement(env.env, array, jsize(index), value.toJavaObject(env: env))
        // }
        // return array
    }

    public static func javaSetup(env: Env) throws {
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
    }
}

public struct Tuple2<T0: JavaConvertible, T1: JavaConvertible> {
    let e0: T0
    let e1: T1
}

extension Tuple2 {
    public static func proxyInit(fromJava value: CType, env: Env) throws -> (T0, T1) {
        let proxy = try Self(fromJava: value, env: env)
        return (proxy.e0, proxy.e1)
    }
}

fileprivate var pairClass: jclass!
fileprivate var pairConstructor: jmethodID!
fileprivate var pairFirstMethod: jmethodID!
fileprivate var pairSecondMethod: jmethodID!

extension Tuple2: JavaConvertible {
    public typealias CType = jobject?
    public static var javaClass: jclass? {
        pairClass
    }
    public static var javaDescriptor: String {
        "Lkotlin/Pair;"
    }

    public init(fromJava value: CType, env: Env) throws {
        let v0 = env.fns.CallObjectMethodA(env.env, value, pairFirstMethod, nil)
        let v1 = env.fns.CallObjectMethodA(env.env, value, pairSecondMethod, nil)
        e0 = try T0.init(fromJavaObject: v0, env: env)
        e1 = try T1.init(fromJavaObject: v1, env: env)
    }

    public func toJava(env: Env) throws -> CType {
        let args = try [
            jvalue(l: e0.toJavaObject(env: env)),
            jvalue(l: e1.toJavaObject(env: env)),
        ]
        return try javaNonNull(env.fns.NewObjectA(env.env, pairClass, pairConstructor, args))
    }

    public static func javaSetup(env: Env) throws {
        pairClass = try env.globalRef(env.fns.FindClass(env.env, "kotlin/Pair"))
        pairConstructor = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "<init>", "(Ljava/lang/Object;Ljave/lang/Object;)V"))
        pairFirstMethod = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "first", "()Ljava/lang/Object;"))
        pairSecondMethod = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, "second", "()Ljava/lang/Object;"))
    }
}
