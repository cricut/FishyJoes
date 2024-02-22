// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("JNI_OnLoad")
public func jniOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    return FishyJoesJavaRuntime.callbackBody(env!) { env in
        let bag = CStringBag()
        // print("setting up Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>...")
        try Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
        // print("setting up Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>...")
        try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
        // print("setting up Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>...")
        try Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
        // print("setting up Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>...")
        try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
        // print("setting up Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>...")
        try Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>.javaSetup(env: env)
        // print("setting up Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>...")
        try Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>.javaSetup(env: env)
        // print("setting up Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>...")
        try Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>.javaSetup(env: env)
        // print("setting up Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>...")
        try Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>.javaSetup(env: env)
        // print("setting up Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>...")
        try Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>.javaSetup(env: env)
        // print("setting up Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>...")
        try Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.javaSetup(env: env)
        // print("setting up Function1Converter<Swift.Int, FutureConverter<Swift.Int>>...")
        try Function1Converter<Swift.Int, FutureConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up Function1Converter<Swift.Int, Swift.Int>...")
        try Function1Converter<Swift.Int, Swift.Int>.javaSetup(env: env)
        // print("setting up Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>...")
        try Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>.javaSetup(env: env)
        // print("setting up Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>...")
        try Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>.javaSetup(env: env)
        // print("setting up Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>...")
        try Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>...")
        try Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>.javaSetup(env: env)
        // print("setting up Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>...")
        try Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>.javaSetup(env: env)
        // print("setting up Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>...")
        try Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.javaSetup(env: env)
        // print("setting up Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>...")
        try Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.javaSetup(env: env)
        // print("setting up AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>...")
        try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.javaSetup(env: env)
        // print("setting up Function1Converter<Swift.Int, Swift.Int>...")
        try Function1Converter<Swift.Int, Swift.Int>.javaSetup(env: env)
        // print("setting up AsyncFunction1Converter<Swift.Int, Swift.Int>...")
        try AsyncFunction1Converter<Swift.Int, Swift.Int>.javaSetup(env: env)
        // print("setting up Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>...")
        try Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>.javaSetup(env: env)
        // print("setting up Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>...")
        try Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>.javaSetup(env: env)
        // print("setting up AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>...")
        try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.javaSetup(env: env)
        // print("setting up AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>...")
        try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.javaSetup(env: env)
        // print("setting up Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>...")
        try Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.javaSetup(env: env)
        // print("setting up AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>...")
        try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.javaSetup(env: env)
        // print("setting up Function0Converter<FutureConverter<Swift.Int>>...")
        try Function0Converter<FutureConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>...")
        try Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>.javaSetup(env: env)
        // print("setting up Function0Converter<Swift.Int>...")
        try Function0Converter<Swift.Int>.javaSetup(env: env)
        // print("setting up Function0Converter<Swift.Int>...")
        try Function0Converter<Swift.Int>.javaSetup(env: env)
        // print("setting up AsyncFunction0Converter<Swift.Int>...")
        try AsyncFunction0Converter<Swift.Int>.javaSetup(env: env)
        // print("setting up Function0Converter<FishyJoesCommonRuntime.VoidConverter>...")
        try Function0Converter<FishyJoesCommonRuntime.VoidConverter>.javaSetup(env: env)
        // print("setting up AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>...")
        try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.javaSetup(env: env)
        // print("setting up FutureConverter<Function1Converter<Swift.Int, Swift.Int>>...")
        try FutureConverter<Function1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
        // print("setting up FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>...")
        try FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
        // print("setting up FutureConverter<Function0Converter<Swift.Int>>...")
        try FutureConverter<Function0Converter<Swift.Int>>.javaSetup(env: env)
        // print("setting up FutureConverter<AsyncFunction0Converter<Swift.Int>>...")
        try FutureConverter<AsyncFunction0Converter<Swift.Int>>.javaSetup(env: env)
        // print("setting up FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>...")
        try FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>.javaSetup(env: env)
        // print("setting up FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>...")
        try FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>.javaSetup(env: env)
        // print("setting up FutureConverter<FutureConverter<Swift.Double>>...")
        try FutureConverter<FutureConverter<Swift.Double>>.javaSetup(env: env)
        // print("setting up FutureConverter<FutureConverter<Swift.Int>>...")
        try FutureConverter<FutureConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>...")
        try FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>.javaSetup(env: env)
        // print("setting up FutureConverter<ArrayConverter<Swift.String>>...")
        try FutureConverter<ArrayConverter<Swift.String>>.javaSetup(env: env)
        // print("setting up FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>...")
        try FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>.javaSetup(env: env)
        // print("setting up FutureConverter<OptionalConverter<Swift.UInt8>>...")
        try FutureConverter<OptionalConverter<Swift.UInt8>>.javaSetup(env: env)
        // print("setting up FutureConverter<Swift.Double>...")
        try FutureConverter<Swift.Double>.javaSetup(env: env)
        // print("setting up FutureConverter<Swift.Int>...")
        try FutureConverter<Swift.Int>.javaSetup(env: env)
        // print("setting up FutureConverter<Swift.String>...")
        try FutureConverter<Swift.String>.javaSetup(env: env)
        // print("setting up FutureConverter<FishyJoesCommonRuntime.VoidConverter>...")
        try FutureConverter<FishyJoesCommonRuntime.VoidConverter>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Bool>>...")
        try ArrayConverter<OptionalConverter<Swift.Bool>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Double>>...")
        try ArrayConverter<OptionalConverter<Swift.Double>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Float>>...")
        try ArrayConverter<OptionalConverter<Swift.Float>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Int>>...")
        try ArrayConverter<OptionalConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Int16>>...")
        try ArrayConverter<OptionalConverter<Swift.Int16>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Int32>>...")
        try ArrayConverter<OptionalConverter<Swift.Int32>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Int64>>...")
        try ArrayConverter<OptionalConverter<Swift.Int64>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.Int8>>...")
        try ArrayConverter<OptionalConverter<Swift.Int8>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.UInt>>...")
        try ArrayConverter<OptionalConverter<Swift.UInt>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.UInt16>>...")
        try ArrayConverter<OptionalConverter<Swift.UInt16>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.UInt32>>...")
        try ArrayConverter<OptionalConverter<Swift.UInt32>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.UInt64>>...")
        try ArrayConverter<OptionalConverter<Swift.UInt64>>.javaSetup(env: env)
        // print("setting up ArrayConverter<OptionalConverter<Swift.UInt8>>...")
        try ArrayConverter<OptionalConverter<Swift.UInt8>>.javaSetup(env: env)
        // print("setting up ArrayConverter<Foundation.AttributedString.Runs.Run>...")
        try ArrayConverter<Foundation.AttributedString.Runs.Run>.javaSetup(env: env)
        // print("setting up ArrayConverter<Foundation.AttributedSubstring>...")
        try ArrayConverter<Foundation.AttributedSubstring>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Bool>...")
        try ArrayConverter<Swift.Bool>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Double>...")
        try ArrayConverter<Swift.Double>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Float>...")
        try ArrayConverter<Swift.Float>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Int>...")
        try ArrayConverter<Swift.Int>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Int16>...")
        try ArrayConverter<Swift.Int16>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Int32>...")
        try ArrayConverter<Swift.Int32>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Int64>...")
        try ArrayConverter<Swift.Int64>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.Int8>...")
        try ArrayConverter<Swift.Int8>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.String>...")
        try ArrayConverter<Swift.String>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.UInt>...")
        try ArrayConverter<Swift.UInt>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.UInt16>...")
        try ArrayConverter<Swift.UInt16>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.UInt32>...")
        try ArrayConverter<Swift.UInt32>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.UInt64>...")
        try ArrayConverter<Swift.UInt64>.javaSetup(env: env)
        // print("setting up ArrayConverter<Swift.UInt8>...")
        try ArrayConverter<Swift.UInt8>.javaSetup(env: env)
        // print("setting up ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>...")
        try ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>.javaSetup(env: env)
        // print("setting up DictionaryConverter<Swift.Bool, Swift.Bool>...")
        try DictionaryConverter<Swift.Bool, Swift.Bool>.javaSetup(env: env)
        // print("setting up DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>...")
        try DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up DictionaryConverter<Swift.Int, Swift.Int>...")
        try DictionaryConverter<Swift.Int, Swift.Int>.javaSetup(env: env)
        // print("setting up DictionaryConverter<Swift.String, Swift.String>...")
        try DictionaryConverter<Swift.String, Swift.String>.javaSetup(env: env)
        // print("setting up OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>...")
        try OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>.javaSetup(env: env)
        // print("setting up OptionalConverter<ArrayConverter<Swift.Int>>...")
        try OptionalConverter<ArrayConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>...")
        try OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>.javaSetup(env: env)
        // print("setting up OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>...")
        try OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>.javaSetup(env: env)
        // print("setting up OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>...")
        try OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>.javaSetup(env: env)
        // print("setting up OptionalConverter<SetConverter<Swift.Int>>...")
        try OptionalConverter<SetConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Bool>...")
        try OptionalConverter<Swift.Bool>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Double>...")
        try OptionalConverter<Swift.Double>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Float>...")
        try OptionalConverter<Swift.Float>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Int>...")
        try OptionalConverter<Swift.Int>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Int16>...")
        try OptionalConverter<Swift.Int16>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Int32>...")
        try OptionalConverter<Swift.Int32>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Int64>...")
        try OptionalConverter<Swift.Int64>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.Int8>...")
        try OptionalConverter<Swift.Int8>.javaSetup(env: env)
        // print("setting up OptionalConverter<TestAPI.SimpleEnum>...")
        try OptionalConverter<TestAPI.SimpleEnum>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.String>...")
        try OptionalConverter<Swift.String>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.UInt>...")
        try OptionalConverter<Swift.UInt>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.UInt16>...")
        try OptionalConverter<Swift.UInt16>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.UInt32>...")
        try OptionalConverter<Swift.UInt32>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.UInt64>...")
        try OptionalConverter<Swift.UInt64>.javaSetup(env: env)
        // print("setting up OptionalConverter<Swift.UInt8>...")
        try OptionalConverter<Swift.UInt8>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.Double>...")
        try ClosedRangeConverter<Swift.Double>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.Float>...")
        try ClosedRangeConverter<Swift.Float>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.Int>...")
        try ClosedRangeConverter<Swift.Int>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.Int16>...")
        try ClosedRangeConverter<Swift.Int16>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.Int32>...")
        try ClosedRangeConverter<Swift.Int32>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.Int64>...")
        try ClosedRangeConverter<Swift.Int64>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.Int8>...")
        try ClosedRangeConverter<Swift.Int8>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.String>...")
        try ClosedRangeConverter<Swift.String>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.UInt>...")
        try ClosedRangeConverter<Swift.UInt>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.UInt16>...")
        try ClosedRangeConverter<Swift.UInt16>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.UInt32>...")
        try ClosedRangeConverter<Swift.UInt32>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.UInt64>...")
        try ClosedRangeConverter<Swift.UInt64>.javaSetup(env: env)
        // print("setting up ClosedRangeConverter<Swift.UInt8>...")
        try ClosedRangeConverter<Swift.UInt8>.javaSetup(env: env)
        // print("setting up RangeConverter<Foundation.AttributedString.Index>...")
        try RangeConverter<Foundation.AttributedString.Index>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.Int>...")
        try RangeConverter<Swift.Int>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.Int16>...")
        try RangeConverter<Swift.Int16>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.Int32>...")
        try RangeConverter<Swift.Int32>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.Int64>...")
        try RangeConverter<Swift.Int64>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.Int8>...")
        try RangeConverter<Swift.Int8>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.UInt>...")
        try RangeConverter<Swift.UInt>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.UInt16>...")
        try RangeConverter<Swift.UInt16>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.UInt32>...")
        try RangeConverter<Swift.UInt32>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.UInt64>...")
        try RangeConverter<Swift.UInt64>.javaSetup(env: env)
        // print("setting up RangeConverter<Swift.UInt8>...")
        try RangeConverter<Swift.UInt8>.javaSetup(env: env)
        // print("setting up SetConverter<OptionalConverter<Swift.Int>>...")
        try SetConverter<OptionalConverter<Swift.Int>>.javaSetup(env: env)
        // print("setting up SetConverter<Swift.Bool>...")
        try SetConverter<Swift.Bool>.javaSetup(env: env)
        // print("setting up SetConverter<Swift.Int>...")
        try SetConverter<Swift.Int>.javaSetup(env: env)
        // print("setting up SetConverter<Swift.String>...")
        try SetConverter<Swift.String>.javaSetup(env: env)
        // print("setting up Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces...")
        try Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces.javaSetup(env: env)
        try env.RegisterNatives(
            Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces.externalWitnessClass ?? Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_testCall"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Swift.String.PuttingTypesIntoQuestionablePlaces...")
        try Swift.String.PuttingTypesIntoQuestionablePlaces.javaSetup(env: env)
        try env.RegisterNatives(
            Swift.String.PuttingTypesIntoQuestionablePlaces.externalWitnessClass ?? Swift.String.PuttingTypesIntoQuestionablePlaces.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_testCall"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces...")
        try Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.javaSetup(env: env)
        try env.RegisterNatives(
            Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.externalWitnessClass ?? Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_testCall"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Collections.CollectionHolder...")
        try TestAPI.Collections.CollectionHolder.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Collections.CollectionHolder.externalWitnessClass ?? TestAPI.Collections.CollectionHolder.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_staticProperty"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_CollectionHolder_staticProperty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticMutableProperty"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_CollectionHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_staticMutableProperty"),
                signature: bag.add("(Ljava/util/List;)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_Collections_CollectionHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Primitives.PrimitiveHolder...")
        try TestAPI.Primitives.PrimitiveHolder.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Primitives.PrimitiveHolder.externalWitnessClass ?? TestAPI.Primitives.PrimitiveHolder.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_staticProperty"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_PrimitiveHolder_staticProperty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticMutableProperty"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_staticMutableProperty"),
                signature: bag.add("(Ljava/util/List;)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Structs.MemberwiseStruct...")
        try TestAPI.Structs.MemberwiseStruct.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Structs.MemberwiseStruct.externalWitnessClass ?? TestAPI.Structs.MemberwiseStruct.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/Structs$MemberwiseStruct;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_MemberwiseStruct_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncGetMutable"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_MemberwiseStruct_asyncGetMutable, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Structs.MutableStruct...")
        try TestAPI.Structs.MutableStruct.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Structs.MutableStruct.externalWitnessClass ?? TestAPI.Structs.MutableStruct.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/Structs$MutableStruct;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_MutableStruct_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_increment"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_MutableStruct_increment, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_incrementAsync"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_MutableStruct_incrementAsync, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncGetI"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_MutableStruct_asyncGetI, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Structs.PuttingTypesIntoQuestionablePlaces...")
        try TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.externalWitnessClass ?? TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/Structs_PuttingTypesIntoQuestionablePlaces;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_testCall"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Structs.ReferenceStruct...")
        try TestAPI.Structs.ReferenceStruct.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Structs.ReferenceStruct.externalWitnessClass ?? TestAPI.Structs.ReferenceStruct.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/Structs$ReferenceStruct;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_ReferenceStruct_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncGetMutable"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Structs_ReferenceStruct_asyncGetMutable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_immutable"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Structs_ReferenceStruct_immutable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_mutable"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Structs_ReferenceStruct_mutable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_mutable"),
                signature: bag.add("(Ljava/lang/String;)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_Structs_ReferenceStruct_mutable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/testapi/Structs$ReferenceStruct;Lcom/cricut/testapi/Structs$ReferenceStruct;)Z"),
                fnPtr: unsafeBitCast(TestAPI.Structs.ReferenceStruct._javaEquals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(TestAPI.Structs.ReferenceStruct._javaHash, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up _AProtocolConverter...")
        try _AProtocolConverter.javaSetup(env: env)
        try env.RegisterNatives(
            _AProtocolConverter.externalCompanionClass,
            JNINativeMethod(
                name: bag.add("__jni__default_hasADefaultImplementation"),
                signature: bag.add("(Lcom/cricut/testapi/AProtocol;JD)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java__AProtocolConverter__default_hasADefaultImplementation, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni__default_hasADefaultImplementation2"),
                signature: bag.add("(Lcom/cricut/testapi/AProtocol;Ljava/lang/String;ZD)D"),
                fnPtr: unsafeBitCast(java__AProtocolConverter__default_hasADefaultImplementation2, to: UnsafeMutableRawPointer.self)
            )
        )
        try env.RegisterNatives(
            _AProtocolConverter.externalWitnessClass ?? _AProtocolConverter.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_bar"),
                signature: bag.add("(JJ)Lcom/cricut/testapi/AProtocol;"),
                fnPtr: unsafeBitCast(java__AProtocolConverter_bar, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_foo"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get__AProtocolConverter_foo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_baz"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_get__AProtocolConverter_baz, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.AProtocolImplementation...")
        try TestAPI.AProtocolImplementation.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.AProtocolImplementation.externalWitnessClass ?? TestAPI.AProtocolImplementation.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_bar"),
                signature: bag.add("(JJ)Lcom/cricut/testapi/AProtocol;"),
                fnPtr: unsafeBitCast(java_TestAPI_AProtocolImplementation_bar, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.AssociatedDataEnum...")
        try TestAPI.AssociatedDataEnum.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.AssociatedDataEnum.externalWitnessClass ?? TestAPI.AssociatedDataEnum.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_plus"),
                signature: bag.add("(Lcom/cricut/testapi/AssociatedDataEnum;)Lcom/cricut/testapi/AssociatedDataEnum;"),
                fnPtr: unsafeBitCast(java_TestAPI_AssociatedDataEnum_plus, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticThing"),
                signature: bag.add("()Lcom/cricut/testapi/AssociatedDataEnum;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AssociatedDataEnum_staticThing, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_intValue"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AssociatedDataEnum_intValue, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.AsyncFunctions...")
        try TestAPI.AsyncFunctions.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.AsyncFunctions.externalWitnessClass ?? TestAPI.AsyncFunctions.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_exercise0"),
                signature: bag.add("(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_exercise0, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise1"),
                signature: bag.add("(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_exercise1, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise2"),
                signature: bag.add("(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_exercise2, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise3"),
                signature: bag.add("(Lkotlin/jvm/functions/Function4;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_exercise3, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise4"),
                signature: bag.add("(Lkotlin/jvm/functions/Function5;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_exercise4, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise5"),
                signature: bag.add("(Lkotlin/jvm/functions/Function6;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_exercise5, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise6"),
                signature: bag.add("(Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_exercise6, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_thunkTwiceMaker"),
                signature: bag.add("(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;"),
                fnPtr: unsafeBitCast(java_TestAPI_AsyncFunctions_thunkTwiceMaker, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_const42"),
                signature: bag.add("()Lkotlin/jvm/functions/Function1;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_const42, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_abs"),
                signature: bag.add("()Lkotlin/jvm/functions/Function2;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_abs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_intCompose"),
                signature: bag.add("()Lkotlin/jvm/functions/Function2;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_intCompose, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_add3Things"),
                signature: bag.add("()Lkotlin/jvm/functions/Function4;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_add3Things, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_makeList"),
                signature: bag.add("()Lkotlin/jvm/functions/Function5;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_makeList, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_fifthThing"),
                signature: bag.add("()Lkotlin/jvm/functions/Function6;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_fifthThing, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_sixthThing"),
                signature: bag.add("()Lkotlin/jvm/functions/Function7;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_sixthThing, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_willThrow"),
                signature: bag.add("()Lkotlin/jvm/functions/Function1;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AsyncFunctions_willThrow, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.AttributedStrings...")
        try TestAPI.AttributedStrings.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.AttributedStrings.externalWitnessClass ?? TestAPI.AttributedStrings.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echo"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_TestAPI_AttributedStrings_echo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_firstIndex"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_TestAPI_AttributedStrings_firstIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_lastIndex"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(java_TestAPI_AttributedStrings_lastIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_fullRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_AttributedStrings_fullRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_attributedCharacters"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_TestAPI_AttributedStrings_attributedCharacters, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_attributesPreferringDuplicatesNearerStart"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributeContainer;"),
                fnPtr: unsafeBitCast(java_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_emptyAttributeRuns"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_TestAPI_AttributedStrings_emptyAttributeRuns, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_simple"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_simple, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_accent"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_accent, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_script"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_script, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chinese"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_chinese, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chineseBMP"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_chineseBMP, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chineseSIP"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_chineseSIP, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_emoji"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_emoji, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_emojiMulti"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_emojiMulti, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_polyglot"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_AttributedStrings_polyglot, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Bytes...")
        try TestAPI.Bytes.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Bytes.externalWitnessClass ?? TestAPI.Bytes.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoBytes"),
                signature: bag.add("(Ljava/util/List;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_TestAPI_Bytes_echoBytes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoData"),
                signature: bag.add("([B)[B"),
                fnPtr: unsafeBitCast(java_TestAPI_Bytes_echoData, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_bytes"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Bytes_bytes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_data"),
                signature: bag.add("()[B"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Bytes_data, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.ClosedRanges...")
        try TestAPI.ClosedRanges.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.ClosedRanges.externalWitnessClass ?? TestAPI.ClosedRanges.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoUInt8Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt16Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt32Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt64Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUIntRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoUIntRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt8Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoInt8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt16Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoInt16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt32Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoInt32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt64Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoInt64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoIntRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoIntRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoFloatRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoFloatRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoDoubleRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoDoubleRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoStringRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_ClosedRanges_echoStringRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt8Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt16Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt32Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt64Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uIntRange"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_uIntRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int8Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_int8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int16Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_int16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int32Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_int32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int64Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_int64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_intRange"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_intRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_floatRange"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_floatRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_doubleRange"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_doubleRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_stringRange"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_ClosedRanges_stringRange, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Collections...")
        try TestAPI.Collections.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Collections.externalWitnessClass ?? TestAPI.Collections.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoArrayOfInt"),
                signature: bag.add("(Ljava/util/List;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_TestAPI_Collections_echoArrayOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoSetOfInt"),
                signature: bag.add("(Ljava/util/Set;)Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_TestAPI_Collections_echoSetOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoDictionaryOfIntToInt"),
                signature: bag.add("(Ljava/util/Map;)Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_TestAPI_Collections_echoDictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoMaybeArrayOfMaybeInt"),
                signature: bag.add("(Ljava/util/List;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_TestAPI_Collections_echoMaybeArrayOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoMaybeSetOfMaybeInt"),
                signature: bag.add("(Ljava/util/Set;)Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_TestAPI_Collections_echoMaybeSetOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoMaybeDictionaryOfIntToMaybeInt"),
                signature: bag.add("(Ljava/util/Map;)Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_collectionMapper"),
                signature: bag.add("(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_TestAPI_Collections_collectionMapper, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_arrayOfInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_arrayOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_setOfInt"),
                signature: bag.add("()Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_setOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_dictionaryOfIntToInt"),
                signature: bag.add("()Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_dictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_arrayOfBigTuples"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_arrayOfBigTuples, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeArrayOfInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_maybeArrayOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeSetOfInt"),
                signature: bag.add("()Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_maybeSetOfInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeDictionaryOfIntToInt"),
                signature: bag.add("()Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_maybeDictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeArrayOfMaybeInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_maybeArrayOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeSetOfMaybeInt"),
                signature: bag.add("()Ljava/util/Set;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_maybeSetOfMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maybeDictionaryOfIntToMaybeInt"),
                signature: bag.add("()Ljava/util/Map;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_defaultCollectionHolder"),
                signature: bag.add("()Lcom/cricut/testapi/Collections$CollectionHolder;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Collections_defaultCollectionHolder, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.DefaultArguments...")
        try TestAPI.DefaultArguments.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.DefaultArguments.externalWitnessClass ?? TestAPI.DefaultArguments.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoDefaults"),
                signature: bag.add("(Ljava/lang/Long;Ljava/lang/Long;D)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_DefaultArguments_echoDefaults, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Deprecations...")
        try TestAPI.Deprecations.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Deprecations.externalWitnessClass ?? TestAPI.Deprecations.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_deprecatedMethod"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Deprecations_deprecatedMethod, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_deprecatedVariable"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Deprecations_deprecatedVariable, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.EmptyEnum...")
        try TestAPI.EmptyEnum.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.EmptyEnum.externalWitnessClass ?? TestAPI.EmptyEnum.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_notGoingToHappen"),
                signature: bag.add("()Lcom/cricut/testapi/EmptyEnum;"),
                fnPtr: unsafeBitCast(java_TestAPI_EmptyEnum_notGoingToHappen, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Functions...")
        try TestAPI.Functions.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Functions.externalWitnessClass ?? TestAPI.Functions.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_exercise0"),
                signature: bag.add("(Lkotlin/jvm/functions/Function0;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_exercise0, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise1"),
                signature: bag.add("(Lkotlin/jvm/functions/Function1;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_exercise1, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise2"),
                signature: bag.add("(Lkotlin/jvm/functions/Function2;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_exercise2, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise3"),
                signature: bag.add("(Lkotlin/jvm/functions/Function3;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_exercise3, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise4"),
                signature: bag.add("(Lkotlin/jvm/functions/Function4;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_exercise4, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise5"),
                signature: bag.add("(Lkotlin/jvm/functions/Function5;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_exercise5, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_exercise6"),
                signature: bag.add("(Lkotlin/jvm/functions/Function6;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_exercise6, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_willThrow"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_willThrow, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_thunkTwiceMaker"),
                signature: bag.add("(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;"),
                fnPtr: unsafeBitCast(java_TestAPI_Functions_thunkTwiceMaker, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_const42"),
                signature: bag.add("()Lkotlin/jvm/functions/Function0;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Functions_const42, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_abs"),
                signature: bag.add("()Lkotlin/jvm/functions/Function1;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Functions_abs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_intCompose"),
                signature: bag.add("()Lkotlin/jvm/functions/Function2;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Functions_intCompose, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_add3Things"),
                signature: bag.add("()Lkotlin/jvm/functions/Function3;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Functions_add3Things, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_makeList"),
                signature: bag.add("()Lkotlin/jvm/functions/Function4;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Functions_makeList, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_fifthThing"),
                signature: bag.add("()Lkotlin/jvm/functions/Function5;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Functions_fifthThing, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_sixthThing"),
                signature: bag.add("()Lkotlin/jvm/functions/Function6;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Functions_sixthThing, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Methods...")
        try TestAPI.Methods.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Methods.externalWitnessClass ?? TestAPI.Methods.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("()Lcom/cricut/testapi/Methods;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_doublePlusGood"),
                signature: bag.add("(JD)J"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_doublePlusGood, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_async42"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_async42, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncYield"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_asyncYield, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncSleep"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_asyncSleep, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncVoid"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_asyncVoid, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncDouble"),
                signature: bag.add("(D)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_asyncDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncMultipleArgs"),
                signature: bag.add("(JLkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_asyncMultipleArgs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncThrowing"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_asyncThrowing, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asyncCallbackFunc0"),
                signature: bag.add("(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_asyncCallbackFunc0, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsync42"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsync42, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsyncYield"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsyncYield, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsyncSleep"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsyncSleep, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsyncVoid"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsyncVoid, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsyncDouble"),
                signature: bag.add("(D)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsyncDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsyncMultipleArgs"),
                signature: bag.add("(JLkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsyncMultipleArgs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsyncThrowing"),
                signature: bag.add("()Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsyncThrowing, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticAsyncCallbackFunc0"),
                signature: bag.add("(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;"),
                fnPtr: unsafeBitCast(java_TestAPI_Methods_staticAsyncCallbackFunc0, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticGet"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_staticGet, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_staticGetMethod"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_staticGetMethod, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticModifiable"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_staticModifiable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_staticModifiable"),
                signature: bag.add("(J)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_Methods_staticModifiable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_staticStored"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_staticStored, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_staticStored"),
                signature: bag.add("(J)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_Methods_staticStored, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_instanceGet"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_instanceGet, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_garply"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_garply, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_instanceGetMethod"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_instanceGetMethod, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_instanceModifiable"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_instanceModifiable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_instanceModifiable"),
                signature: bag.add("(J)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_Methods_instanceModifiable, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_instanceStored"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Methods_instanceStored, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_instanceStored"),
                signature: bag.add("(J)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_Methods_instanceStored, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Primitives...")
        try TestAPI.Primitives.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Primitives.externalWitnessClass ?? TestAPI.Primitives.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoBool"),
                signature: bag.add("(Z)Z"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt8"),
                signature: bag.add("(B)B"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt16"),
                signature: bag.add("(S)S"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt32"),
                signature: bag.add("(I)I"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt64"),
                signature: bag.add("(J)J"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt"),
                signature: bag.add("(J)J"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt8"),
                signature: bag.add("(B)B"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt16"),
                signature: bag.add("(S)S"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt32"),
                signature: bag.add("(I)I"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt64"),
                signature: bag.add("(J)J"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt"),
                signature: bag.add("(J)J"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoFloat"),
                signature: bag.add("(F)F"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoDouble"),
                signature: bag.add("(D)D"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_echoDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoBool"),
                signature: bag.add("(Ljava/lang/Boolean;)Ljava/lang/Boolean;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt8"),
                signature: bag.add("(Lkotlin/UByte;)Lkotlin/UByte;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt16"),
                signature: bag.add("(Lkotlin/UShort;)Lkotlin/UShort;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt32"),
                signature: bag.add("(Lkotlin/UInt;)Lkotlin/UInt;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt64"),
                signature: bag.add("(Lkotlin/ULong;)Lkotlin/ULong;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoUInt"),
                signature: bag.add("(Lkotlin/ULong;)Lkotlin/ULong;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt8"),
                signature: bag.add("(Ljava/lang/Byte;)Ljava/lang/Byte;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt16"),
                signature: bag.add("(Ljava/lang/Short;)Ljava/lang/Short;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt32"),
                signature: bag.add("(Ljava/lang/Integer;)Ljava/lang/Integer;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt64"),
                signature: bag.add("(Ljava/lang/Long;)Ljava/lang/Long;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoInt"),
                signature: bag.add("(Ljava/lang/Long;)Ljava/lang/Long;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoFloat"),
                signature: bag.add("(Ljava/lang/Float;)Ljava/lang/Float;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_maybeEchoDouble"),
                signature: bag.add("(Ljava/lang/Double;)Ljava/lang/Double;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_maybeEchoDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_valueMapper"),
                signature: bag.add("(Lkotlin/UByte;Lkotlin/jvm/functions/Function1;)Lkotlin/UByte;"),
                fnPtr: unsafeBitCast(java_TestAPI_Primitives_valueMapper, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_falseBool"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_falseBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_trueBool"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_trueBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroUInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minUInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxUInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt8"),
                signature: bag.add("()B"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt16"),
                signature: bag.add("()S"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt32"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt64"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroFloat"),
                signature: bag.add("()F"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minFloat"),
                signature: bag.add("()F"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxFloat"),
                signature: bag.add("()F"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_zeroDouble"),
                signature: bag.add("()D"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_zeroDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_minDouble"),
                signature: bag.add("()D"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_minDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_maxDouble"),
                signature: bag.add("()D"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_maxDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_bitCountUInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_bitCountUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_bitCountInt"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_bitCountInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyBool"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyUInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyFloat"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyDouble"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeBool"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeBool, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeUInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt8"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt8, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt16"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt16, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt32"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt32, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt64"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt64, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeInt"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeFloat"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeFloat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_manyMaybeDouble"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeDouble, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_defaultPrimitiveHolder"),
                signature: bag.add("()Lcom/cricut/testapi/Primitives$PrimitiveHolder;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Primitives_defaultPrimitiveHolder, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Ranges...")
        try TestAPI.Ranges.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Ranges.externalWitnessClass ?? TestAPI.Ranges.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echoUInt8Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoUInt8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt16Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoUInt16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt32Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoUInt32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUInt64Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoUInt64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoUIntRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoUIntRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt8Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoInt8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt16Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoInt16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt32Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoInt32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoInt64Range"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoInt64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_echoIntRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_TestAPI_Ranges_echoIntRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt8Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_uInt8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt16Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_uInt16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt32Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_uInt32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uInt64Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_uInt64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_uIntRange"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_uIntRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int8Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_int8Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int16Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_int16Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int32Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_int32Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_int64Range"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_int64Range, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_intRange"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/SwiftRange;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Ranges_intRange, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.SimpleEnum...")
        try TestAPI.SimpleEnum.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.SimpleEnum.externalWitnessClass ?? TestAPI.SimpleEnum.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_pickAColor"),
                signature: bag.add("(J)Lcom/cricut/testapi/SimpleEnum;"),
                fnPtr: unsafeBitCast(java_TestAPI_SimpleEnum_pickAColor, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hexMethod"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_SimpleEnum_hexMethod, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_resetFavoriteColor"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(java_TestAPI_SimpleEnum_resetFavoriteColor, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_hex"),
                signature: bag.add("()J"),
                fnPtr: unsafeBitCast(java_get_TestAPI_SimpleEnum_hex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_favoriteColor"),
                signature: bag.add("()Lcom/cricut/testapi/SimpleEnum;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_SimpleEnum_favoriteColor, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_favoriteColor"),
                signature: bag.add("(Lcom/cricut/testapi/SimpleEnum;)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_SimpleEnum_favoriteColor, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Strings...")
        try TestAPI.Strings.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Strings.externalWitnessClass ?? TestAPI.Strings.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echo"),
                signature: bag.add("(Ljava/lang/String;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_Strings_echo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_simple"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_simple, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_accent"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_accent, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_script"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_script, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chinese"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_chinese, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chineseBMP"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_chineseBMP, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_chineseSIP"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_chineseSIP, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_emoji"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_emoji, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_emojiMulti"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Strings_emojiMulti, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Structs...")
        try TestAPI.Structs.javaSetup(env: env)
        // print("setting up _TestMethodsProtocolConverter...")
        try _TestMethodsProtocolConverter.javaSetup(env: env)
        try env.RegisterNatives(
            _TestMethodsProtocolConverter.externalWitnessClass ?? _TestMethodsProtocolConverter.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_foo"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(java__TestMethodsProtocolConverter_foo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_bar"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java__TestMethodsProtocolConverter_bar, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_baz"),
                signature: bag.add("(Z)V"),
                fnPtr: unsafeBitCast(java__TestMethodsProtocolConverter_baz, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_garply"),
                signature: bag.add("(Ljava/lang/String;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java__TestMethodsProtocolConverter_garply, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_xyzzy"),
                signature: bag.add("(JLjava/util/List;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java__TestMethodsProtocolConverter_xyzzy, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_plugh"),
                signature: bag.add("(Lkotlin/Triple;)Lkotlin/Triple;"),
                fnPtr: unsafeBitCast(java__TestMethodsProtocolConverter_plugh, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up _TestOptionalsProtocolConverter...")
        try _TestOptionalsProtocolConverter.javaSetup(env: env)
        try env.RegisterNatives(
            _TestOptionalsProtocolConverter.externalWitnessClass ?? _TestOptionalsProtocolConverter.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_wombat"),
                signature: bag.add("(Ljava/lang/Long;)Ljava/lang/Double;"),
                fnPtr: unsafeBitCast(java__TestOptionalsProtocolConverter_wombat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_spqr"),
                signature: bag.add("(Lcom/cricut/testapi/AssociatedDataEnum;)J"),
                fnPtr: unsafeBitCast(java__TestOptionalsProtocolConverter_spqr, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_flarp"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get__TestOptionalsProtocolConverter_flarp, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up _TestPropertiesProtocolConverter...")
        try _TestPropertiesProtocolConverter.javaSetup(env: env)
        try env.RegisterNatives(
            _TestPropertiesProtocolConverter.externalWitnessClass ?? _TestPropertiesProtocolConverter.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_corge"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get__TestPropertiesProtocolConverter_corge, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_frob"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get__TestPropertiesProtocolConverter_frob, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.TestProtocolClass...")
        try TestAPI.TestProtocolClass.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.TestProtocolClass.externalWitnessClass ?? TestAPI.TestProtocolClass.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_foo"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_foo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_bar"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_bar, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_baz"),
                signature: bag.add("(Z)V"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_baz, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_garply"),
                signature: bag.add("(Ljava/lang/String;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_garply, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_xyzzy"),
                signature: bag.add("(JLjava/util/List;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_xyzzy, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_plugh"),
                signature: bag.add("(Lkotlin/Triple;)Lkotlin/Triple;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_plugh, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_init"),
                signature: bag.add("(Ljava/lang/String;Ljava/lang/String;)Lcom/cricut/testapi/TestProtocolClass;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_init, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_wombat"),
                signature: bag.add("(Ljava/lang/Long;)Ljava/lang/Double;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_wombat, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_spqr"),
                signature: bag.add("(Lcom/cricut/testapi/AssociatedDataEnum;)J"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolClass_spqr, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_corge"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_TestProtocolClass_corge, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_corge"),
                signature: bag.add("(Ljava/lang/String;)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_TestProtocolClass_corge, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_frob"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_TestProtocolClass_frob, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_flarp"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_TestProtocolClass_flarp, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_flarp"),
                signature: bag.add("(Ljava/lang/String;)V"),
                fnPtr: unsafeBitCast(java_set_TestAPI_TestProtocolClass_flarp, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.TestProtocolEnum...")
        try TestAPI.TestProtocolEnum.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.TestProtocolEnum.externalWitnessClass ?? TestAPI.TestProtocolEnum.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_foo"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolEnum_foo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_bar"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolEnum_bar, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_baz"),
                signature: bag.add("(Z)V"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolEnum_baz, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_garply"),
                signature: bag.add("(Ljava/lang/String;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolEnum_garply, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_xyzzy"),
                signature: bag.add("(JLjava/util/List;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolEnum_xyzzy, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_plugh"),
                signature: bag.add("(Lkotlin/Triple;)Lkotlin/Triple;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolEnum_plugh, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.TestProtocolStruct...")
        try TestAPI.TestProtocolStruct.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.TestProtocolStruct.externalWitnessClass ?? TestAPI.TestProtocolStruct.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_foo"),
                signature: bag.add("()V"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolStruct_foo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_bar"),
                signature: bag.add("()Z"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolStruct_bar, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_baz"),
                signature: bag.add("(Z)V"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolStruct_baz, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_garply"),
                signature: bag.add("(Ljava/lang/String;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolStruct_garply, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_xyzzy"),
                signature: bag.add("(JLjava/util/List;)Ljava/lang/String;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolStruct_xyzzy, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_plugh"),
                signature: bag.add("(Lkotlin/Triple;)Lkotlin/Triple;"),
                fnPtr: unsafeBitCast(java_TestAPI_TestProtocolStruct_plugh, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_frob"),
                signature: bag.add("()Ljava/util/List;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_TestProtocolStruct_frob, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.Tuples...")
        try TestAPI.Tuples.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.Tuples.externalWitnessClass ?? TestAPI.Tuples.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_checkTuples"),
                signature: bag.add("(Lkotlin/Pair;Lkotlin/Triple;Lcom/cricut/fishyjoes/runtime/Tuple4;Lcom/cricut/fishyjoes/runtime/Tuple5;Lcom/cricut/fishyjoes/runtime/Tuple6;)Z"),
                fnPtr: unsafeBitCast(java_TestAPI_Tuples_checkTuples, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple2"),
                signature: bag.add("()Lkotlin/Pair;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Tuples_tuple2, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple3"),
                signature: bag.add("()Lkotlin/Triple;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Tuples_tuple3, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple4"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/Tuple4;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Tuples_tuple4, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple5"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/Tuple5;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Tuples_tuple5, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_tuple6"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/Tuple6;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_Tuples_tuple6, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up TestAPI.URLs...")
        try TestAPI.URLs.javaSetup(env: env)
        try env.RegisterNatives(
            TestAPI.URLs.externalWitnessClass ?? TestAPI.URLs.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_echo"),
                signature: bag.add("(Ljava/net/URL;)Ljava/net/URL;"),
                fnPtr: unsafeBitCast(java_TestAPI_URLs_echo, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_simple"),
                signature: bag.add("()Ljava/net/URL;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_URLs_simple, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_remoteFile"),
                signature: bag.add("()Ljava/net/URL;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_URLs_remoteFile, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_localFile"),
                signature: bag.add("()Ljava/net/URL;"),
                fnPtr: unsafeBitCast(java_get_TestAPI_URLs_localFile, to: UnsafeMutableRawPointer.self)
            )
        )
        // print("setting up Foundation.AttributedString.Runs.Run...")
        try Foundation.AttributedString.Runs.Run.javaSetup(env: env)
        // print("setting up Foundation.AttributedString.Index...")
        try Foundation.AttributedString.Index.javaSetup(env: env)
        // print("setting up Foundation.AttributeContainer...")
        try Foundation.AttributeContainer.javaSetup(env: env)
        // print("setting up Foundation.AttributedString...")
        try Foundation.AttributedString.javaSetup(env: env)
        // print("setting up Foundation.AttributedSubstring...")
        try Foundation.AttributedSubstring.javaSetup(env: env)
        // print("setting up Swift.Bool...")
        try Swift.Bool.javaSetup(env: env)
        // print("setting up Foundation.Data...")
        try Foundation.Data.javaSetup(env: env)
        // print("setting up Swift.Double...")
        try Swift.Double.javaSetup(env: env)
        // print("setting up Swift.Float...")
        try Swift.Float.javaSetup(env: env)
        // print("setting up Swift.Int...")
        try Swift.Int.javaSetup(env: env)
        // print("setting up Swift.Int16...")
        try Swift.Int16.javaSetup(env: env)
        // print("setting up Swift.Int32...")
        try Swift.Int32.javaSetup(env: env)
        // print("setting up Swift.Int64...")
        try Swift.Int64.javaSetup(env: env)
        // print("setting up Swift.Int8...")
        try Swift.Int8.javaSetup(env: env)
        // print("setting up Swift.String...")
        try Swift.String.javaSetup(env: env)
        // print("setting up Swift.UInt...")
        try Swift.UInt.javaSetup(env: env)
        // print("setting up Swift.UInt16...")
        try Swift.UInt16.javaSetup(env: env)
        // print("setting up Swift.UInt32...")
        try Swift.UInt32.javaSetup(env: env)
        // print("setting up Swift.UInt64...")
        try Swift.UInt64.javaSetup(env: env)
        // print("setting up Swift.UInt8...")
        try Swift.UInt8.javaSetup(env: env)
        // print("setting up Foundation.URL...")
        try Foundation.URL.javaSetup(env: env)
        // print("setting up Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>...")
        try Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.javaSetup(env: env)
        // print("setting up Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>...")
        try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.javaSetup(env: env)
        // print("setting up Tuple2Converter<Swift.Int, Swift.String>...")
        try Tuple2Converter<Swift.Int, Swift.String>.javaSetup(env: env)
        // print("setting up Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>...")
        try Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>.javaSetup(env: env)
        // print("setting up Tuple3Converter<Swift.String, Swift.Double, Swift.String>...")
        try Tuple3Converter<Swift.String, Swift.Double, Swift.String>.javaSetup(env: env)
        // print("setting up Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>...")
        try Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>.javaSetup(env: env)
        // print("setting up Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>...")
        try Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>.javaSetup(env: env)
        // print("setting up Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>...")
        try Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>.javaSetup(env: env)
        // print("setting up FishyJoesCommonRuntime.VoidConverter...")
        try FishyJoesCommonRuntime.VoidConverter.javaSetup(env: env)
        return JNI_VERSION_1_4
    }
}
