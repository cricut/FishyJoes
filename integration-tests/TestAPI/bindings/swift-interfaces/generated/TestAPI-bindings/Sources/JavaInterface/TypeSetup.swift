// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
private func jniTypeSetup(env: FishyJoesJavaRuntime.Env) throws {
    // print("setting up Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>...")
    try Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>...")
    try AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.javaSetup(env: env)
    // print("setting up Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>...")
    try Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>...")
    try Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
    // print("setting up Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>...")
    try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
    // print("setting up Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>...")
    try Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>...")
    try Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>...")
    try Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>...")
    try Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>...")
    try AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.javaSetup(env: env)
    // print("setting up Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>...")
    try Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
    // print("setting up Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>...")
    try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.javaSetup(env: env)
    // print("setting up AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>...")
    try AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.javaSetup(env: env)
    // print("setting up AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>...")
    try AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.javaSetup(env: env)
    // print("setting up AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>...")
    try AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.javaSetup(env: env)
    // print("setting up AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>...")
    try AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.javaSetup(env: env)
    // print("setting up Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>...")
    try Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>...")
    try AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.javaSetup(env: env)
    // print("setting up Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>...")
    try Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.javaSetup(env: env)
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
    // print("setting up Function3Converter<Swift.Int, Foundation.Data, Swift.Bool, FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>...")
    try Function3Converter<Swift.Int, Foundation.Data, Swift.Bool, FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>.javaSetup(env: env)
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
    // print("setting up AsyncFunction3Converter<Swift.Int, Foundation.Data, Swift.Bool, ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>...")
    try AsyncFunction3Converter<Swift.Int, Foundation.Data, Swift.Bool, ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>.javaSetup(env: env)
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
    // print("setting up FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>...")
    try FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.javaSetup(env: env)
    // print("setting up FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>...")
    try FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>.javaSetup(env: env)
    // print("setting up FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>...")
    try FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>.javaSetup(env: env)
    // print("setting up FutureConverter<FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>...")
    try FutureConverter<FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>.javaSetup(env: env)
    // print("setting up FutureConverter<FutureConverter<Swift.Double>>...")
    try FutureConverter<FutureConverter<Swift.Double>>.javaSetup(env: env)
    // print("setting up FutureConverter<FutureConverter<Swift.Int>>...")
    try FutureConverter<FutureConverter<Swift.Int>>.javaSetup(env: env)
    // print("setting up FutureConverter<FutureConverter<Swift.String>>...")
    try FutureConverter<FutureConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>...")
    try FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>.javaSetup(env: env)
    // print("setting up FutureConverter<ArrayConverter<Swift.String>>...")
    try FutureConverter<ArrayConverter<Swift.String>>.javaSetup(env: env)
    // print("setting up FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>...")
    try FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>.javaSetup(env: env)
    // print("setting up FutureConverter<OptionalConverter<Swift.UInt8>>...")
    try FutureConverter<OptionalConverter<Swift.UInt8>>.javaSetup(env: env)
    // print("setting up FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>...")
    try FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>.javaSetup(env: env)
    // print("setting up FutureConverter<Swift.Double>...")
    try FutureConverter<Swift.Double>.javaSetup(env: env)
    // print("setting up FutureConverter<Swift.Int>...")
    try FutureConverter<Swift.Int>.javaSetup(env: env)
    // print("setting up FutureConverter<Swift.String>...")
    try FutureConverter<Swift.String>.javaSetup(env: env)
    // print("setting up FutureConverter<Swift.UInt>...")
    try FutureConverter<Swift.UInt>.javaSetup(env: env)
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
    // print("setting up ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>...")
    try ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>.javaSetup(env: env)
    // print("setting up ResultConverter<Swift.Int, TestAPI.Results.Error>...")
    try ResultConverter<Swift.Int, TestAPI.Results.Error>.javaSetup(env: env)
    // print("setting up ResultConverter<Swift.String, TestAPI.Results.Error>...")
    try ResultConverter<Swift.String, TestAPI.Results.Error>.javaSetup(env: env)
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
    do {
        let fnPtr0 = unsafeBitCast(java_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces.javaClass, [
            ("__jni_testCall", "()J", fnPtr0),
        ])
    }
    // print("setting up Swift.String.PuttingTypesIntoQuestionablePlaces...")
    try Swift.String.PuttingTypesIntoQuestionablePlaces.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(Swift.String.PuttingTypesIntoQuestionablePlaces.javaClass, [
            ("__jni_testCall", "()J", fnPtr0),
        ])
    }
    // print("setting up Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces...")
    try Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.javaClass, [
            ("__jni_testCall", "()J", fnPtr0),
        ])
    }
    // print("setting up TestAPI.Actors.TemperatureLogger...")
    try TestAPI.Actors.TemperatureLogger.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Actors_TemperatureLogger_create, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_Actors_TemperatureLogger_backwardsLabel, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_get_TestAPI_Actors_TemperatureLogger_label, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_Actors_TemperatureLogger_min, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_TestAPI_Actors_TemperatureLogger_update, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Actors.TemperatureLogger.javaClass, [
            ("__jni_create", "(Ljava/lang/String;J)Lcom/cricut/testapi/Actors$TemperatureLogger;", fnPtr0),
            ("__jni_extensionIsolatedGetLabel", "()Lkotlinx/coroutines/Deferred;", fnPtr1),
            ("__jni_extensionNonisolatedGetLabel", "()Ljava/lang/String;", fnPtr2),
            ("__jni_get_backwardsLabel", "()Ljava/lang/String;", fnPtr3),
            ("__jni_get_extensionNonisolatedVarLabel", "()Ljava/lang/String;", fnPtr4),
            ("__jni_get_label", "()Ljava/lang/String;", fnPtr5),
            ("__jni_min", "()Lkotlinx/coroutines/Deferred;", fnPtr6),
            ("__jni_update", "(J)Lkotlinx/coroutines/Deferred;", fnPtr7),
        ])
    }
    // print("setting up TestAPI.Collections.CollectionHolder...")
    try TestAPI.Collections.CollectionHolder.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_Collections_CollectionHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_Collections_CollectionHolder_staticProperty, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_set_TestAPI_Collections_CollectionHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Collections.CollectionHolder.javaClass, [
            ("__jni_get_staticMutableProperty", "()Ljava/util/List;", fnPtr0),
            ("__jni_get_staticProperty", "()Ljava/util/List;", fnPtr1),
            ("__jni_set_staticMutableProperty", "(Ljava/util/List;)V", fnPtr2),
        ])
    }
    // print("setting up TestAPI.Methods.TheMethodError...")
    try TestAPI.Methods.TheMethodError.javaSetup(env: env)
    // print("setting up TestAPI.Primitives.PrimitiveHolder...")
    try TestAPI.Primitives.PrimitiveHolder.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_Primitives_PrimitiveHolder_staticProperty, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Primitives.PrimitiveHolder.javaClass, [
            ("__jni_get_staticMutableProperty", "()Ljava/util/List;", fnPtr0),
            ("__jni_get_staticProperty", "()Ljava/util/List;", fnPtr1),
            ("__jni_set_staticMutableProperty", "(Ljava/util/List;)V", fnPtr2),
        ])
    }
    // print("setting up TestAPI.Results.Error...")
    try TestAPI.Results.Error.javaSetup(env: env)
    // print("setting up TestAPI.Structs.MemberwiseStruct...")
    try TestAPI.Structs.MemberwiseStruct.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Structs_MemberwiseStruct_asyncGetMutable, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Structs_MemberwiseStruct_create, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Structs.MemberwiseStruct.javaClass, [
            ("__jni_asyncGetMutable", "()Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_create", "()Lcom/cricut/testapi/Structs$MemberwiseStruct;", fnPtr1),
        ])
    }
    // print("setting up TestAPI.Structs.MutableStruct...")
    try TestAPI.Structs.MutableStruct.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Structs_MutableStruct_asyncGetI, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Structs_MutableStruct_create, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Structs_MutableStruct_increment, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_Structs_MutableStruct_incrementAsync, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Structs.MutableStruct.javaClass, [
            ("__jni_asyncGetI", "()Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_create", "()Lcom/cricut/testapi/Structs$MutableStruct;", fnPtr1),
            ("__jni_increment", "()V", fnPtr2),
            ("__jni_incrementAsync", "()Lkotlinx/coroutines/Deferred;", fnPtr3),
        ])
    }
    // print("setting up TestAPI.Structs.PuttingTypesIntoQuestionablePlaces...")
    try TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.javaClass, [
            ("__jni_create", "()Lcom/cricut/testapi/Structs_PuttingTypesIntoQuestionablePlaces;", fnPtr0),
            ("__jni_testCall", "()J", fnPtr1),
        ])
    }
    // print("setting up TestAPI.Structs.ReferenceStruct...")
    try TestAPI.Structs.ReferenceStruct.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Structs_ReferenceStruct_asyncGetMutable, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Structs_ReferenceStruct_create, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_Structs_ReferenceStruct_immutable, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_Structs_ReferenceStruct_mutable, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(TestAPI.Structs.ReferenceStruct._javaHash, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_set_TestAPI_Structs_ReferenceStruct_mutable, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(TestAPI.Structs.ReferenceStruct._javaEquals, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Structs.ReferenceStruct.javaClass, [
            ("__jni_asyncGetMutable", "()Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_create", "()Lcom/cricut/testapi/Structs$ReferenceStruct;", fnPtr1),
            ("__jni_get_immutable", "()Ljava/lang/String;", fnPtr2),
            ("__jni_get_mutable", "()Ljava/lang/String;", fnPtr3),
            ("__jni_hashCode", "()I", fnPtr4),
            ("__jni_set_mutable", "(Ljava/lang/String;)V", fnPtr5),
            ("__jni_swiftEquals", "(Lcom/cricut/testapi/Structs$ReferenceStruct;Lcom/cricut/testapi/Structs$ReferenceStruct;)Z", fnPtr6),
        ])
    }
    // print("setting up TestAPI.Structs.TwentyOneItemStruct...")
    try TestAPI.Structs.TwentyOneItemStruct.javaSetup(env: env)
    // print("setting up TestAPI_CommonInterface._AProtocolConverter...")
    try TestAPI_CommonInterface._AProtocolConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_CommonInterface__AProtocolConverter__default_hasADefaultImplementation, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_CommonInterface__AProtocolConverter__default_hasADefaultImplementation2, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._AProtocolConverter.externalCompanionClass, [
            ("__jni__default_hasADefaultImplementation", "(Lcom/cricut/testapi/AProtocol;JD)Ljava/lang/String;", fnPtr0),
            ("__jni__default_hasADefaultImplementation2", "(Lcom/cricut/testapi/AProtocol;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;", fnPtr1),
        ])
    }
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_CommonInterface__AProtocolConverter_bar, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_AProtocol_baz, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_AProtocol_foo, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._AProtocolConverter.externalWitnessClass!, [
            ("__jni_bar", "(JJ)Lcom/cricut/testapi/AProtocol;", fnPtr0),
            ("__jni_get_baz", "()Z", fnPtr1),
            ("__jni_get_foo", "()Ljava/lang/String;", fnPtr2),
        ])
    }
    // print("setting up TestAPI.AProtocolImplementation...")
    try TestAPI.AProtocolImplementation.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_AProtocolImplementation_bar, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_AProtocolImplementation__default_hasADefaultImplementation, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_AProtocolImplementation__default_hasADefaultImplementation2, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.AProtocolImplementation.javaClass, [
            ("__jni_bar", "(JJ)Lcom/cricut/testapi/AProtocol;", fnPtr0),
            ("__jni__default_hasADefaultImplementation", "(JD)Ljava/lang/String;", fnPtr1),
            ("__jni__default_hasADefaultImplementation2", "(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;", fnPtr2),
        ])
    }
    // print("setting up TestAPI.Actors...")
    try TestAPI.Actors.javaSetup(env: env)
    // print("setting up TestAPI.AssociatedDataEnum...")
    try TestAPI.AssociatedDataEnum.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_AssociatedDataEnum_intValue, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_AssociatedDataEnum_staticThing, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_AssociatedDataEnum_plus, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.AssociatedDataEnum.javaClass, [
            ("__jni_get_intValue", "()J", fnPtr0),
            ("__jni_get_staticThing", "()Lcom/cricut/testapi/AssociatedDataEnum;", fnPtr1),
            ("__jni_plus", "(Lcom/cricut/testapi/AssociatedDataEnum;)Lcom/cricut/testapi/AssociatedDataEnum;", fnPtr2),
        ])
    }
    // print("setting up TestAPI.AsyncFunctions...")
    try TestAPI.AsyncFunctions.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_AsyncFunctions_exercise0, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_AsyncFunctions_exercise1, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_AsyncFunctions_exercise2, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_AsyncFunctions_exercise3, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_AsyncFunctions_exercise4, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_AsyncFunctions_exercise5, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_AsyncFunctions_exercise6, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_abs, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_add3Things, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_const42, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_fifthThing, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_intCompose, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_makeList, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_sixthThing, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_AsyncFunctions_willThrow, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_TestAPI_AsyncFunctions_thunkTwiceMaker, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.AsyncFunctions.javaClass, [
            ("__jni_exercise0", "(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_exercise1", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr1),
            ("__jni_exercise2", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr2),
            ("__jni_exercise3", "(Lkotlin/jvm/functions/Function4;)Lkotlinx/coroutines/Deferred;", fnPtr3),
            ("__jni_exercise4", "(Lkotlin/jvm/functions/Function5;)Lkotlinx/coroutines/Deferred;", fnPtr4),
            ("__jni_exercise5", "(Lkotlin/jvm/functions/Function6;)Lkotlinx/coroutines/Deferred;", fnPtr5),
            ("__jni_exercise6", "(Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;", fnPtr6),
            ("__jni_get_abs", "()Lkotlin/jvm/functions/Function2;", fnPtr7),
            ("__jni_get_add3Things", "()Lkotlin/jvm/functions/Function4;", fnPtr8),
            ("__jni_get_const42", "()Lkotlin/jvm/functions/Function1;", fnPtr9),
            ("__jni_get_fifthThing", "()Lkotlin/jvm/functions/Function6;", fnPtr10),
            ("__jni_get_intCompose", "()Lkotlin/jvm/functions/Function2;", fnPtr11),
            ("__jni_get_makeList", "()Lkotlin/jvm/functions/Function5;", fnPtr12),
            ("__jni_get_sixthThing", "()Lkotlin/jvm/functions/Function7;", fnPtr13),
            ("__jni_get_willThrow", "()Lkotlin/jvm/functions/Function1;", fnPtr14),
            ("__jni_thunkTwiceMaker", "(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;", fnPtr15),
        ])
    }
    // print("setting up TestAPI.AttributedStrings...")
    try TestAPI.AttributedStrings.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_AttributedStrings_attributedCharacters, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_AttributedStrings_echo, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_AttributedStrings_emptyAttributeRuns, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_AttributedStrings_firstIndex, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_AttributedStrings_fullRange, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_get_TestAPI_AttributedStrings_accent, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_get_TestAPI_AttributedStrings_chinese, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_get_TestAPI_AttributedStrings_chineseBMP, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_get_TestAPI_AttributedStrings_chineseSIP, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_AttributedStrings_emoji, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_AttributedStrings_emojiMulti, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_AttributedStrings_polyglot, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_AttributedStrings_script, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_AttributedStrings_simple, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_TestAPI_AttributedStrings_lastIndex, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.AttributedStrings.javaClass, [
            ("__jni_attributedCharacters", "(Lcom/cricut/fishyjoes/runtime/AttributedString;)Ljava/util/List;", fnPtr0),
            ("__jni_attributesPreferringDuplicatesNearerStart", "(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributeContainer;", fnPtr1),
            ("__jni_echo", "(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr2),
            ("__jni_emptyAttributeRuns", "(Lcom/cricut/fishyjoes/runtime/AttributedString;)Ljava/util/List;", fnPtr3),
            ("__jni_firstIndex", "(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;", fnPtr4),
            ("__jni_fullRange", "(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr5),
            ("__jni_get_accent", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr6),
            ("__jni_get_chinese", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr7),
            ("__jni_get_chineseBMP", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr8),
            ("__jni_get_chineseSIP", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr9),
            ("__jni_get_emoji", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr10),
            ("__jni_get_emojiMulti", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr11),
            ("__jni_get_polyglot", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr12),
            ("__jni_get_script", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr13),
            ("__jni_get_simple", "()Lcom/cricut/fishyjoes/runtime/AttributedString;", fnPtr14),
            ("__jni_lastIndex", "(Lcom/cricut/fishyjoes/runtime/AttributedString;)Lcom/cricut/fishyjoes/runtime/AttributedString$Index;", fnPtr15),
        ])
    }
    // print("setting up TestAPI.Bytes...")
    try TestAPI.Bytes.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Bytes_echoBytes, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Bytes_echoData, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_Bytes_bytes, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_Bytes_data, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Bytes.javaClass, [
            ("__jni_echoBytes", "(Ljava/util/List;)Ljava/util/List;", fnPtr0),
            ("__jni_echoData", "([B)[B", fnPtr1),
            ("__jni_get_bytes", "()Ljava/util/List;", fnPtr2),
            ("__jni_get_data", "()[B", fnPtr3),
        ])
    }
    // print("setting up TestAPI.ClosedRanges...")
    try TestAPI.ClosedRanges.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_ClosedRanges_echoDoubleRange, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_ClosedRanges_echoFloatRange, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_ClosedRanges_echoInt16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_ClosedRanges_echoInt32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_ClosedRanges_echoInt64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_ClosedRanges_echoInt8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_ClosedRanges_echoIntRange, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_TestAPI_ClosedRanges_echoStringRange, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_TestAPI_ClosedRanges_echoUInt8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_TestAPI_ClosedRanges_echoUIntRange, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_ClosedRanges_doubleRange, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_ClosedRanges_floatRange, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_get_TestAPI_ClosedRanges_int16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr16 = unsafeBitCast(java_get_TestAPI_ClosedRanges_int32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr17 = unsafeBitCast(java_get_TestAPI_ClosedRanges_int64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr18 = unsafeBitCast(java_get_TestAPI_ClosedRanges_int8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr19 = unsafeBitCast(java_get_TestAPI_ClosedRanges_intRange, to: UnsafeMutableRawPointer.self)
        let fnPtr20 = unsafeBitCast(java_get_TestAPI_ClosedRanges_stringRange, to: UnsafeMutableRawPointer.self)
        let fnPtr21 = unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr22 = unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr23 = unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr24 = unsafeBitCast(java_get_TestAPI_ClosedRanges_uInt8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr25 = unsafeBitCast(java_get_TestAPI_ClosedRanges_uIntRange, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.ClosedRanges.javaClass, [
            ("__jni_echoDoubleRange", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr0),
            ("__jni_echoFloatRange", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr1),
            ("__jni_echoInt16Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr2),
            ("__jni_echoInt32Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr3),
            ("__jni_echoInt64Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr4),
            ("__jni_echoInt8Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr5),
            ("__jni_echoIntRange", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr6),
            ("__jni_echoStringRange", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr7),
            ("__jni_echoUInt16Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr8),
            ("__jni_echoUInt32Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr9),
            ("__jni_echoUInt64Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr10),
            ("__jni_echoUInt8Range", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr11),
            ("__jni_echoUIntRange", "(Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;)Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr12),
            ("__jni_get_doubleRange", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr13),
            ("__jni_get_floatRange", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr14),
            ("__jni_get_int16Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr15),
            ("__jni_get_int32Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr16),
            ("__jni_get_int64Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr17),
            ("__jni_get_int8Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr18),
            ("__jni_get_intRange", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr19),
            ("__jni_get_stringRange", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr20),
            ("__jni_get_uInt16Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr21),
            ("__jni_get_uInt32Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr22),
            ("__jni_get_uInt64Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr23),
            ("__jni_get_uInt8Range", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr24),
            ("__jni_get_uIntRange", "()Lcom/cricut/fishyjoes/runtime/SwiftClosedRange;", fnPtr25),
        ])
    }
    // print("setting up TestAPI.Collections...")
    try TestAPI.Collections.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Collections_collectionMapper, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Collections_echoArrayOfInt, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Collections_echoDictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_Collections_echoMaybeArrayOfMaybeInt, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_Collections_echoMaybeSetOfMaybeInt, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_Collections_echoSetOfInt, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_get_TestAPI_Collections_arrayOfBigTuples, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_get_TestAPI_Collections_arrayOfInt, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_get_TestAPI_Collections_defaultCollectionHolder, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_Collections_dictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_Collections_maybeArrayOfInt, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_Collections_maybeArrayOfMaybeInt, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_Collections_maybeDictionaryOfIntToInt, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_get_TestAPI_Collections_maybeSetOfInt, to: UnsafeMutableRawPointer.self)
        let fnPtr16 = unsafeBitCast(java_get_TestAPI_Collections_maybeSetOfMaybeInt, to: UnsafeMutableRawPointer.self)
        let fnPtr17 = unsafeBitCast(java_get_TestAPI_Collections_setOfInt, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Collections.javaClass, [
            ("__jni_collectionMapper", "(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Ljava/util/List;", fnPtr0),
            ("__jni_echoArrayOfInt", "(Ljava/util/List;)Ljava/util/List;", fnPtr1),
            ("__jni_echoDictionaryOfIntToInt", "(Ljava/util/Map;)Ljava/util/Map;", fnPtr2),
            ("__jni_echoMaybeArrayOfMaybeInt", "(Ljava/util/List;)Ljava/util/List;", fnPtr3),
            ("__jni_echoMaybeDictionaryOfIntToMaybeInt", "(Ljava/util/Map;)Ljava/util/Map;", fnPtr4),
            ("__jni_echoMaybeSetOfMaybeInt", "(Ljava/util/Set;)Ljava/util/Set;", fnPtr5),
            ("__jni_echoSetOfInt", "(Ljava/util/Set;)Ljava/util/Set;", fnPtr6),
            ("__jni_get_arrayOfBigTuples", "()Ljava/util/List;", fnPtr7),
            ("__jni_get_arrayOfInt", "()Ljava/util/List;", fnPtr8),
            ("__jni_get_defaultCollectionHolder", "()Lcom/cricut/testapi/Collections$CollectionHolder;", fnPtr9),
            ("__jni_get_dictionaryOfIntToInt", "()Ljava/util/Map;", fnPtr10),
            ("__jni_get_maybeArrayOfInt", "()Ljava/util/List;", fnPtr11),
            ("__jni_get_maybeArrayOfMaybeInt", "()Ljava/util/List;", fnPtr12),
            ("__jni_get_maybeDictionaryOfIntToInt", "()Ljava/util/Map;", fnPtr13),
            ("__jni_get_maybeDictionaryOfIntToMaybeInt", "()Ljava/util/Map;", fnPtr14),
            ("__jni_get_maybeSetOfInt", "()Ljava/util/Set;", fnPtr15),
            ("__jni_get_maybeSetOfMaybeInt", "()Ljava/util/Set;", fnPtr16),
            ("__jni_get_setOfInt", "()Ljava/util/Set;", fnPtr17),
        ])
    }
    // print("setting up TestAPI.DefaultArguments...")
    try TestAPI.DefaultArguments.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_DefaultArguments_echoDefaults, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.DefaultArguments.javaClass, [
            ("__jni_echoDefaults", "(Ljava/lang/Long;Ljava/lang/Long;D)Ljava/lang/String;", fnPtr0),
        ])
    }
    // print("setting up TestAPI.Deprecations...")
    try TestAPI.Deprecations.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Deprecations_deprecatedMethod, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_Deprecations_deprecatedVariable, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Deprecations.javaClass, [
            ("__jni_deprecatedMethod", "()Ljava/lang/String;", fnPtr0),
            ("__jni_get_deprecatedVariable", "()J", fnPtr1),
        ])
    }
    // print("setting up TestAPI.EmptyClass...")
    try TestAPI.EmptyClass.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_EmptyClass_Gorpers, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_EmptyClass_create, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_EmptyClass_blarg, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(TestAPI.EmptyClass._javaHash, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_EmptyClass_shme, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(TestAPI.EmptyClass._javaEquals, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.EmptyClass.javaClass, [
            ("__jni_Gorpers", "()Ljava/lang/String;", fnPtr0),
            ("__jni_create", "()Lcom/cricut/testapi/EmptyClass1;", fnPtr1),
            ("__jni_get_blarg", "()Ljava/lang/String;", fnPtr2),
            ("__jni_get_wibbledyWobbledyTimeyWhimey", "()Ljava/lang/String;", fnPtr3),
            ("__jni_hashCode", "()I", fnPtr4),
            ("__jni_shme", "()Ljava/lang/String;", fnPtr5),
            ("__jni_swiftEquals", "(Lcom/cricut/testapi/EmptyClass1;Lcom/cricut/testapi/EmptyClass1;)Z", fnPtr6),
        ])
    }
    // print("setting up TestAPI.EmptyClass2...")
    try TestAPI.EmptyClass2.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_EmptyClass2_blorg, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_EmptyClass2_wibble, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_EmptyClass2_gorp, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(TestAPI.EmptyClass2._javaHash, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_EmptyClass2_make, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_EmptyClass2_shmee, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(TestAPI.EmptyClass2._javaEquals, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.EmptyClass2.javaClass, [
            ("__jni_get_blorg", "()Ljava/lang/String;", fnPtr0),
            ("__jni_get_wibble", "()Ljava/lang/String;", fnPtr1),
            ("__jni_gorp", "()Ljava/lang/String;", fnPtr2),
            ("__jni_hashCode", "()I", fnPtr3),
            ("__jni_make", "()Lcom/cricut/testapi/EmptyClass2;", fnPtr4),
            ("__jni_shmee", "()Ljava/lang/String;", fnPtr5),
            ("__jni_swiftEquals", "(Lcom/cricut/testapi/EmptyClass2;Lcom/cricut/testapi/EmptyClass2;)Z", fnPtr6),
        ])
    }
    // print("setting up TestAPI.EmptyEnum...")
    try TestAPI.EmptyEnum.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_EmptyEnum_aStaticMethod, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_EmptyEnum_aStaticProperty, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_EmptyEnum_notGoingToHappen, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.EmptyEnum.javaClass, [
            ("__jni_aStaticMethod", "()J", fnPtr0),
            ("__jni_get_aStaticProperty", "()J", fnPtr1),
            ("__jni_notGoingToHappen", "()Lcom/cricut/testapi/EmptyEnum;", fnPtr2),
        ])
    }
    // print("setting up TestAPI.EmptyStruct...")
    try TestAPI.EmptyStruct.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_EmptyStruct_aap, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_EmptyStruct_create, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_EmptyStruct_tatiana, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_EmptyStruct_tutu, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_EmptyStruct_zxccxz, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.EmptyStruct.javaClass, [
            ("__jni_aap", "()Ljava/lang/String;", fnPtr0),
            ("__jni_create", "()Lcom/cricut/testapi/EmptyStruct;", fnPtr1),
            ("__jni_get_tatiana", "()Ljava/lang/String;", fnPtr2),
            ("__jni_get_tutu", "()J", fnPtr3),
            ("__jni_zxccxz", "()Ljava/lang/String;", fnPtr4),
        ])
    }
    // print("setting up TestAPI.EmptyStruct2...")
    try TestAPI.EmptyStruct2.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_EmptyStruct2_aap, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_EmptyStruct2_create, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_EmptyStruct2_tatiana, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_EmptyStruct2_tutu, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_EmptyStruct2_zxccxz, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.EmptyStruct2.javaClass, [
            ("__jni_aap", "()Ljava/lang/String;", fnPtr0),
            ("__jni_create", "()Lcom/cricut/testapi/EmptyStruct2;", fnPtr1),
            ("__jni_get_tatiana", "()Ljava/lang/String;", fnPtr2),
            ("__jni_get_tutu", "()J", fnPtr3),
            ("__jni_zxccxz", "()Ljava/lang/String;", fnPtr4),
        ])
    }
    // print("setting up TestAPI.Functions...")
    try TestAPI.Functions.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Functions_exercise0, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Functions_exercise1, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Functions_exercise2, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_Functions_exercise3, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_Functions_exercise4, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_Functions_exercise5, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_Functions_exercise6, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_get_TestAPI_Functions_abs, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_get_TestAPI_Functions_add3Things, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_get_TestAPI_Functions_const42, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_Functions_fifthThing, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_Functions_intCompose, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_Functions_makeList, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_Functions_sixthThing, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_TestAPI_Functions_thunkTwiceMaker, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_TestAPI_Functions_willThrow, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Functions.javaClass, [
            ("__jni_exercise0", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/String;", fnPtr0),
            ("__jni_exercise1", "(Lkotlin/jvm/functions/Function1;)Ljava/lang/String;", fnPtr1),
            ("__jni_exercise2", "(Lkotlin/jvm/functions/Function2;)Ljava/lang/String;", fnPtr2),
            ("__jni_exercise3", "(Lkotlin/jvm/functions/Function3;)Ljava/lang/String;", fnPtr3),
            ("__jni_exercise4", "(Lkotlin/jvm/functions/Function4;)Ljava/lang/String;", fnPtr4),
            ("__jni_exercise5", "(Lkotlin/jvm/functions/Function5;)Ljava/lang/String;", fnPtr5),
            ("__jni_exercise6", "(Lkotlin/jvm/functions/Function6;)Ljava/lang/String;", fnPtr6),
            ("__jni_get_abs", "()Lkotlin/jvm/functions/Function1;", fnPtr7),
            ("__jni_get_add3Things", "()Lkotlin/jvm/functions/Function3;", fnPtr8),
            ("__jni_get_const42", "()Lkotlin/jvm/functions/Function0;", fnPtr9),
            ("__jni_get_fifthThing", "()Lkotlin/jvm/functions/Function5;", fnPtr10),
            ("__jni_get_intCompose", "()Lkotlin/jvm/functions/Function2;", fnPtr11),
            ("__jni_get_makeList", "()Lkotlin/jvm/functions/Function4;", fnPtr12),
            ("__jni_get_sixthThing", "()Lkotlin/jvm/functions/Function6;", fnPtr13),
            ("__jni_thunkTwiceMaker", "(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;", fnPtr14),
            ("__jni_willThrow", "()Ljava/lang/String;", fnPtr15),
        ])
    }
    // print("setting up TestAPI.Methods...")
    try TestAPI.Methods.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Methods_async42, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Methods_asyncCallbackFunc0, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Methods_asyncDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_Methods_asyncMultipleArgs, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_Methods_asyncSleep, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_Methods_asyncThrowing, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_Methods_asyncVoid, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_TestAPI_Methods_asyncYield, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_TestAPI_Methods_create, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_TestAPI_Methods_doublePlusGood, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_Methods_garply, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_Methods_instanceGet, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_Methods_instanceModifiable, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_Methods_instanceStored, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_Methods_staticGet, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_get_TestAPI_Methods_staticModifiable, to: UnsafeMutableRawPointer.self)
        let fnPtr16 = unsafeBitCast(java_get_TestAPI_Methods_staticStored, to: UnsafeMutableRawPointer.self)
        let fnPtr17 = unsafeBitCast(java_get_TestAPI_Methods_instanceGetMethod, to: UnsafeMutableRawPointer.self)
        let fnPtr18 = unsafeBitCast(java_TestAPI_Methods_methodWithNewlinesInTypes, to: UnsafeMutableRawPointer.self)
        let fnPtr19 = unsafeBitCast(java_set_TestAPI_Methods_instanceModifiable, to: UnsafeMutableRawPointer.self)
        let fnPtr20 = unsafeBitCast(java_set_TestAPI_Methods_instanceStored, to: UnsafeMutableRawPointer.self)
        let fnPtr21 = unsafeBitCast(java_set_TestAPI_Methods_staticModifiable, to: UnsafeMutableRawPointer.self)
        let fnPtr22 = unsafeBitCast(java_set_TestAPI_Methods_staticStored, to: UnsafeMutableRawPointer.self)
        let fnPtr23 = unsafeBitCast(java_TestAPI_Methods_staticAsync42, to: UnsafeMutableRawPointer.self)
        let fnPtr24 = unsafeBitCast(java_TestAPI_Methods_staticAsyncCallbackFunc0, to: UnsafeMutableRawPointer.self)
        let fnPtr25 = unsafeBitCast(java_TestAPI_Methods_staticAsyncDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr26 = unsafeBitCast(java_TestAPI_Methods_staticAsyncMultipleArgs, to: UnsafeMutableRawPointer.self)
        let fnPtr27 = unsafeBitCast(java_TestAPI_Methods_staticAsyncSleep, to: UnsafeMutableRawPointer.self)
        let fnPtr28 = unsafeBitCast(java_TestAPI_Methods_staticAsyncThrowing, to: UnsafeMutableRawPointer.self)
        let fnPtr29 = unsafeBitCast(java_TestAPI_Methods_staticAsyncVoid, to: UnsafeMutableRawPointer.self)
        let fnPtr30 = unsafeBitCast(java_TestAPI_Methods_staticAsyncYield, to: UnsafeMutableRawPointer.self)
        let fnPtr31 = unsafeBitCast(java_get_TestAPI_Methods_staticGetMethod, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Methods.javaClass, [
            ("__jni_async42", "()Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_asyncCallbackFunc0", "(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr1),
            ("__jni_asyncDouble", "(D)Lkotlinx/coroutines/Deferred;", fnPtr2),
            ("__jni_asyncMultipleArgs", "(JLkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr3),
            ("__jni_asyncSleep", "()Lkotlinx/coroutines/Deferred;", fnPtr4),
            ("__jni_asyncThrowing", "()Lkotlinx/coroutines/Deferred;", fnPtr5),
            ("__jni_asyncVoid", "()Lkotlinx/coroutines/Deferred;", fnPtr6),
            ("__jni_asyncYield", "()Lkotlinx/coroutines/Deferred;", fnPtr7),
            ("__jni_create", "()Lcom/cricut/testapi/Methods;", fnPtr8),
            ("__jni_doublePlusGood", "(JD)J", fnPtr9),
            ("__jni_get_garply", "()J", fnPtr10),
            ("__jni_get_instanceGet", "()J", fnPtr11),
            ("__jni_get_instanceModifiable", "()J", fnPtr12),
            ("__jni_get_instanceStored", "()J", fnPtr13),
            ("__jni_get_staticGet", "()J", fnPtr14),
            ("__jni_get_staticModifiable", "()J", fnPtr15),
            ("__jni_get_staticStored", "()J", fnPtr16),
            ("__jni_instanceGetMethod", "()J", fnPtr17),
            ("__jni_methodWithNewlinesInTypes", "(Lkotlin/jvm/functions/Function4;)V", fnPtr18),
            ("__jni_set_instanceModifiable", "(J)V", fnPtr19),
            ("__jni_set_instanceStored", "(J)V", fnPtr20),
            ("__jni_set_staticModifiable", "(J)V", fnPtr21),
            ("__jni_set_staticStored", "(J)V", fnPtr22),
            ("__jni_staticAsync42", "()Lkotlinx/coroutines/Deferred;", fnPtr23),
            ("__jni_staticAsyncCallbackFunc0", "(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr24),
            ("__jni_staticAsyncDouble", "(D)Lkotlinx/coroutines/Deferred;", fnPtr25),
            ("__jni_staticAsyncMultipleArgs", "(JLkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr26),
            ("__jni_staticAsyncSleep", "()Lkotlinx/coroutines/Deferred;", fnPtr27),
            ("__jni_staticAsyncThrowing", "()Lkotlinx/coroutines/Deferred;", fnPtr28),
            ("__jni_staticAsyncVoid", "()Lkotlinx/coroutines/Deferred;", fnPtr29),
            ("__jni_staticAsyncYield", "()Lkotlinx/coroutines/Deferred;", fnPtr30),
            ("__jni_staticGetMethod", "()J", fnPtr31),
        ])
    }
    // print("setting up TestAPI.Primitives...")
    try TestAPI.Primitives.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Primitives_boolOverflow, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Primitives_echoBool, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Primitives_echoDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_Primitives_echoFloat, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_Primitives_echoInt, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_Primitives_echoInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_Primitives_echoInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_TestAPI_Primitives_echoInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_TestAPI_Primitives_echoInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_TestAPI_Primitives_echoUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_TestAPI_Primitives_echoUInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_TestAPI_Primitives_echoUInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_TestAPI_Primitives_echoUInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_TestAPI_Primitives_echoUInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_Primitives_bitCountInt, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_get_TestAPI_Primitives_bitCountUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr16 = unsafeBitCast(java_get_TestAPI_Primitives_defaultPrimitiveHolder, to: UnsafeMutableRawPointer.self)
        let fnPtr17 = unsafeBitCast(java_get_TestAPI_Primitives_falseBool, to: UnsafeMutableRawPointer.self)
        let fnPtr18 = unsafeBitCast(java_get_TestAPI_Primitives_manyBool, to: UnsafeMutableRawPointer.self)
        let fnPtr19 = unsafeBitCast(java_get_TestAPI_Primitives_manyDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr20 = unsafeBitCast(java_get_TestAPI_Primitives_manyFloat, to: UnsafeMutableRawPointer.self)
        let fnPtr21 = unsafeBitCast(java_get_TestAPI_Primitives_manyInt, to: UnsafeMutableRawPointer.self)
        let fnPtr22 = unsafeBitCast(java_get_TestAPI_Primitives_manyInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr23 = unsafeBitCast(java_get_TestAPI_Primitives_manyInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr24 = unsafeBitCast(java_get_TestAPI_Primitives_manyInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr25 = unsafeBitCast(java_get_TestAPI_Primitives_manyInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr26 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeBool, to: UnsafeMutableRawPointer.self)
        let fnPtr27 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr28 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeFloat, to: UnsafeMutableRawPointer.self)
        let fnPtr29 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt, to: UnsafeMutableRawPointer.self)
        let fnPtr30 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr31 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr32 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr33 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr34 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr35 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr36 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr37 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr38 = unsafeBitCast(java_get_TestAPI_Primitives_manyMaybeUInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr39 = unsafeBitCast(java_get_TestAPI_Primitives_manyUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr40 = unsafeBitCast(java_get_TestAPI_Primitives_manyUInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr41 = unsafeBitCast(java_get_TestAPI_Primitives_manyUInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr42 = unsafeBitCast(java_get_TestAPI_Primitives_manyUInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr43 = unsafeBitCast(java_get_TestAPI_Primitives_manyUInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr44 = unsafeBitCast(java_get_TestAPI_Primitives_maxDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr45 = unsafeBitCast(java_get_TestAPI_Primitives_maxFloat, to: UnsafeMutableRawPointer.self)
        let fnPtr46 = unsafeBitCast(java_get_TestAPI_Primitives_maxInt, to: UnsafeMutableRawPointer.self)
        let fnPtr47 = unsafeBitCast(java_get_TestAPI_Primitives_maxInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr48 = unsafeBitCast(java_get_TestAPI_Primitives_maxInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr49 = unsafeBitCast(java_get_TestAPI_Primitives_maxInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr50 = unsafeBitCast(java_get_TestAPI_Primitives_maxInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr51 = unsafeBitCast(java_get_TestAPI_Primitives_maxUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr52 = unsafeBitCast(java_get_TestAPI_Primitives_maxUInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr53 = unsafeBitCast(java_get_TestAPI_Primitives_maxUInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr54 = unsafeBitCast(java_get_TestAPI_Primitives_maxUInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr55 = unsafeBitCast(java_get_TestAPI_Primitives_maxUInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr56 = unsafeBitCast(java_get_TestAPI_Primitives_minDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr57 = unsafeBitCast(java_get_TestAPI_Primitives_minFloat, to: UnsafeMutableRawPointer.self)
        let fnPtr58 = unsafeBitCast(java_get_TestAPI_Primitives_minInt, to: UnsafeMutableRawPointer.self)
        let fnPtr59 = unsafeBitCast(java_get_TestAPI_Primitives_minInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr60 = unsafeBitCast(java_get_TestAPI_Primitives_minInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr61 = unsafeBitCast(java_get_TestAPI_Primitives_minInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr62 = unsafeBitCast(java_get_TestAPI_Primitives_minInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr63 = unsafeBitCast(java_get_TestAPI_Primitives_minUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr64 = unsafeBitCast(java_get_TestAPI_Primitives_minUInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr65 = unsafeBitCast(java_get_TestAPI_Primitives_minUInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr66 = unsafeBitCast(java_get_TestAPI_Primitives_minUInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr67 = unsafeBitCast(java_get_TestAPI_Primitives_minUInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr68 = unsafeBitCast(java_get_TestAPI_Primitives_trueBool, to: UnsafeMutableRawPointer.self)
        let fnPtr69 = unsafeBitCast(java_get_TestAPI_Primitives_zeroDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr70 = unsafeBitCast(java_get_TestAPI_Primitives_zeroFloat, to: UnsafeMutableRawPointer.self)
        let fnPtr71 = unsafeBitCast(java_get_TestAPI_Primitives_zeroInt, to: UnsafeMutableRawPointer.self)
        let fnPtr72 = unsafeBitCast(java_get_TestAPI_Primitives_zeroInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr73 = unsafeBitCast(java_get_TestAPI_Primitives_zeroInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr74 = unsafeBitCast(java_get_TestAPI_Primitives_zeroInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr75 = unsafeBitCast(java_get_TestAPI_Primitives_zeroInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr76 = unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr77 = unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr78 = unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr79 = unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr80 = unsafeBitCast(java_get_TestAPI_Primitives_zeroUInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr81 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoBool, to: UnsafeMutableRawPointer.self)
        let fnPtr82 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoDouble, to: UnsafeMutableRawPointer.self)
        let fnPtr83 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoFloat, to: UnsafeMutableRawPointer.self)
        let fnPtr84 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt, to: UnsafeMutableRawPointer.self)
        let fnPtr85 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr86 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr87 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr88 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr89 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt, to: UnsafeMutableRawPointer.self)
        let fnPtr90 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt16, to: UnsafeMutableRawPointer.self)
        let fnPtr91 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt32, to: UnsafeMutableRawPointer.self)
        let fnPtr92 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt64, to: UnsafeMutableRawPointer.self)
        let fnPtr93 = unsafeBitCast(java_TestAPI_Primitives_maybeEchoUInt8, to: UnsafeMutableRawPointer.self)
        let fnPtr94 = unsafeBitCast(java_TestAPI_Primitives_valueMapper, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Primitives.javaClass, [
            ("__jni_boolOverflow", "(ZZZZZZZZZZZZZZZZ)J", fnPtr0),
            ("__jni_echoBool", "(Z)Z", fnPtr1),
            ("__jni_echoDouble", "(D)D", fnPtr2),
            ("__jni_echoFloat", "(F)F", fnPtr3),
            ("__jni_echoInt", "(J)J", fnPtr4),
            ("__jni_echoInt16", "(S)S", fnPtr5),
            ("__jni_echoInt32", "(I)I", fnPtr6),
            ("__jni_echoInt64", "(J)J", fnPtr7),
            ("__jni_echoInt8", "(B)B", fnPtr8),
            ("__jni_echoUInt", "(J)J", fnPtr9),
            ("__jni_echoUInt16", "(S)S", fnPtr10),
            ("__jni_echoUInt32", "(I)I", fnPtr11),
            ("__jni_echoUInt64", "(J)J", fnPtr12),
            ("__jni_echoUInt8", "(B)B", fnPtr13),
            ("__jni_get_bitCountInt", "()J", fnPtr14),
            ("__jni_get_bitCountUInt", "()J", fnPtr15),
            ("__jni_get_defaultPrimitiveHolder", "()Lcom/cricut/testapi/Primitives$PrimitiveHolder;", fnPtr16),
            ("__jni_get_falseBool", "()Z", fnPtr17),
            ("__jni_get_manyBool", "()Ljava/util/List;", fnPtr18),
            ("__jni_get_manyDouble", "()Ljava/util/List;", fnPtr19),
            ("__jni_get_manyFloat", "()Ljava/util/List;", fnPtr20),
            ("__jni_get_manyInt", "()Ljava/util/List;", fnPtr21),
            ("__jni_get_manyInt16", "()Ljava/util/List;", fnPtr22),
            ("__jni_get_manyInt32", "()Ljava/util/List;", fnPtr23),
            ("__jni_get_manyInt64", "()Ljava/util/List;", fnPtr24),
            ("__jni_get_manyInt8", "()Ljava/util/List;", fnPtr25),
            ("__jni_get_manyMaybeBool", "()Ljava/util/List;", fnPtr26),
            ("__jni_get_manyMaybeDouble", "()Ljava/util/List;", fnPtr27),
            ("__jni_get_manyMaybeFloat", "()Ljava/util/List;", fnPtr28),
            ("__jni_get_manyMaybeInt", "()Ljava/util/List;", fnPtr29),
            ("__jni_get_manyMaybeInt16", "()Ljava/util/List;", fnPtr30),
            ("__jni_get_manyMaybeInt32", "()Ljava/util/List;", fnPtr31),
            ("__jni_get_manyMaybeInt64", "()Ljava/util/List;", fnPtr32),
            ("__jni_get_manyMaybeInt8", "()Ljava/util/List;", fnPtr33),
            ("__jni_get_manyMaybeUInt", "()Ljava/util/List;", fnPtr34),
            ("__jni_get_manyMaybeUInt16", "()Ljava/util/List;", fnPtr35),
            ("__jni_get_manyMaybeUInt32", "()Ljava/util/List;", fnPtr36),
            ("__jni_get_manyMaybeUInt64", "()Ljava/util/List;", fnPtr37),
            ("__jni_get_manyMaybeUInt8", "()Ljava/util/List;", fnPtr38),
            ("__jni_get_manyUInt", "()Ljava/util/List;", fnPtr39),
            ("__jni_get_manyUInt16", "()Ljava/util/List;", fnPtr40),
            ("__jni_get_manyUInt32", "()Ljava/util/List;", fnPtr41),
            ("__jni_get_manyUInt64", "()Ljava/util/List;", fnPtr42),
            ("__jni_get_manyUInt8", "()Ljava/util/List;", fnPtr43),
            ("__jni_get_maxDouble", "()D", fnPtr44),
            ("__jni_get_maxFloat", "()F", fnPtr45),
            ("__jni_get_maxInt", "()J", fnPtr46),
            ("__jni_get_maxInt16", "()S", fnPtr47),
            ("__jni_get_maxInt32", "()I", fnPtr48),
            ("__jni_get_maxInt64", "()J", fnPtr49),
            ("__jni_get_maxInt8", "()B", fnPtr50),
            ("__jni_get_maxUInt", "()J", fnPtr51),
            ("__jni_get_maxUInt16", "()S", fnPtr52),
            ("__jni_get_maxUInt32", "()I", fnPtr53),
            ("__jni_get_maxUInt64", "()J", fnPtr54),
            ("__jni_get_maxUInt8", "()B", fnPtr55),
            ("__jni_get_minDouble", "()D", fnPtr56),
            ("__jni_get_minFloat", "()F", fnPtr57),
            ("__jni_get_minInt", "()J", fnPtr58),
            ("__jni_get_minInt16", "()S", fnPtr59),
            ("__jni_get_minInt32", "()I", fnPtr60),
            ("__jni_get_minInt64", "()J", fnPtr61),
            ("__jni_get_minInt8", "()B", fnPtr62),
            ("__jni_get_minUInt", "()J", fnPtr63),
            ("__jni_get_minUInt16", "()S", fnPtr64),
            ("__jni_get_minUInt32", "()I", fnPtr65),
            ("__jni_get_minUInt64", "()J", fnPtr66),
            ("__jni_get_minUInt8", "()B", fnPtr67),
            ("__jni_get_trueBool", "()Z", fnPtr68),
            ("__jni_get_zeroDouble", "()D", fnPtr69),
            ("__jni_get_zeroFloat", "()F", fnPtr70),
            ("__jni_get_zeroInt", "()J", fnPtr71),
            ("__jni_get_zeroInt16", "()S", fnPtr72),
            ("__jni_get_zeroInt32", "()I", fnPtr73),
            ("__jni_get_zeroInt64", "()J", fnPtr74),
            ("__jni_get_zeroInt8", "()B", fnPtr75),
            ("__jni_get_zeroUInt", "()J", fnPtr76),
            ("__jni_get_zeroUInt16", "()S", fnPtr77),
            ("__jni_get_zeroUInt32", "()I", fnPtr78),
            ("__jni_get_zeroUInt64", "()J", fnPtr79),
            ("__jni_get_zeroUInt8", "()B", fnPtr80),
            ("__jni_maybeEchoBool", "(Ljava/lang/Boolean;)Ljava/lang/Boolean;", fnPtr81),
            ("__jni_maybeEchoDouble", "(Ljava/lang/Double;)Ljava/lang/Double;", fnPtr82),
            ("__jni_maybeEchoFloat", "(Ljava/lang/Float;)Ljava/lang/Float;", fnPtr83),
            ("__jni_maybeEchoInt", "(Ljava/lang/Long;)Ljava/lang/Long;", fnPtr84),
            ("__jni_maybeEchoInt16", "(Ljava/lang/Short;)Ljava/lang/Short;", fnPtr85),
            ("__jni_maybeEchoInt32", "(Ljava/lang/Integer;)Ljava/lang/Integer;", fnPtr86),
            ("__jni_maybeEchoInt64", "(Ljava/lang/Long;)Ljava/lang/Long;", fnPtr87),
            ("__jni_maybeEchoInt8", "(Ljava/lang/Byte;)Ljava/lang/Byte;", fnPtr88),
            ("__jni_maybeEchoUInt", "(Lkotlin/ULong;)Lkotlin/ULong;", fnPtr89),
            ("__jni_maybeEchoUInt16", "(Lkotlin/UShort;)Lkotlin/UShort;", fnPtr90),
            ("__jni_maybeEchoUInt32", "(Lkotlin/UInt;)Lkotlin/UInt;", fnPtr91),
            ("__jni_maybeEchoUInt64", "(Lkotlin/ULong;)Lkotlin/ULong;", fnPtr92),
            ("__jni_maybeEchoUInt8", "(Lkotlin/UByte;)Lkotlin/UByte;", fnPtr93),
            ("__jni_valueMapper", "(Lkotlin/UByte;Lkotlin/jvm/functions/Function1;)Lkotlin/UByte;", fnPtr94),
        ])
    }
    // print("setting up TestAPI.Ranges...")
    try TestAPI.Ranges.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Ranges_echoInt16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_Ranges_echoInt32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Ranges_echoInt64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_Ranges_echoInt8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_Ranges_echoIntRange, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_Ranges_echoUInt16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_Ranges_echoUInt32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_TestAPI_Ranges_echoUInt64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_TestAPI_Ranges_echoUInt8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_TestAPI_Ranges_echoUIntRange, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_Ranges_int16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_Ranges_int32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_Ranges_int64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_Ranges_int8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_Ranges_intRange, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_get_TestAPI_Ranges_uInt16Range, to: UnsafeMutableRawPointer.self)
        let fnPtr16 = unsafeBitCast(java_get_TestAPI_Ranges_uInt32Range, to: UnsafeMutableRawPointer.self)
        let fnPtr17 = unsafeBitCast(java_get_TestAPI_Ranges_uInt64Range, to: UnsafeMutableRawPointer.self)
        let fnPtr18 = unsafeBitCast(java_get_TestAPI_Ranges_uInt8Range, to: UnsafeMutableRawPointer.self)
        let fnPtr19 = unsafeBitCast(java_get_TestAPI_Ranges_uIntRange, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Ranges.javaClass, [
            ("__jni_echoInt16Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr0),
            ("__jni_echoInt32Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr1),
            ("__jni_echoInt64Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr2),
            ("__jni_echoInt8Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr3),
            ("__jni_echoIntRange", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr4),
            ("__jni_echoUInt16Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr5),
            ("__jni_echoUInt32Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr6),
            ("__jni_echoUInt64Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr7),
            ("__jni_echoUInt8Range", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr8),
            ("__jni_echoUIntRange", "(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr9),
            ("__jni_get_int16Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr10),
            ("__jni_get_int32Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr11),
            ("__jni_get_int64Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr12),
            ("__jni_get_int8Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr13),
            ("__jni_get_intRange", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr14),
            ("__jni_get_uInt16Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr15),
            ("__jni_get_uInt32Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr16),
            ("__jni_get_uInt64Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr17),
            ("__jni_get_uInt8Range", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr18),
            ("__jni_get_uIntRange", "()Lcom/cricut/fishyjoes/runtime/SwiftRange;", fnPtr19),
        ])
    }
    // print("setting up TestAPI.ReferenceEmptyEnum...")
    try TestAPI.ReferenceEmptyEnum.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_ReferenceEmptyEnum_aStaticMethod, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_ReferenceEmptyEnum_aStaticProperty, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_ReferenceEmptyEnum_notGoingToHappen, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.ReferenceEmptyEnum.javaClass, [
            ("__jni_aStaticMethod", "()J", fnPtr0),
            ("__jni_get_aStaticProperty", "()J", fnPtr1),
            ("__jni_notGoingToHappen", "()Lcom/cricut/testapi/ReferenceEmptyEnum;", fnPtr2),
        ])
    }
    // print("setting up TestAPI.Results...")
    try TestAPI.Results.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_Results_aFailure, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_Results_aSuccess, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_Results_processResult, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Results.javaClass, [
            ("__jni_get_aFailure", "()Lcom/cricut/fishyjoes/runtime/TypedResult;", fnPtr0),
            ("__jni_get_aSuccess", "()Lcom/cricut/fishyjoes/runtime/TypedResult;", fnPtr1),
            ("__jni_processResult", "(Lcom/cricut/fishyjoes/runtime/TypedResult;)Ljava/lang/String;", fnPtr2),
        ])
    }
    // print("setting up TestAPI.SimpleEnum...")
    try TestAPI.SimpleEnum.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_SimpleEnum_favoriteColor, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_SimpleEnum_hex, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_SimpleEnum_hexMethod, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_SimpleEnum_pickAColor, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_SimpleEnum_resetFavoriteColor, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_set_TestAPI_SimpleEnum_favoriteColor, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.SimpleEnum.javaClass, [
            ("__jni_get_favoriteColor", "()Lcom/cricut/testapi/SimpleEnum;", fnPtr0),
            ("__jni_get_hex", "()J", fnPtr1),
            ("__jni_hexMethod", "()Ljava/lang/String;", fnPtr2),
            ("__jni_pickAColor", "(J)Lcom/cricut/testapi/SimpleEnum;", fnPtr3),
            ("__jni_resetFavoriteColor", "()V", fnPtr4),
            ("__jni_set_favoriteColor", "(Lcom/cricut/testapi/SimpleEnum;)V", fnPtr5),
        ])
    }
    // print("setting up TestAPI.Strings...")
    try TestAPI.Strings.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Strings_echo, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_Strings_accent, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_Strings_chinese, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_Strings_chineseBMP, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_get_TestAPI_Strings_chineseSIP, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_get_TestAPI_Strings_emoji, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_get_TestAPI_Strings_emojiMulti, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_get_TestAPI_Strings_script, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_get_TestAPI_Strings_simple, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_TestAPI_Strings_split, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Strings.javaClass, [
            ("__jni_echo", "(Ljava/lang/String;)Ljava/lang/String;", fnPtr0),
            ("__jni_get_accent", "()Ljava/lang/String;", fnPtr1),
            ("__jni_get_chinese", "()Ljava/lang/String;", fnPtr2),
            ("__jni_get_chineseBMP", "()Ljava/lang/String;", fnPtr3),
            ("__jni_get_chineseSIP", "()Ljava/lang/String;", fnPtr4),
            ("__jni_get_emoji", "()Ljava/lang/String;", fnPtr5),
            ("__jni_get_emojiMulti", "()Ljava/lang/String;", fnPtr6),
            ("__jni_get_script", "()Ljava/lang/String;", fnPtr7),
            ("__jni_get_simple", "()Ljava/lang/String;", fnPtr8),
            ("__jni_split", "(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;", fnPtr9),
        ])
    }
    // print("setting up TestAPI.Structs...")
    try TestAPI.Structs.javaSetup(env: env)
    // print("setting up TestAPI.TestAsyncForeignSideFunctionsStruct...")
    try TestAPI.TestAsyncForeignSideFunctionsStruct.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct_witness, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_TestAPI_TestAsyncForeignSideFunctionsStruct__default_defaultExercise6, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestAsyncForeignSideFunctionsStruct.javaClass, [
            ("__jni_exercise0", "(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_exercise1", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr1),
            ("__jni_exercise2", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr2),
            ("__jni_exercise3", "(Lkotlin/jvm/functions/Function4;)Lkotlinx/coroutines/Deferred;", fnPtr3),
            ("__jni_exercise4", "(Lkotlin/jvm/functions/Function5;)Lkotlinx/coroutines/Deferred;", fnPtr4),
            ("__jni_exercise5", "(Lkotlin/jvm/functions/Function6;)Lkotlinx/coroutines/Deferred;", fnPtr5),
            ("__jni_exercise6", "(Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;", fnPtr6),
            ("__jni_thunkTwiceMaker", "(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;", fnPtr7),
            ("__jni_witness", "()Lcom/cricut/testapi/TestAsyncFunctions;", fnPtr8),
            ("__jni__default_defaultExercise6", "(Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;", fnPtr9),
        ])
    }
    // print("setting up TestAPI_CommonInterface._TestAsyncFunctionsConverter...")
    try TestAPI_CommonInterface._TestAsyncFunctionsConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter__default_defaultExercise6, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestAsyncFunctionsConverter.externalCompanionClass, [
            ("__jni__default_defaultExercise6", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;", fnPtr0),
        ])
    }
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise0, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise1, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise2, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise3, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise4, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise5, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise6, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_add3Things, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_const42, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_fifthThing, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_iabs, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_intCompose, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_makeList, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_six, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_TestAsyncFunctions_willThrow, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_thunkTwiceMaker, to: UnsafeMutableRawPointer.self)
        let fnPtr16 = unsafeBitCast(java_TestAPI_CommonInterface__TestAsyncFunctionsConverter_witness, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestAsyncFunctionsConverter.externalWitnessClass!, [
            ("__jni_exercise0", "(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_exercise1", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr1),
            ("__jni_exercise2", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr2),
            ("__jni_exercise3", "(Lkotlin/jvm/functions/Function4;)Lkotlinx/coroutines/Deferred;", fnPtr3),
            ("__jni_exercise4", "(Lkotlin/jvm/functions/Function5;)Lkotlinx/coroutines/Deferred;", fnPtr4),
            ("__jni_exercise5", "(Lkotlin/jvm/functions/Function6;)Lkotlinx/coroutines/Deferred;", fnPtr5),
            ("__jni_exercise6", "(Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;", fnPtr6),
            ("__jni_get_add3Things", "()Lkotlin/jvm/functions/Function4;", fnPtr7),
            ("__jni_get_const42", "()Lkotlin/jvm/functions/Function1;", fnPtr8),
            ("__jni_get_fifthThing", "()Lkotlin/jvm/functions/Function6;", fnPtr9),
            ("__jni_get_iabs", "()Lkotlin/jvm/functions/Function2;", fnPtr10),
            ("__jni_get_intCompose", "()Lkotlin/jvm/functions/Function2;", fnPtr11),
            ("__jni_get_makeList", "()Lkotlin/jvm/functions/Function5;", fnPtr12),
            ("__jni_get_six", "()Lkotlin/jvm/functions/Function7;", fnPtr13),
            ("__jni_get_willThrow", "()Lkotlin/jvm/functions/Function1;", fnPtr14),
            ("__jni_thunkTwiceMaker", "(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;", fnPtr15),
            ("__jni_witness", "()Lcom/cricut/testapi/TestAsyncFunctions;", fnPtr16),
        ])
    }
    // print("setting up TestAPI.TestAsyncSwiftSideFunctionsClass...")
    try TestAPI.TestAsyncSwiftSideFunctionsClass.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_init, to: UnsafeMutableRawPointer.self)
        let fnPtr16 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker, to: UnsafeMutableRawPointer.self)
        let fnPtr17 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass_witness, to: UnsafeMutableRawPointer.self)
        let fnPtr18 = unsafeBitCast(java_TestAPI_TestAsyncSwiftSideFunctionsClass__default_defaultExercise6, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestAsyncSwiftSideFunctionsClass.javaClass, [
            ("__jni_exercise0", "(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;", fnPtr0),
            ("__jni_exercise1", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr1),
            ("__jni_exercise2", "(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;", fnPtr2),
            ("__jni_exercise3", "(Lkotlin/jvm/functions/Function4;)Lkotlinx/coroutines/Deferred;", fnPtr3),
            ("__jni_exercise4", "(Lkotlin/jvm/functions/Function5;)Lkotlinx/coroutines/Deferred;", fnPtr4),
            ("__jni_exercise5", "(Lkotlin/jvm/functions/Function6;)Lkotlinx/coroutines/Deferred;", fnPtr5),
            ("__jni_exercise6", "(Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;", fnPtr6),
            ("__jni_get_add3Things", "()Lkotlin/jvm/functions/Function4;", fnPtr7),
            ("__jni_get_const42", "()Lkotlin/jvm/functions/Function1;", fnPtr8),
            ("__jni_get_fifthThing", "()Lkotlin/jvm/functions/Function6;", fnPtr9),
            ("__jni_get_iabs", "()Lkotlin/jvm/functions/Function2;", fnPtr10),
            ("__jni_get_intCompose", "()Lkotlin/jvm/functions/Function2;", fnPtr11),
            ("__jni_get_makeList", "()Lkotlin/jvm/functions/Function5;", fnPtr12),
            ("__jni_get_six", "()Lkotlin/jvm/functions/Function7;", fnPtr13),
            ("__jni_get_willThrow", "()Lkotlin/jvm/functions/Function1;", fnPtr14),
            ("__jni_init", "()Lcom/cricut/testapi/TestAsyncSwiftSideFunctionsClass;", fnPtr15),
            ("__jni_thunkTwiceMaker", "(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;", fnPtr16),
            ("__jni_witness", "()Lcom/cricut/testapi/TestAsyncFunctions;", fnPtr17),
            ("__jni__default_defaultExercise6", "(Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;", fnPtr18),
        ])
    }
    // print("setting up TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter...")
    try TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedProperties_noot, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedProperties_plutonic, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.externalCompanionClass, [
            ("__jni__default_noot", "(Lcom/cricut/testapi/TestDefaultComputedProperties;)J", fnPtr0),
            ("__jni__default_plutonic", "(Lcom/cricut/testapi/TestDefaultComputedProperties;)Ljava/lang/String;", fnPtr1),
        ])
    }
    try env.registerNatives(TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.externalWitnessClass!, [])
    // print("setting up TestAPI.TestDefaultComputedPropertiesClass...")
    try TestAPI.TestDefaultComputedPropertiesClass.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedPropertiesClass_noot, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedPropertiesClass_plutonic, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedPropertiesClass_spam, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_TestDefaultComputedPropertiesClass_init, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_set_TestAPI_TestDefaultComputedPropertiesClass_noot, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_set_TestAPI_TestDefaultComputedPropertiesClass_spam, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestDefaultComputedPropertiesClass.javaClass, [
            ("__jni_get_noot", "()J", fnPtr0),
            ("__jni_get_plutonic", "()Ljava/lang/String;", fnPtr1),
            ("__jni_get_spam", "()Z", fnPtr2),
            ("__jni_init", "(ZJ)Lcom/cricut/testapi/TestDefaultComputedPropertiesReference;", fnPtr3),
            ("__jni_set_noot", "(J)V", fnPtr4),
            ("__jni_set_spam", "(Z)V", fnPtr5),
        ])
    }
    // print("setting up TestAPI.TestDefaultComputedPropertiesEnum...")
    try TestAPI.TestDefaultComputedPropertiesEnum.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedPropertiesEnum_noot, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedPropertiesEnum_plutonic, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedPropertiesEnum_spam, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestDefaultComputedPropertiesEnum.javaClass, [
            ("__jni_get_noot", "()J", fnPtr0),
            ("__jni_get_plutonic", "()Ljava/lang/String;", fnPtr1),
            ("__jni_get_spam", "()Z", fnPtr2),
        ])
    }
    // print("setting up TestAPI.TestDefaultComputedPropertiesStruct...")
    try TestAPI.TestDefaultComputedPropertiesStruct.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestDefaultComputedPropertiesStruct_plutonic, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestDefaultComputedPropertiesStruct.javaClass, [
            ("__jni_get_plutonic", "()Ljava/lang/String;", fnPtr0),
        ])
    }
    // print("setting up TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter...")
    try TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestDifferingExportNameProtocol_tata, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter.externalWitnessClass!, [
            ("__jni_get_tata", "()J", fnPtr0),
        ])
    }
    // print("setting up TestAPI.TestDifferingExportNameStruct...")
    try TestAPI.TestDifferingExportNameStruct.javaSetup(env: env)
    // print("setting up TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter...")
    try TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.externalWitnessClass!, [
            ("__jni_get__leadingUnderscoreProp", "()Ljava/lang/String;", fnPtr0),
        ])
    }
    // print("setting up TestAPI.TestLeadingUnderscoredPropStruct...")
    try TestAPI.TestLeadingUnderscoredPropStruct.javaSetup(env: env)
    // print("setting up TestAPI_CommonInterface._TestMethodsProtocolConverter...")
    try TestAPI_CommonInterface._TestMethodsProtocolConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_CommonInterface__TestMethodsProtocolConverter_bar, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_CommonInterface__TestMethodsProtocolConverter_baz, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_CommonInterface__TestMethodsProtocolConverter_foo, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_CommonInterface__TestMethodsProtocolConverter_garply, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_CommonInterface__TestMethodsProtocolConverter_plugh, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_CommonInterface__TestMethodsProtocolConverter_xyzzy, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestMethodsProtocolConverter.externalWitnessClass!, [
            ("__jni_bar", "()Z", fnPtr0),
            ("__jni_baz", "(Z)V", fnPtr1),
            ("__jni_foo", "()V", fnPtr2),
            ("__jni_garply", "(Ljava/lang/String;)Ljava/lang/String;", fnPtr3),
            ("__jni_plugh", "(Lkotlin/Triple;)Lkotlin/Triple;", fnPtr4),
            ("__jni_xyzzy", "(JLjava/util/List;)Ljava/lang/String;", fnPtr5),
        ])
    }
    // print("setting up TestAPI.TestNonExportedProtocolEnum...")
    try TestAPI.TestNonExportedProtocolEnum.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestNonExportedProtocolEnum_fuga, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_TestNonExportedProtocolEnum_hoge, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestNonExportedProtocolEnum.javaClass, [
            ("__jni_get_fuga", "()D", fnPtr0),
            ("__jni_hoge", "()D", fnPtr1),
        ])
    }
    // print("setting up TestAPI_CommonInterface._TestOptionalsProtocolConverter...")
    try TestAPI_CommonInterface._TestOptionalsProtocolConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestOptionalsProtocol_flarp, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_CommonInterface__TestOptionalsProtocolConverter_spqr, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_CommonInterface__TestOptionalsProtocolConverter_wombat, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestOptionalsProtocolConverter.externalWitnessClass!, [
            ("__jni_get_flarp", "()Ljava/lang/String;", fnPtr0),
            ("__jni_spqr", "(Lcom/cricut/testapi/AssociatedDataEnum;)J", fnPtr1),
            ("__jni_wombat", "(Ljava/lang/Long;)Ljava/lang/Double;", fnPtr2),
        ])
    }
    // print("setting up TestAPI_CommonInterface._TestPropertiesProtocolConverter...")
    try TestAPI_CommonInterface._TestPropertiesProtocolConverter.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_get_TestAPI_TestPropertiesProtocol_corge, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_TestPropertiesProtocol_frobby, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI_CommonInterface._TestPropertiesProtocolConverter.externalWitnessClass!, [
            ("__jni_get_corge", "()Ljava/lang/String;", fnPtr0),
            ("__jni_get_frobby", "()Ljava/util/List;", fnPtr1),
        ])
    }
    // print("setting up TestAPI.TestProtocolClass...")
    try TestAPI.TestProtocolClass.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_TestProtocolClass_bar, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_TestProtocolClass_baz, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_TestProtocolClass_foo, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_TestProtocolClass_garply, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_get_TestAPI_TestProtocolClass_corge, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_get_TestAPI_TestProtocolClass_flarp, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_get_TestAPI_TestProtocolClass_frobby, to: UnsafeMutableRawPointer.self)
        let fnPtr7 = unsafeBitCast(TestAPI.TestProtocolClass._javaHash, to: UnsafeMutableRawPointer.self)
        let fnPtr8 = unsafeBitCast(java_TestAPI_TestProtocolClass_init, to: UnsafeMutableRawPointer.self)
        let fnPtr9 = unsafeBitCast(java_TestAPI_TestProtocolClass_plugh, to: UnsafeMutableRawPointer.self)
        let fnPtr10 = unsafeBitCast(java_set_TestAPI_TestProtocolClass_corge, to: UnsafeMutableRawPointer.self)
        let fnPtr11 = unsafeBitCast(java_set_TestAPI_TestProtocolClass_flarp, to: UnsafeMutableRawPointer.self)
        let fnPtr12 = unsafeBitCast(java_TestAPI_TestProtocolClass_spqr, to: UnsafeMutableRawPointer.self)
        let fnPtr13 = unsafeBitCast(TestAPI.TestProtocolClass._javaEquals, to: UnsafeMutableRawPointer.self)
        let fnPtr14 = unsafeBitCast(java_TestAPI_TestProtocolClass_wombat, to: UnsafeMutableRawPointer.self)
        let fnPtr15 = unsafeBitCast(java_TestAPI_TestProtocolClass_xyzzy, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestProtocolClass.javaClass, [
            ("__jni_bar", "()Z", fnPtr0),
            ("__jni_baz", "(Z)V", fnPtr1),
            ("__jni_foo", "()V", fnPtr2),
            ("__jni_garply", "(Ljava/lang/String;)Ljava/lang/String;", fnPtr3),
            ("__jni_get_corge", "()Ljava/lang/String;", fnPtr4),
            ("__jni_get_flarp", "()Ljava/lang/String;", fnPtr5),
            ("__jni_get_frobby", "()Ljava/util/List;", fnPtr6),
            ("__jni_hashCode", "()I", fnPtr7),
            ("__jni_init", "(Ljava/lang/String;Ljava/lang/String;)Lcom/cricut/testapi/TestProtocolClass;", fnPtr8),
            ("__jni_plugh", "(Lkotlin/Triple;)Lkotlin/Triple;", fnPtr9),
            ("__jni_set_corge", "(Ljava/lang/String;)V", fnPtr10),
            ("__jni_set_flarp", "(Ljava/lang/String;)V", fnPtr11),
            ("__jni_spqr", "(Lcom/cricut/testapi/AssociatedDataEnum;)J", fnPtr12),
            ("__jni_swiftEquals", "(Lcom/cricut/testapi/TestProtocolClass;Lcom/cricut/testapi/TestProtocolClass;)Z", fnPtr13),
            ("__jni_wombat", "(Ljava/lang/Long;)Ljava/lang/Double;", fnPtr14),
            ("__jni_xyzzy", "(JLjava/util/List;)Ljava/lang/String;", fnPtr15),
        ])
    }
    // print("setting up TestAPI.TestProtocolEnum...")
    try TestAPI.TestProtocolEnum.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_TestProtocolEnum_bar, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_TestProtocolEnum_baz, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_TestProtocolEnum_foo, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_TestProtocolEnum_garply, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_TestAPI_TestProtocolEnum_plugh, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_TestProtocolEnum_xyzzy, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestProtocolEnum.javaClass, [
            ("__jni_bar", "()Z", fnPtr0),
            ("__jni_baz", "(Z)V", fnPtr1),
            ("__jni_foo", "()V", fnPtr2),
            ("__jni_garply", "(Ljava/lang/String;)Ljava/lang/String;", fnPtr3),
            ("__jni_plugh", "(Lkotlin/Triple;)Lkotlin/Triple;", fnPtr4),
            ("__jni_xyzzy", "(JLjava/util/List;)Ljava/lang/String;", fnPtr5),
        ])
    }
    // print("setting up TestAPI.TestProtocolStruct...")
    try TestAPI.TestProtocolStruct.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_TestProtocolStruct_bar, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_TestAPI_TestProtocolStruct_baz, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_TestAPI_TestProtocolStruct_foo, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_TestAPI_TestProtocolStruct_garply, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_get_TestAPI_TestProtocolStruct_frobby, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_TestAPI_TestProtocolStruct_plugh, to: UnsafeMutableRawPointer.self)
        let fnPtr6 = unsafeBitCast(java_TestAPI_TestProtocolStruct_xyzzy, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.TestProtocolStruct.javaClass, [
            ("__jni_bar", "()Z", fnPtr0),
            ("__jni_baz", "(Z)V", fnPtr1),
            ("__jni_foo", "()V", fnPtr2),
            ("__jni_garply", "(Ljava/lang/String;)Ljava/lang/String;", fnPtr3),
            ("__jni_get_frobby", "()Ljava/util/List;", fnPtr4),
            ("__jni_plugh", "(Lkotlin/Triple;)Lkotlin/Triple;", fnPtr5),
            ("__jni_xyzzy", "(JLjava/util/List;)Ljava/lang/String;", fnPtr6),
        ])
    }
    // print("setting up TestAPI.Tuples...")
    try TestAPI.Tuples.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_Tuples_checkTuples, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_Tuples_tuple2, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_Tuples_tuple3, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_Tuples_tuple4, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_get_TestAPI_Tuples_tuple5, to: UnsafeMutableRawPointer.self)
        let fnPtr5 = unsafeBitCast(java_get_TestAPI_Tuples_tuple6, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.Tuples.javaClass, [
            ("__jni_checkTuples", "(Lkotlin/Pair;Lkotlin/Triple;Lcom/cricut/fishyjoes/runtime/Tuple4;Lcom/cricut/fishyjoes/runtime/Tuple5;Lcom/cricut/fishyjoes/runtime/Tuple6;)Z", fnPtr0),
            ("__jni_get_tuple2", "()Lkotlin/Pair;", fnPtr1),
            ("__jni_get_tuple3", "()Lkotlin/Triple;", fnPtr2),
            ("__jni_get_tuple4", "()Lcom/cricut/fishyjoes/runtime/Tuple4;", fnPtr3),
            ("__jni_get_tuple5", "()Lcom/cricut/fishyjoes/runtime/Tuple5;", fnPtr4),
            ("__jni_get_tuple6", "()Lcom/cricut/fishyjoes/runtime/Tuple6;", fnPtr5),
        ])
    }
    // print("setting up TestAPI.URLs...")
    try TestAPI.URLs.javaSetup(env: env)
    do {
        let fnPtr0 = unsafeBitCast(java_TestAPI_URLs_echo, to: UnsafeMutableRawPointer.self)
        let fnPtr1 = unsafeBitCast(java_get_TestAPI_URLs_dataImage, to: UnsafeMutableRawPointer.self)
        let fnPtr2 = unsafeBitCast(java_get_TestAPI_URLs_localFile, to: UnsafeMutableRawPointer.self)
        let fnPtr3 = unsafeBitCast(java_get_TestAPI_URLs_remoteFile, to: UnsafeMutableRawPointer.self)
        let fnPtr4 = unsafeBitCast(java_get_TestAPI_URLs_simple, to: UnsafeMutableRawPointer.self)
        try env.registerNatives(TestAPI.URLs.javaClass, [
            ("__jni_echo", "(Ljava/net/URI;)Ljava/net/URI;", fnPtr0),
            ("__jni_get_dataImage", "()Ljava/net/URI;", fnPtr1),
            ("__jni_get_localFile", "()Ljava/net/URI;", fnPtr2),
            ("__jni_get_remoteFile", "()Ljava/net/URI;", fnPtr3),
            ("__jni_get_simple", "()Ljava/net/URI;", fnPtr4),
        ])
    }
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
}

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("JNI_OnLoad")
public func jniOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    let result = FishyJoesJavaRuntime.callbackBody(env!) { (env) -> jint? in
        try jniTypeSetup(env: env)
        return JNI_VERSION_1_4
    }
    return result ?? JNI_VERSION_1_4
}
