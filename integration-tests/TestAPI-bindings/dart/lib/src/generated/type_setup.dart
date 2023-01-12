import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as package_ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;
import 'package:dart_runtime/runtime.dart';
import 'package:dart_runtime/utilities.dart' as utils;

final ensureLoaded = (() {
    final libraryPath = path.join(Directory.current.path, 'native', 'libTestAPI-iota.dylib');
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    final arena = package_ffi.Arena();

    dylib.lookupFunction<ffi.Void Function(), void Function()>('FishyJoes_TestAPI_registerTypes')();

    Loader.shared.once("setup_Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>", () {
        print("setting up ((Int) -> Int, (Int) -> Int) -> (Int) -> Int...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function2Converter_setup(
                "Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>", () {
        print("setting up ((Int, String), (String, Double, String), String, Bool)...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple4Converter_setup(
                "Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<Int>", () {
        print("setting up () -> Int...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function0Converter_setup(
                "Function0Converter<Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function3Converter<Float, Double, Int, Double>", () {
        print("setting up (Float, Double, Int) -> Double...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function3Converter_setup(
                "Function3Converter<Float, Double, Int, Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<Int, Int>", () {
        print("setting up (Int) -> Int...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function1Converter_setup(
                "Function1Converter<Int, Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple2Converter<Int, Swift.String>", () {
        print("setting up (Int, String)...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple2Converter_setup(
                "Tuple2Converter<Int, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>", () {
        print("setting up (Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function1Converter_setup(
                "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>", () {
        print("setting up (Optional<UInt8>) -> Optional<UInt8>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function1Converter_setup(
                "Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple3Converter<Swift.String, Double, Swift.String>", () {
        print("setting up (String, Double, String)...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple3Converter_setup(
                "Tuple3Converter<Swift.String, Double, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>", () {
        print("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple6Converter_setup(
                "Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>", () {
        print("setting up (String, Int, Double, String, () -> Int) -> () -> Int...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function5Converter_setup(
                "Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>", () {
        print("setting up (String, Int, Double, String, () -> Int, Int) -> Int...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function6Converter_setup(
                "Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () {
        print("setting up (String, String, String, String) -> Array<String>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function4Converter_setup(
                "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>", () {
        print("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple5Converter_setup(
                "Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Bool>", () {
        print("setting up Array<Bool>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Double>", () {
        print("setting up Array<Double>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Float>", () {
        print("setting up Array<Float>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Float>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int16>", () {
        print("setting up Array<Int16>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Int16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int32>", () {
        print("setting up Array<Int32>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Int32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int64>", () {
        print("setting up Array<Int64>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Int64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int8>", () {
        print("setting up Array<Int8>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Int8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int>", () {
        print("setting up Array<Int>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Bool>>", () {
        print("setting up Array<Optional<Bool>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Bool>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Double>>", () {
        print("setting up Array<Optional<Double>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Double>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Float>>", () {
        print("setting up Array<Optional<Float>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Float>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int16>>", () {
        print("setting up Array<Optional<Int16>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Int16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int32>>", () {
        print("setting up Array<Optional<Int32>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Int32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int64>>", () {
        print("setting up Array<Optional<Int64>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Int64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int8>>", () {
        print("setting up Array<Optional<Int8>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Int8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int>>", () {
        print("setting up Array<Optional<Int>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt16>>", () {
        print("setting up Array<Optional<UInt16>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<UInt16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt32>>", () {
        print("setting up Array<Optional<UInt32>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<UInt32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt64>>", () {
        print("setting up Array<Optional<UInt64>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<UInt64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt8>>", () {
        print("setting up Array<Optional<UInt8>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<OptionalConverter<UInt8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.String>", () {
        print("setting up Array<String>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt16>", () {
        print("setting up Array<UInt16>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<UInt16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt32>", () {
        print("setting up Array<UInt32>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<UInt32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt64>", () {
        print("setting up Array<UInt64>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<UInt64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt8>", () {
        print("setting up Array<UInt8>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup(
                "ArrayConverter<UInt8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_AssociatedDataEnum", () {
        print("setting up AssociatedDataEnum...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_AssociatedDataEnum_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Bytes", () {
        print("setting up Bytes...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Bytes_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Collections", () {
        print("setting up Collections...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Collections_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Collections.CollectionHolder", () {
        print("setting up Collections.CollectionHolder...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Collections_CollectionHolder_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_DefaultArguments", () {
        print("setting up DefaultArguments...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_DefaultArguments_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Deprecations", () {
        print("setting up Deprecations...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Deprecations_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Bool, Bool>", () {
        print("setting up Dictionary<Bool, Bool>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                "DictionaryConverter<Bool, Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Int, Int>", () {
        print("setting up Dictionary<Int, Int>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                "DictionaryConverter<Int, Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Int, OptionalConverter<Int>>", () {
        print("setting up Dictionary<Int, Optional<Int>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                "DictionaryConverter<Int, OptionalConverter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.String, Swift.String>", () {
        print("setting up Dictionary<String, String>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                "DictionaryConverter<Swift.String, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_EmptyEnum", () {
        print("setting up EmptyEnum...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_EmptyEnum_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Functions", () {
        print("setting up Functions...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Functions_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Functions.TheError", () {
        print("setting up Functions.TheError...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Functions_TheError_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<Int>>", () {
        print("setting up Optional<Array<Int>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<OptionalConverter<Int>>>", () {
        print("setting up Optional<Array<Optional<Int>>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Bool>", () {
        print("setting up Optional<Bool>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Int, Int>>", () {
        print("setting up Optional<Dictionary<Int, Int>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Int, OptionalConverter<Int>>>", () {
        print("setting up Optional<Dictionary<Int, Optional<Int>>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Double>", () {
        print("setting up Optional<Double>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Float>", () {
        print("setting up Optional<Float>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int16>", () {
        print("setting up Optional<Int16>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int32>", () {
        print("setting up Optional<Int32>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int64>", () {
        print("setting up Optional<Int64>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int8>", () {
        print("setting up Optional<Int8>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int>", () {
        print("setting up Optional<Int>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<Int>>", () {
        print("setting up Optional<Set<Int>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<OptionalConverter<Int>>>", () {
        print("setting up Optional<Set<Optional<Int>>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SimpleEnum>", () {
        print("setting up Optional<SimpleEnum>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt16>", () {
        print("setting up Optional<UInt16>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt32>", () {
        print("setting up Optional<UInt32>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt64>", () {
        print("setting up Optional<UInt64>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt8>", () {
        print("setting up Optional<UInt8>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Primitives", () {
        print("setting up Primitives...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Primitives_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Primitives.PrimitiveHolder", () {
        print("setting up Primitives.PrimitiveHolder...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Primitives_PrimitiveHolder_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Bool>", () {
        print("setting up Set<Bool>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                "SetConverter<Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Int>", () {
        print("setting up Set<Int>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                "SetConverter<Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<OptionalConverter<Int>>", () {
        print("setting up Set<Optional<Int>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                "SetConverter<OptionalConverter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.String>", () {
        print("setting up Set<String>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                "SetConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SimpleEnum", () {
        print("setting up SimpleEnum...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_SimpleEnum_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Strings", () {
        print("setting up Strings...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Strings_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs", () {
        print("setting up Structs...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Structs_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs.MemberwiseStruct", () {
        print("setting up Structs.MemberwiseStruct...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Structs_MemberwiseStruct_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs.ReferenceStruct", () {
        print("setting up Structs.ReferenceStruct...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Structs_ReferenceStruct_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuples", () {
        print("setting up Tuples...");
        utils.check<void>((exn) {
            Loader.shared.TestAPI_Tuples_setup(
                exn
            );
        });
    });

    arena.releaseAll();
})();
