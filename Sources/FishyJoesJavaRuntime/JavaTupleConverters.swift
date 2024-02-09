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
