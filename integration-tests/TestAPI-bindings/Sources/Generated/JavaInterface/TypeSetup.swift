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
        //print("setting up ArrayConverter<OptionalConverter<Bool>>...")
        try ArrayConverter<OptionalConverter<Bool>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<Double>>...")
        try ArrayConverter<OptionalConverter<Double>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<Float>>...")
        try ArrayConverter<OptionalConverter<Float>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<Int16>>...")
        try ArrayConverter<OptionalConverter<Int16>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<Int32>>...")
        try ArrayConverter<OptionalConverter<Int32>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<Int8>>...")
        try ArrayConverter<OptionalConverter<Int8>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<UInt16>>...")
        try ArrayConverter<OptionalConverter<UInt16>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<UInt32>>...")
        try ArrayConverter<OptionalConverter<UInt32>>.javaSetup(env: env)
        //print("setting up ArrayConverter<OptionalConverter<UInt8>>...")
        try ArrayConverter<OptionalConverter<UInt8>>.javaSetup(env: env)
        //print("setting up ArrayConverter<Bool>...")
        try ArrayConverter<Bool>.javaSetup(env: env)
        //print("setting up ArrayConverter<Double>...")
        try ArrayConverter<Double>.javaSetup(env: env)
        //print("setting up ArrayConverter<Float>...")
        try ArrayConverter<Float>.javaSetup(env: env)
        //print("setting up ArrayConverter<Int16>...")
        try ArrayConverter<Int16>.javaSetup(env: env)
        //print("setting up ArrayConverter<Int32>...")
        try ArrayConverter<Int32>.javaSetup(env: env)
        //print("setting up ArrayConverter<Int8>...")
        try ArrayConverter<Int8>.javaSetup(env: env)
        //print("setting up ArrayConverter<UInt16>...")
        try ArrayConverter<UInt16>.javaSetup(env: env)
        //print("setting up ArrayConverter<UInt32>...")
        try ArrayConverter<UInt32>.javaSetup(env: env)
        //print("setting up ArrayConverter<UInt8>...")
        try ArrayConverter<UInt8>.javaSetup(env: env)
        //print("setting up OptionalConverter<Bool>...")
        try OptionalConverter<Bool>.javaSetup(env: env)
        //print("setting up OptionalConverter<Double>...")
        try OptionalConverter<Double>.javaSetup(env: env)
        //print("setting up OptionalConverter<Float>...")
        try OptionalConverter<Float>.javaSetup(env: env)
        //print("setting up OptionalConverter<Int16>...")
        try OptionalConverter<Int16>.javaSetup(env: env)
        //print("setting up OptionalConverter<Int32>...")
        try OptionalConverter<Int32>.javaSetup(env: env)
        //print("setting up OptionalConverter<Int8>...")
        try OptionalConverter<Int8>.javaSetup(env: env)
        //print("setting up OptionalConverter<UInt16>...")
        try OptionalConverter<UInt16>.javaSetup(env: env)
        //print("setting up OptionalConverter<UInt32>...")
        try OptionalConverter<UInt32>.javaSetup(env: env)
        //print("setting up OptionalConverter<UInt8>...")
        try OptionalConverter<UInt8>.javaSetup(env: env)
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
        //print("setting up Primitives.PrimitiveHolder...")
        try Primitives.PrimitiveHolder.javaSetup(env: env)
        try env.RegisterNatives(Primitives.PrimitiveHolder.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_staticPropery"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_PrimitiveHolder_staticPropery, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticMutablePropery"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_PrimitiveHolder_staticMutablePropery, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_staticMutablePropery"),
                signature: bag.add("(Ljava/util/List;)V"),
                fnPtr: unsafeBitCast(java_set_Primitives_PrimitiveHolder_staticMutablePropery, to: UnsafeMutableRawPointer.self)
            )
        )
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
                name: bag.add("__jni_maybeEchoBool"),
                signature: bag.add("(Ljava/lang/Boolean;)Ljava/lang/Boolean;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt8"),
                signature: bag.add("(Lkotlin/UByte;)Lkotlin/UByte;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt16"),
                signature: bag.add("(Lkotlin/UShort;)Lkotlin/UShort;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt32"),
                signature: bag.add("(Lkotlin/UInt;)Lkotlin/UInt;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt8"),
                signature: bag.add("(Ljava/lang/Byte;)Ljava/lang/Byte;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt16"),
                signature: bag.add("(Ljava/lang/Short;)Ljava/lang/Short;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt32"),
                signature: bag.add("(Ljava/lang/Integer;)Ljava/lang/Integer;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoFloat"),
                signature: bag.add("(Ljava/lang/Float;)Ljava/lang/Float;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoDouble"),
                signature: bag.add("(Ljava/lang/Double;)Ljava/lang/Double;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoDouble, to: UnsafeMutableRawPointer.self)
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
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyBool"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyFloat"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyDouble"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeBool"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeFloat"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeDouble"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_defaultPrimitiveHolder"),
                signature: bag.add("()Lcom/cricut/testapi/Primitives$PrimitiveHolder;"),
                fnPtr: unsafeBitCast(java_get_Primitives_defaultPrimitiveHolder, to: UnsafeMutableRawPointer.self)
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
