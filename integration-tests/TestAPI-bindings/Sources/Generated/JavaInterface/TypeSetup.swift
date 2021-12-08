// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
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
        //print("setting up Swift.String...")
        try Swift.String.javaSetup(env: env)
        return JNI_VERSION_1_4
    }
}
