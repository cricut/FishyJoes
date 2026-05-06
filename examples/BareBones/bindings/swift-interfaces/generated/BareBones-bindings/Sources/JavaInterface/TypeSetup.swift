// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import BareBones
import BareBones_CommonInterface
import FishyJoesJavaRuntime
import Foundation

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("JNI_OnLoad")
public func jniOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    let result = FishyJoesJavaRuntime.callbackBody(env!) { (env) -> jint? in
        let bag = CStringBag()
        // print("setting up BareBones.Skeleton...")
        try BareBones.Skeleton.javaSetup(env: env)
        try env.RegisterNatives(
            BareBones.Skeleton.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_boneCount"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_BareBones_Skeleton_boneCount, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Swift.Int...")
        try Swift.Int.javaSetup(env: env)
        return JNI_VERSION_1_4
    }
    return result ?? JNI_VERSION_1_4
}
