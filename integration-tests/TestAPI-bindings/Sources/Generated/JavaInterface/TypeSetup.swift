// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesJavaRuntime
import Foundation
import TestAPI

@_cdecl("JNI_OnLoad")
public func JNIOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    return FishyJoesJavaRuntime.callbackBody(env!) { env in
        let bag = CStringBag()
        //print("setting up Bool...")
        try Bool.javaSetup(env: env)
        //print("setting up Double...")
        try Double.javaSetup(env: env)
        //print("setting up ExportedByReference...")
        try ExportedByReference.javaSetup(env: env)
        try env.RegisterNatives(ExportedByReference.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/ExportedByReference;"),
                fnPtr: unsafeBitCast(java_ExportedByReference_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_text"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_ExportedByReference_text, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_finalize"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(ExportedByReference._javaFinalizer, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_toString"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(ExportedByReference._javaToString, to: UnsafeMutableRawPointer.self)
            )
        )
        //print("setting up Float...")
        try Float.javaSetup(env: env)
        //print("setting up Int...")
        try Int.javaSetup(env: env)
        //print("setting up Int16...")
        try Int16.javaSetup(env: env)
        //print("setting up Int32...")
        try Int32.javaSetup(env: env)
        //print("setting up Int8...")
        try Int8.javaSetup(env: env)
        //print("setting up Primitives...")
        try Primitives.javaSetup(env: env)
        try env.RegisterNatives(Primitives.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoBool"),
                signature: bag.add("(Z)Z"),
                fnPtr: unsafeBitCast(java_Primitives_echoBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt8"),
                signature: bag.add("(B)B"),
                fnPtr: unsafeBitCast(java_Primitives_echoUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt16"),
                signature: bag.add("(S)S"),
                fnPtr: unsafeBitCast(java_Primitives_echoUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt32"),
                signature: bag.add("(I)I"),
                fnPtr: unsafeBitCast(java_Primitives_echoUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt8"),
                signature: bag.add("(B)B"),
                fnPtr: unsafeBitCast(java_Primitives_echoInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt16"),
                signature: bag.add("(S)S"),
                fnPtr: unsafeBitCast(java_Primitives_echoInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt32"),
                signature: bag.add("(I)I"),
                fnPtr: unsafeBitCast(java_Primitives_echoInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoFloat"),
                signature: bag.add("(F)F"),
                fnPtr: unsafeBitCast(java_Primitives_echoFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoDouble"),
                signature: bag.add("(D)D"),
                fnPtr: unsafeBitCast(java_Primitives_echoDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_falseBool"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_get_Primitives_falseBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_trueBool"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_get_Primitives_trueBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_Primitives_minUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_Primitives_minUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_Primitives_minUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_Primitives_minInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_Primitives_minInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_Primitives_minInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_minInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroFloat"),
                signature: bag.add("()F"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minFloat"),
                signature: bag.add("()F"),
                fnPtr: unsafeBitCast(java_get_Primitives_minFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxFloat"),
                signature: bag.add("()F"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroDouble"),
                signature: bag.add("()D"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minDouble"),
                signature: bag.add("()D"),
                fnPtr: unsafeBitCast(java_get_Primitives_minDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxDouble"),
                signature: bag.add("()D"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxDouble, to: UnsafeMutableRawPointer.self)
            )
        )
        //print("setting up Swift.String...")
        try Swift.String.javaSetup(env: env)
        //print("setting up UInt16...")
        try UInt16.javaSetup(env: env)
        //print("setting up UInt32...")
        try UInt32.javaSetup(env: env)
        //print("setting up UInt8...")
        try UInt8.javaSetup(env: env)
        return JNI_VERSION_1_4
    }
}
