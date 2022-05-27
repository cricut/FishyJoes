import FishyJoesCommonRuntime
import Foundation
import JNI

private enum SwiftFunctionImpl {
    static var implClass: jclass?
    static var constructor: jmethodID?
    static var invokeMethods: [Int: jmethodID] = [:]

    public static func javaSetup(arity: Int, invokePointer: UnsafeMutableRawPointer, env: Env) throws {
        try AnyBox.javaSetup(env: env)
        if implClass == nil {
            implClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/SwiftFunctionImpl"))
            constructor = try env.GetMethodID(implClass, "<init>", "(IJ)V")
        }

        if invokeMethods[arity] == nil {
            let functionClass = try env.globalRef(env.FindClass("kotlin/jvm/functions/Function\(arity)"))
            let obj = "Ljava/lang/Object;"
            let invokeSignature = "(\(String(repeating: obj, count: arity)))\(obj)"

            let bag = CStringBag()
            try env.RegisterNatives(
                implClass,
                JNINativeMethod(
                    name: bag.add("invoke"),
                    signature: bag.add(invokeSignature),
                    fnPtr: invokePointer
                )
            )
            invokeMethods[arity] = try env.GetMethodID(functionClass, "invoke", invokeSignature)
        }
    }
}

// This code is really repetitive, but I'm not sure how it could be made better...

private struct AnyFunction0 {
    let invoke: (Env) throws -> jobject?

    static let cInvoke: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject) -> jobject? = { env, this in
        callbackBody(env) { env in
            try Box<Self>.fromJava(this, env: env).value.invoke(env)
        }
    }
}

private struct AnyFunction1 {
    let invoke: (Env, jobject?) throws -> jobject?

    static let cInvoke: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?) -> jobject? = { env, this, p0 in
        callbackBody(env) { env in
            try Box<Self>.fromJava(this, env: env).value.invoke(env, p0)
        }
    }
}

private struct AnyFunction2 {
    let invoke: (Env, jobject?, jobject?) throws -> jobject?

    static let cInvoke: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?, jobject?) -> jobject? = { env, this, p0, p1 in
        callbackBody(env) { env in
            try Box<Self>.fromJava(this, env: env).value.invoke(env, p0, p1)
        }
    }
}

private struct AnyFunction3 {
    let invoke: (Env, jobject?, jobject?, jobject?) throws -> jobject?

    static let cInvoke: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?, jobject?, jobject?) -> jobject? = { env, this, p0, p1, p2 in
        callbackBody(env) { env in
            try Box<Self>.fromJava(this, env: env).value.invoke(env, p0, p1, p2)
        }
    }
}

private struct AnyFunction4 {
    let invoke: (Env, jobject?, jobject?, jobject?, jobject?) throws -> jobject?

    static let cInvoke: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?, jobject?, jobject?, jobject?) -> jobject? = { env, this, p0, p1, p2, p3 in
        callbackBody(env) { env in
            try Box<Self>.fromJava(this, env: env).value.invoke(env, p0, p1, p2, p3)
        }
    }
}

private struct AnyFunction5 {
    let invoke: (Env, jobject?, jobject?, jobject?, jobject?, jobject?) throws -> jobject?

    static let cInvoke: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?, jobject?, jobject?, jobject?, jobject?) -> jobject? = { env, this, p0, p1, p2, p3, p4 in
        callbackBody(env) { env in
            try Box<Self>.fromJava(this, env: env).value.invoke(env, p0, p1, p2, p3, p4)
        }
    }
}

private struct AnyFunction6 {
    let invoke: (Env, jobject?, jobject?, jobject?, jobject?, jobject?, jobject?) throws -> jobject?

    static let cInvoke: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?, jobject?, jobject?, jobject?, jobject?, jobject?) -> jobject? = { env, this, p0, p1, p2, p3, p4, p5 in
        callbackBody(env) { env in
            try Box<Self>.fromJava(this, env: env).value.invoke(env, p0, p1, p2, p3, p4, p5)
        }
    }
}

