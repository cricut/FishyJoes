// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import EmojiFun
import EmojiFun_CommonInterface
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
        // print("setting up Function1Converter<Swift.String, Swift.Bool>...")
        try Function1Converter<Swift.String, Swift.Bool>.javaSetup(env: env)
        // print("setting up Function1Converter<Swift.String, Swift.Bool>...")
        try Function1Converter<Swift.String, Swift.Bool>.javaSetup(env: env)
        // print("setting up FutureConverter<Swift.Bool>...")
        try FutureConverter<Swift.Bool>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.String>...")
        try OptionalConverter<Swift.String>.javaSetup(env: env)
        // print("setting up SetConverter<Swift.String>...")
        try SetConverter<Swift.String>.javaSetup(env: env)
        // print("setting up EmojiFun.EmojiExplorer...")
        try EmojiFun.EmojiExplorer.javaSetup(env: env)
        try env.RegisterNatives(
            EmojiFun.EmojiExplorer.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("(J)Lcom/cricut/emojifun/EmojiExplorer;"),
                fnPtr: unsafeBitCast(java_EmojiFun_EmojiExplorer_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_enumerateKnown"),
                signature: bag.add("(Lkotlin/jvm/functions/Function1;)V"),
                fnPtr: unsafeBitCast(java_EmojiFun_EmojiExplorer_enumerateKnown, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_hello"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_EmojiFun_EmojiExplorer_hello, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_known"),
                signature: bag.add("()Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_get_EmojiFun_EmojiExplorer_known, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_random"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_EmojiFun_EmojiExplorer_random, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_randomUnique"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_EmojiFun_EmojiExplorer_randomUnique, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Swift.Bool...")
        try Swift.Bool.javaSetup(env: env)
        // print("setting up Swift.Int...")
        try Swift.Int.javaSetup(env: env)
        // print("setting up Swift.String...")
        try Swift.String.javaSetup(env: env)
        // print("setting up FishyJoesCommonRuntime.VoidConverter...")
        try FishyJoesCommonRuntime.VoidConverter.javaSetup(env: env)
        return JNI_VERSION_1_4
    }
    return result ?? JNI_VERSION_1_4
}
