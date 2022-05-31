// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesJavaRuntime
import Foundation
import TestAPI

@_cdecl("JNI_OnLoad")
public func jniOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    return FishyJoesJavaRuntime.callbackBody(env!) { env in
        let bag = CStringBag()
        // print("setting up Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>...")
        try Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>.javaSetup(env: env)
        // print("setting up Function3Converter<Float, Double, Int, Double>...")
        try Function3Converter<Float, Double, Int, Double>.javaSetup(env: env)
        // print("setting up Function1Converter<Int, Int>...")
        try Function1Converter<Int, Int>.javaSetup(env: env)
        // print("setting up Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>...")
        try Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>.javaSetup(env: env)
        // print("setting up Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>...")
        try Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>.javaSetup(env: env)
        // print("setting up Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>...")
        try Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.javaSetup(env: env)
        // print("setting up Function0Converter<Int>...")
        try Function0Converter<Int>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Bool>>...")
        try ArrayConverter<OptionalConverter<Bool>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Double>>...")
        try ArrayConverter<OptionalConverter<Double>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Float>>...")
        try ArrayConverter<OptionalConverter<Float>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Int>>...")
        try ArrayConverter<OptionalConverter<Int>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Int16>>...")
        try ArrayConverter<OptionalConverter<Int16>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Int32>>...")
        try ArrayConverter<OptionalConverter<Int32>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Int64>>...")
        try ArrayConverter<OptionalConverter<Int64>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Int8>>...")
        try ArrayConverter<OptionalConverter<Int8>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<UInt16>>...")
        try ArrayConverter<OptionalConverter<UInt16>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<UInt32>>...")
        try ArrayConverter<OptionalConverter<UInt32>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<UInt64>>...")
        try ArrayConverter<OptionalConverter<UInt64>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<UInt8>>...")
        try ArrayConverter<OptionalConverter<UInt8>>.javaSetup(env: env)
        // print("setting up ArrayConverter<Bool>...")
        try ArrayConverter<Bool>.javaSetup(env: env)
        // print("setting up ArrayConverter<Double>...")
        try ArrayConverter<Double>.javaSetup(env: env)
        // print("setting up ArrayConverter<Float>...")
        try ArrayConverter<Float>.javaSetup(env: env)
        // print("setting up ArrayConverter<Int>...")
        try ArrayConverter<Int>.javaSetup(env: env)
        // print("setting up ArrayConverter<Int16>...")
        try ArrayConverter<Int16>.javaSetup(env: env)
        // print("setting up ArrayConverter<Int32>...")
        try ArrayConverter<Int32>.javaSetup(env: env)
        // print("setting up ArrayConverter<Int64>...")
        try ArrayConverter<Int64>.javaSetup(env: env)
        // print("setting up ArrayConverter<Int8>...")
        try ArrayConverter<Int8>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.String>...")
        try ArrayConverter<Swift.String>.javaSetup(env: env)
        // print("setting up ArrayConverter<UInt16>...")
        try ArrayConverter<UInt16>.javaSetup(env: env)
        // print("setting up ArrayConverter<UInt32>...")
        try ArrayConverter<UInt32>.javaSetup(env: env)
        // print("setting up ArrayConverter<UInt64>...")
        try ArrayConverter<UInt64>.javaSetup(env: env)
        // print("setting up ArrayConverter<UInt8>...")
        try ArrayConverter<UInt8>.javaSetup(env: env)
        // print("setting up DictionaryConverter<OptionalConverter<Int>, OptionalConverter<Int>>...")
        try DictionaryConverter<OptionalConverter<Int>, OptionalConverter<Int>>.javaSetup(env: env)
        // print("setting up DictionaryConverter<Bool, Bool>...")
        try DictionaryConverter<Bool, Bool>.javaSetup(env: env)
        // print("setting up DictionaryConverter<Int, Int>...")
        try DictionaryConverter<Int, Int>.javaSetup(env: env)
        // print("setting up DictionaryConverter<Swift.String, Swift.String>...")
        try DictionaryConverter<Swift.String, Swift.String>.javaSetup(env: env)
        // print("setting up OptionalConverter<ArrayConverter<OptionalConverter<Int>>>...")
        try OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.javaSetup(env: env)
        // print("setting up OptionalConverter<ArrayConverter<Int>>...")
        try OptionalConverter<ArrayConverter<Int>>.javaSetup(env: env)
        // print("setting up OptionalConverter<DictionaryConverter<OptionalConverter<Int>, OptionalConverter<Int>>>...")
        try OptionalConverter<DictionaryConverter<OptionalConverter<Int>, OptionalConverter<Int>>>.javaSetup(env: env)
        // print("setting up OptionalConverter<DictionaryConverter<Int, Int>>...")
        try OptionalConverter<DictionaryConverter<Int, Int>>.javaSetup(env: env)
        // print("setting up OptionalConverter<SetConverter<OptionalConverter<Int>>>...")
        try OptionalConverter<SetConverter<OptionalConverter<Int>>>.javaSetup(env: env)
        // print("setting up OptionalConverter<SetConverter<Int>>...")
        try OptionalConverter<SetConverter<Int>>.javaSetup(env: env)
        // print("setting up OptionalConverter<Bool>...")
        try OptionalConverter<Bool>.javaSetup(env: env)
        // print("setting up OptionalConverter<Double>...")
        try OptionalConverter<Double>.javaSetup(env: env)
        // print("setting up OptionalConverter<Float>...")
        try OptionalConverter<Float>.javaSetup(env: env)
        // print("setting up OptionalConverter<Int>...")
        try OptionalConverter<Int>.javaSetup(env: env)
        // print("setting up OptionalConverter<Int16>...")
        try OptionalConverter<Int16>.javaSetup(env: env)
        // print("setting up OptionalConverter<Int32>...")
        try OptionalConverter<Int32>.javaSetup(env: env)
        // print("setting up OptionalConverter<Int64>...")
        try OptionalConverter<Int64>.javaSetup(env: env)
        // print("setting up OptionalConverter<Int8>...")
        try OptionalConverter<Int8>.javaSetup(env: env)
        // print("setting up OptionalConverter<UInt16>...")
        try OptionalConverter<UInt16>.javaSetup(env: env)
        // print("setting up OptionalConverter<UInt32>...")
        try OptionalConverter<UInt32>.javaSetup(env: env)
        // print("setting up OptionalConverter<UInt64>...")
        try OptionalConverter<UInt64>.javaSetup(env: env)
        // print("setting up OptionalConverter<UInt8>...")
        try OptionalConverter<UInt8>.javaSetup(env: env)
        // print("setting up SetConverter<OptionalConverter<Int>>...")
        try SetConverter<OptionalConverter<Int>>.javaSetup(env: env)
        // print("setting up SetConverter<Bool>...")
        try SetConverter<Bool>.javaSetup(env: env)
        // print("setting up SetConverter<Int>...")
        try SetConverter<Int>.javaSetup(env: env)
        // print("setting up SetConverter<Swift.String>...")
        try SetConverter<Swift.String>.javaSetup(env: env)
        // print("setting up Bool...")
        try Bool.javaSetup(env: env)
        // print("setting up Bytes...")
        try Bytes.javaSetup(env: env)
        try env.RegisterNatives(Bytes.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoBytes"),
                signature: bag.add("(Ljava/util/List;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_Bytes_echoBytes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoData"),
                signature: bag.add("([B)[B"),
                fnPtr: unsafeBitCast(java_Bytes_echoData, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_bytes"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Bytes_bytes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_data"),
                signature: bag.add("()[B"),
                fnPtr: unsafeBitCast(java_get_Bytes_data, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Collections.CollectionHolder...")
        try Collections.CollectionHolder.javaSetup(env: env)
        try env.RegisterNatives(Collections.CollectionHolder.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_staticPropery"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Collections_CollectionHolder_staticPropery, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticMutablePropery"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Collections_CollectionHolder_staticMutablePropery, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_staticMutablePropery"),
                signature: bag.add("(Ljava/util/List;)V"),
                fnPtr: unsafeBitCast(java_set_Collections_CollectionHolder_staticMutablePropery, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Collections...")
        try Collections.javaSetup(env: env)
        try env.RegisterNatives(Collections.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoArrayOfInt"),
                signature: bag.add("(Ljava/util/List;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_Collections_echoArrayOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoSetOfInt"),
                signature: bag.add("(Ljava/util/Set;)Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_Collections_echoSetOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoDictionaryOfIntToInt"),
                signature: bag.add("(Ljava/util/Map;)Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_Collections_echoDictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoMaybeArrayOfMaybeInt"),
                signature: bag.add("(Ljava/util/List;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_Collections_echoMaybeArrayOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoMaybeSetOfMaybeInt"),
                signature: bag.add("(Ljava/util/Set;)Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_Collections_echoMaybeSetOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoMaybeDictionaryOfMaybeIntToMaybeInt"),
                signature: bag.add("(Ljava/util/Map;)Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_Collections_echoMaybeDictionaryOfMaybeIntToMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_arrayOfInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Collections_arrayOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_setOfInt"),
                signature: bag.add("()Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_get_Collections_setOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_dictionaryOfIntToInt"),
                signature: bag.add("()Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_get_Collections_dictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeArrayOfInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Collections_maybeArrayOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeSetOfInt"),
                signature: bag.add("()Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_get_Collections_maybeSetOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeDictionaryOfIntToInt"),
                signature: bag.add("()Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_get_Collections_maybeDictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeArrayOfMaybeInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Collections_maybeArrayOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeSetOfMaybeInt"),
                signature: bag.add("()Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_get_Collections_maybeSetOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeDictionaryOfMaybeIntToMaybeInt"),
                signature: bag.add("()Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_get_Collections_maybeDictionaryOfMaybeIntToMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_defaultCollectionHolder"),
                signature: bag.add("()Lcom/cricut/testapi/Collections$CollectionHolder;"),
                fnPtr: unsafeBitCast(java_get_Collections_defaultCollectionHolder, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Foundation.Data...")
        try Foundation.Data.javaSetup(env: env)
        // print("setting up Double...")
        try Double.javaSetup(env: env)
        // print("setting up Float...")
        try Float.javaSetup(env: env)
        // print("setting up Functions...")
        try Functions.javaSetup(env: env)
        try env.RegisterNatives(Functions.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_exercise0"),
                signature: bag.add("(Lkotlin/jvm/functions/Function0;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_exercise0, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise1"),
                signature: bag.add("(Lkotlin/jvm/functions/Function1;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_exercise1, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise2"),
                signature: bag.add("(Lkotlin/jvm/functions/Function2;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_exercise2, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise3"),
                signature: bag.add("(Lkotlin/jvm/functions/Function3;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_exercise3, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise4"),
                signature: bag.add("(Lkotlin/jvm/functions/Function4;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_exercise4, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise5"),
                signature: bag.add("(Lkotlin/jvm/functions/Function5;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_exercise5, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise6"),
                signature: bag.add("(Lkotlin/jvm/functions/Function6;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_exercise6, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_willThrow"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Functions_willThrow, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_const42"),
                signature: bag.add("()Lkotlin/jvm/functions/Function0;"),
                fnPtr: unsafeBitCast(java_get_Functions_const42, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_abs"),
                signature: bag.add("()Lkotlin/jvm/functions/Function1;"),
                fnPtr: unsafeBitCast(java_get_Functions_abs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_intCompose"),
                signature: bag.add("()Lkotlin/jvm/functions/Function2;"),
                fnPtr: unsafeBitCast(java_get_Functions_intCompose, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_add3Things"),
                signature: bag.add("()Lkotlin/jvm/functions/Function3;"),
                fnPtr: unsafeBitCast(java_get_Functions_add3Things, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_makeList"),
                signature: bag.add("()Lkotlin/jvm/functions/Function4;"),
                fnPtr: unsafeBitCast(java_get_Functions_makeList, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_fifthThing"),
                signature: bag.add("()Lkotlin/jvm/functions/Function5;"),
                fnPtr: unsafeBitCast(java_get_Functions_fifthThing, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_sixthThing"),
                signature: bag.add("()Lkotlin/jvm/functions/Function6;"),
                fnPtr: unsafeBitCast(java_get_Functions_sixthThing, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Int...")
        try Int.javaSetup(env: env)
        // print("setting up Int16...")
        try Int16.javaSetup(env: env)
        // print("setting up Int32...")
        try Int32.javaSetup(env: env)
        // print("setting up Int64...")
        try Int64.javaSetup(env: env)
        // print("setting up Int8...")
        try Int8.javaSetup(env: env)
        // print("setting up Structs.MemberwiseStruct...")
        try Structs.MemberwiseStruct.javaSetup(env: env)
        try env.RegisterNatives(Structs.MemberwiseStruct.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/Structs$MemberwiseStruct;"),
                fnPtr: unsafeBitCast(java_Structs_MemberwiseStruct_create, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Primitives.PrimitiveHolder...")
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
        // print("setting up Primitives...")
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
                name: bag.add("__jni_echoUInt64"),
                signature: bag.add("(J)J"),
                fnPtr: unsafeBitCast(java_Primitives_echoUInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_echoInt64"),
                signature: bag.add("(J)J"),
                fnPtr: unsafeBitCast(java_Primitives_echoInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_maybeEchoUInt64"),
                signature: bag.add("(Lkotlin/ULong;)Lkotlin/ULong;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoUInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_maybeEchoInt64"),
                signature: bag.add("(Ljava/lang/Long;)Ljava/lang/Long;"),
                fnPtr: unsafeBitCast(java_Primitives_maybeEchoInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_get_zeroUInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_minUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxUInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_get_zeroInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_zeroInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_minInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_Primitives_maxInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_get_manyUInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyUInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_get_manyInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_get_manyMaybeUInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeUInt64, to: UnsafeMutableRawPointer.self)
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
                name: bag.add("__jni_get_manyMaybeInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_Primitives_manyMaybeInt64, to: UnsafeMutableRawPointer.self)
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
        // print("setting up Structs.ReferenceStruct...")
        try Structs.ReferenceStruct.javaSetup(env: env)
        try env.RegisterNatives(Structs.ReferenceStruct.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/Structs$ReferenceStruct;"),
                fnPtr: unsafeBitCast(java_Structs_ReferenceStruct_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_immutable"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Structs_ReferenceStruct_immutable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_mutable"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Structs_ReferenceStruct_mutable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/testapi/Structs$ReferenceStruct;Lcom/cricut/testapi/Structs$ReferenceStruct;)Z"),
                fnPtr: unsafeBitCast(Structs.ReferenceStruct._javaEquals, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Swift.String...")
        try Swift.String.javaSetup(env: env)
        // print("setting up Strings...")
        try Strings.javaSetup(env: env)
        try env.RegisterNatives(Strings.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echo"),
                signature: bag.add("(Ljava/lang/String;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_Strings_echo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_simple"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_simple, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_accent"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_accent, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_script"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_script, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chinese"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_chinese, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chineseBMP"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_chineseBMP, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chineseSIP"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_chineseSIP, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_emoji"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_emoji, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_emojiMulti"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_Strings_emojiMulti, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Structs...")
        try Structs.javaSetup(env: env)
        // print("setting up Functions.TheError...")
        try Functions.TheError.javaSetup(env: env)
        // print("setting up Tuples...")
        try Tuples.javaSetup(env: env)
        try env.RegisterNatives(Tuples.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_checkTuples"),
                signature: bag.add("(Lkotlin/Pair;Lkotlin/Triple;Lcom/cricut/fishyjoes/runtime/Tuple4;Lcom/cricut/fishyjoes/runtime/Tuple5;Lcom/cricut/fishyjoes/runtime/Tuple6;)Z"),
                fnPtr: unsafeBitCast(java_Tuples_checkTuples, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple2"),
                signature: bag.add("()Lkotlin/Pair;"),
                fnPtr: unsafeBitCast(java_get_Tuples_tuple2, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple3"),
                signature: bag.add("()Lkotlin/Triple;"),
                fnPtr: unsafeBitCast(java_get_Tuples_tuple3, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple4"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/Tuple4;"),
                fnPtr: unsafeBitCast(java_get_Tuples_tuple4, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple5"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/Tuple5;"),
                fnPtr: unsafeBitCast(java_get_Tuples_tuple5, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple6"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/Tuple6;"),
                fnPtr: unsafeBitCast(java_get_Tuples_tuple6, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up UInt16...")
        try UInt16.javaSetup(env: env)
        // print("setting up UInt32...")
        try UInt32.javaSetup(env: env)
        // print("setting up UInt64...")
        try UInt64.javaSetup(env: env)
        // print("setting up UInt8...")
        try UInt8.javaSetup(env: env)
        // print("setting up Tuple2Converter<Int, Swift.String>...")
        try Tuple2Converter<Int, Swift.String>.javaSetup(env: env)
        // print("setting up Tuple3Converter<Swift.String, Double, Swift.String>...")
        try Tuple3Converter<Swift.String, Double, Swift.String>.javaSetup(env: env)
        // print("setting up Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>...")
        try Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>.javaSetup(env: env)
        // print("setting up Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>...")
        try Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>.javaSetup(env: env)
        // print("setting up Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>...")
        try Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>.javaSetup(env: env)
        return JNI_VERSION_1_4
    }
}