extension Function0Converter: JavaConverter where R: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        let initThread = Thread.current
        return {
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.fromJava(
                object: env.CallObjectMethod(
                    escapingRef.object,
                    SwiftFunctionImpl.invokeMethods[0]
                ),
                env: env
            )
        }
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let erased = AnyFunction0 { env in
            try R.toJavaObject(value(), env: env)
        }
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(erased).retainedOpaque())))
        return try env.NewObject(SwiftFunctionImpl.implClass, SwiftFunctionImpl.constructor, jvalue(i: 0), ptr)
    }

    public static func javaSetup(env: Env) throws {
        try R.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 0,
            invokePointer: unsafeBitCast(AnyFunction0.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}

extension Function1Converter: JavaConverter where R: JavaConverter, P0: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        let initThread = Thread.current
        return { p0 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.fromJava(
                object: env.CallObjectMethod(
                    escapingRef.object,
                    SwiftFunctionImpl.invokeMethods[1],
                    jvalue(l: P0.toJavaObject(p0, env: env))
                ),
                env: env
            )
        }
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let erased = AnyFunction1 { env, p0 in
            let v0 = try P0.fromJava(object: p0, env: env)
            return try R.toJavaObject(value(v0), env: env)
        }
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(erased).retainedOpaque())))
        return try env.NewObject(SwiftFunctionImpl.implClass, SwiftFunctionImpl.constructor, jvalue(i: 1), ptr)
    }

    public static func javaSetup(env: Env) throws {
        try R.javaSetup(env: env)
        try P0.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 1,
            invokePointer: unsafeBitCast(AnyFunction1.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}

extension Function2Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        let initThread = Thread.current
        return { p0, p1 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.fromJava(
                object: env.CallObjectMethod(
                    escapingRef.object,
                    SwiftFunctionImpl.invokeMethods[2],
                    jvalue(l: P0.toJavaObject(p0, env: env)),
                    jvalue(l: P1.toJavaObject(p1, env: env))
                ),
                env: env
            )
        }
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let erased = AnyFunction2 { env, p0, p1 in
            let v0 = try P0.fromJava(object: p0, env: env)
            let v1 = try P1.fromJava(object: p1, env: env)
            return try R.toJavaObject(value(v0, v1), env: env)
        }
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(erased).retainedOpaque())))
        return try env.NewObject(SwiftFunctionImpl.implClass, SwiftFunctionImpl.constructor, jvalue(i: 2), ptr)
    }

    public static func javaSetup(env: Env) throws {
        try R.javaSetup(env: env)
        try P0.javaSetup(env: env)
        try P1.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 2,
            invokePointer: unsafeBitCast(AnyFunction2.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}

extension Function3Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.fromJava(
                object: env.CallObjectMethod(
                    escapingRef.object,
                    SwiftFunctionImpl.invokeMethods[3],
                    jvalue(l: P0.toJavaObject(p0, env: env)),
                    jvalue(l: P1.toJavaObject(p1, env: env)),
                    jvalue(l: P2.toJavaObject(p2, env: env))
                ),
                env: env
            )
        }
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let erased = AnyFunction3 { env, p0, p1, p2 in
            let v0 = try P0.fromJava(object: p0, env: env)
            let v1 = try P1.fromJava(object: p1, env: env)
            let v2 = try P2.fromJava(object: p2, env: env)
            return try R.toJavaObject(value(v0, v1, v2), env: env)
        }
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(erased).retainedOpaque())))
        return try env.NewObject(SwiftFunctionImpl.implClass, SwiftFunctionImpl.constructor, jvalue(i: 3), ptr)
    }

    public static func javaSetup(env: Env) throws {
        try R.javaSetup(env: env)
        try P0.javaSetup(env: env)
        try P1.javaSetup(env: env)
        try P2.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 3,
            invokePointer: unsafeBitCast(AnyFunction3.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}

extension Function4Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter, P3: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.fromJava(
                object: env.CallObjectMethod(
                    escapingRef.object,
                    SwiftFunctionImpl.invokeMethods[4],
                    jvalue(l: P0.toJavaObject(p0, env: env)),
                    jvalue(l: P1.toJavaObject(p1, env: env)),
                    jvalue(l: P2.toJavaObject(p2, env: env)),
                    jvalue(l: P3.toJavaObject(p3, env: env))
                ),
                env: env
            )
        }
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let erased = AnyFunction4 { env, p0, p1, p2, p3 in
            let v0 = try P0.fromJava(object: p0, env: env)
            let v1 = try P1.fromJava(object: p1, env: env)
            let v2 = try P2.fromJava(object: p2, env: env)
            let v3 = try P3.fromJava(object: p3, env: env)
            return try R.toJavaObject(value(v0, v1, v2, v3), env: env)
        }
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(erased).retainedOpaque())))
        return try env.NewObject(SwiftFunctionImpl.implClass, SwiftFunctionImpl.constructor, jvalue(i: 4), ptr)
    }

    public static func javaSetup(env: Env) throws {
        try R.javaSetup(env: env)
        try P0.javaSetup(env: env)
        try P1.javaSetup(env: env)
        try P2.javaSetup(env: env)
        try P3.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 4,
            invokePointer: unsafeBitCast(AnyFunction4.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}

extension Function5Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter, P3: JavaConverter, P4: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.fromJava(
                object: env.CallObjectMethod(
                    escapingRef.object,
                    SwiftFunctionImpl.invokeMethods[5],
                    jvalue(l: P0.toJavaObject(p0, env: env)),
                    jvalue(l: P1.toJavaObject(p1, env: env)),
                    jvalue(l: P2.toJavaObject(p2, env: env)),
                    jvalue(l: P3.toJavaObject(p3, env: env)),
                    jvalue(l: P4.toJavaObject(p4, env: env))
                ),
                env: env
            )
        }
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let erased = AnyFunction5 { env, p0, p1, p2, p3, p4 in
            let v0 = try P0.fromJava(object: p0, env: env)
            let v1 = try P1.fromJava(object: p1, env: env)
            let v2 = try P2.fromJava(object: p2, env: env)
            let v3 = try P3.fromJava(object: p3, env: env)
            let v4 = try P4.fromJava(object: p4, env: env)
            return try R.toJavaObject(value(v0, v1, v2, v3, v4), env: env)
        }
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(erased).retainedOpaque())))
        return try env.NewObject(SwiftFunctionImpl.implClass, SwiftFunctionImpl.constructor, jvalue(i: 5), ptr)
    }

    public static func javaSetup(env: Env) throws {
        try R.javaSetup(env: env)
        try P0.javaSetup(env: env)
        try P1.javaSetup(env: env)
        try P2.javaSetup(env: env)
        try P3.javaSetup(env: env)
        try P4.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 5,
            invokePointer: unsafeBitCast(AnyFunction5.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}

extension Function6Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter, P3: JavaConverter, P4: JavaConverter, P5: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4, p5 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.fromJava(
                object: env.CallObjectMethod(
                    escapingRef.object,
                    SwiftFunctionImpl.invokeMethods[6],
                    jvalue(l: P0.toJavaObject(p0, env: env)),
                    jvalue(l: P1.toJavaObject(p1, env: env)),
                    jvalue(l: P2.toJavaObject(p2, env: env)),
                    jvalue(l: P3.toJavaObject(p3, env: env)),
                    jvalue(l: P4.toJavaObject(p4, env: env)),
                    jvalue(l: P5.toJavaObject(p5, env: env))
                ),
                env: env
            )
        }
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let erased = AnyFunction6 { env, p0, p1, p2, p3, p4, p5 in
            let v0 = try P0.fromJava(object: p0, env: env)
            let v1 = try P1.fromJava(object: p1, env: env)
            let v2 = try P2.fromJava(object: p2, env: env)
            let v3 = try P3.fromJava(object: p3, env: env)
            let v4 = try P4.fromJava(object: p4, env: env)
            let v5 = try P5.fromJava(object: p5, env: env)
            return try R.toJavaObject(value(v0, v1, v2, v3, v4, v5), env: env)
        }
        let ptr = jvalue(j: jlong(UInt(bitPattern: Box(erased).retainedOpaque())))
        return try env.NewObject(SwiftFunctionImpl.implClass, SwiftFunctionImpl.constructor, jvalue(i: 6), ptr)
    }

    public static func javaSetup(env: Env) throws {
        try R.javaSetup(env: env)
        try P0.javaSetup(env: env)
        try P1.javaSetup(env: env)
        try P2.javaSetup(env: env)
        try P3.javaSetup(env: env)
        try P4.javaSetup(env: env)
        try P5.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 6,
            invokePointer: unsafeBitCast(AnyFunction6.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}
