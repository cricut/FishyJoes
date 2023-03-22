import FishyJoesJavaRuntime

var refClass: jclass?
var refConstructorID: jmethodID?

@_cdecl("JNI_OnLoad")
public func jniOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    return FishyJoesJavaRuntime.callbackBody(env!) { env in
        try Function2Converter<Int, Int, Int>.javaSetup(env: env)
        let bag = CStringBag()
        let javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/TestFunction"))
        try env.RegisterNatives(
            javaClass,
            JNINativeMethod(
                name: bag.add("fun0"),
                signature: bag.add("(Lkotlin/jvm/functions/Function2;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_fun0, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("fun1"),
                signature: bag.add("()Lkotlin/jvm/functions/Function2;"),
                fnPtr: unsafeBitCast(java_fun1, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("makeReference"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/TestReference;"),
                fnPtr: unsafeBitCast(java_ref_make, to: UnsafeMutableRawPointer.self)
            )
        )

        refClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/TestReference"))
        refConstructorID = try env.GetMethodID(refClass, "<init>", "(J)V")
        try env.RegisterNatives(
            refClass,
            JNINativeMethod(
                name: bag.add("append"),
                signature: bag.add("(J)V"),
                fnPtr: unsafeBitCast(java_ref_append, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("addr"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_ref_addr, to: UnsafeMutableRawPointer.self)
            )
        )

        return JNI_VERSION_1_4
    }
}

let java_fun0: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?) -> jobject? = { env, _, f in
    FishyJoesJavaRuntime.callbackBody(env) { env in
        let result = try Function2Converter<Int, Int, Int>.fromJava(f, env: env)(42, 100)
        return try String.toJava("\(result)", env: env)
    }
}

let java_fun1: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject) -> jobject? = { env, _ in
    FishyJoesJavaRuntime.callbackBody(env) { env in
        try Function2Converter<Int, Int, Int>.toJava({ x, y in x + y }, env: env)
    }
}

let java_ref_make: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject) -> jobject? = { env, _ in
    FishyJoesJavaRuntime.callbackBody(env) { env in
        let ptr = jvalue(pointer: Box<[Int64]>([]).retainedOpaque())
        return try env.NewObject(refClass, refConstructorID, ptr)
    }
}

let java_ref_append: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jlong) -> Void = { env, this, appendee in
    FishyJoesJavaRuntime.callbackBody(env) { env in
        try Box<[Int64]>.fromJava(this, env: env).value.append(Int64(appendee))
    }
}

let java_ref_addr: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject) -> jlong = { env, this in
    FishyJoesJavaRuntime.callbackBody(env) { env in
        let box = try Box<[Int64]>.fromJava(this, env: env)
        let storage = { (x: UnsafeRawPointer) in x }(box.value)
        return jlong(pointer: storage)
    }
}
