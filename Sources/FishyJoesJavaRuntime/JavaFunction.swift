import Foundation
import JNI
import FishyJoesCommonRuntime

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

extension Function0Converter: JavaConverter where R: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        return {
            let env = try escapingRef.vm.currentThreadEnv()
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

extension Function1Converter: JavaConverter where P0: JavaConverter, R: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        return { p0 in
            let env = try escapingRef.vm.currentThreadEnv()
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
        try P0.javaSetup(env: env)
        try R.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 1,
            invokePointer: unsafeBitCast(AnyFunction1.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}

extension Function2Converter: JavaConverter where P0: JavaConverter, P1: JavaConverter, R: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let escapingRef = try JavaReference(local: value, env: env)
        return { p0, p1 in
            let env = try escapingRef.vm.currentThreadEnv()
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
        try P0.javaSetup(env: env)
        try P1.javaSetup(env: env)
        try R.javaSetup(env: env)
        try SwiftFunctionImpl.javaSetup(
            arity: 2,
            invokePointer: unsafeBitCast(AnyFunction2.cInvoke, to: UnsafeMutableRawPointer.self),
            env: env
        )
    }
}
