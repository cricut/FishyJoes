import FishyJoesJavaRuntime

@_cdecl("JNI_OnLoad")
public func JNIOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    return FishyJoesJavaRuntime.callbackBody(env!) { env in
        try Function2Converter<Int, Int, Int>.javaSetup(env: env)
        let bag = CStringBag()
        let javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/TestFunction"))
        try javaOk(
            env.RegisterNatives(
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
                )
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
