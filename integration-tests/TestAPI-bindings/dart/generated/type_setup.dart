using static Cricut.FishyJoesRuntime.Loader;

namespace Cricut.TestAPI {
    public class _TypeSetup {
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoes_TestAPI_registerTypes();

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_AssociatedDataEnum_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Bytes_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Collections_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Collections_CollectionHolder_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_DefaultArguments_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Deprecations_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyEnum_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Functions_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Functions_TheError_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Primitives_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Primitives_PrimitiveHolder_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_SimpleEnum_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Strings_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_MemberwiseStruct_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_ReferenceStruct_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Tuples_setup(
            out CreatedRef _exn
        );

        public static void _ensureLoaded() {}

        static _TypeSetup() {
            // There's no explicit way to call the static constructor, so do this instead
            FishyJoesRuntime.Loader.ensureLoaded();
            FishyJoes_TestAPI_registerTypes();

            Once("setup_Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>", () => {
                Console.WriteLine("setting up ((Int) -> Int, (Int) -> Int) -> (Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function2Converter_setup(
                    out exn
                ));
            });
            Once("setup_Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>", () => {
                Console.WriteLine("setting up ((Int, String), (String, Double, String), String, Bool)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple4Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function0Converter<Int>", () => {
                Console.WriteLine("setting up () -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function0Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function3Converter<Float, Double, Int, Double>", () => {
                Console.WriteLine("setting up (Float, Double, Int) -> Double...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function3Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function1Converter<Int, Int>", () => {
                Console.WriteLine("setting up (Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup(
                    out exn
                ));
            });
            Once("setup_Tuple2Converter<Int, Swift.String>", () => {
                Console.WriteLine("setting up (Int, String)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple2Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>", () => {
                Console.WriteLine("setting up (Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>", () => {
                Console.WriteLine("setting up (Optional<UInt8>) -> Optional<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup(
                    out exn
                ));
            });
            Once("setup_Tuple3Converter<Swift.String, Double, Swift.String>", () => {
                Console.WriteLine("setting up (String, Double, String)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple3Converter_setup(
                    out exn
                ));
            });
            Once("setup_Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>", () => {
                Console.WriteLine("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple6Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int) -> () -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function5Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int, Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function6Converter_setup(
                    out exn
                ));
            });
            Once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (String, String, String, String) -> Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function4Converter_setup(
                    out exn
                ));
            });
            Once("setup_Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>", () => {
                Console.WriteLine("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple5Converter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Bool>", () => {
                Console.WriteLine("setting up Array<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Double>", () => {
                Console.WriteLine("setting up Array<Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Float>", () => {
                Console.WriteLine("setting up Array<Float>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int16>", () => {
                Console.WriteLine("setting up Array<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int32>", () => {
                Console.WriteLine("setting up Array<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int64>", () => {
                Console.WriteLine("setting up Array<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int8>", () => {
                Console.WriteLine("setting up Array<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int>", () => {
                Console.WriteLine("setting up Array<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Bool>>", () => {
                Console.WriteLine("setting up Array<Optional<Bool>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Double>>", () => {
                Console.WriteLine("setting up Array<Optional<Double>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Float>>", () => {
                Console.WriteLine("setting up Array<Optional<Float>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int16>>", () => {
                Console.WriteLine("setting up Array<Optional<Int16>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int32>>", () => {
                Console.WriteLine("setting up Array<Optional<Int32>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int64>>", () => {
                Console.WriteLine("setting up Array<Optional<Int64>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int8>>", () => {
                Console.WriteLine("setting up Array<Optional<Int8>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int>>", () => {
                Console.WriteLine("setting up Array<Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt16>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt16>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt32>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt32>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt64>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt64>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt8>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt8>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.String>", () => {
                Console.WriteLine("setting up Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt16>", () => {
                Console.WriteLine("setting up Array<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt32>", () => {
                Console.WriteLine("setting up Array<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt64>", () => {
                Console.WriteLine("setting up Array<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt8>", () => {
                Console.WriteLine("setting up Array<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup(
                    out exn
                ));
            });
            Once("setup_AssociatedDataEnum", () => {
                Console.WriteLine("setting up AssociatedDataEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_AssociatedDataEnum_setup(
                    out exn
                ));
            });
            Once("setup_Bytes", () => {
                Console.WriteLine("setting up Bytes...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Bytes_setup(
                    out exn
                ));
            });
            Once("setup_Collections", () => {
                Console.WriteLine("setting up Collections...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Collections_setup(
                    out exn
                ));
            });
            Once("setup_Collections.CollectionHolder", () => {
                Console.WriteLine("setting up Collections.CollectionHolder...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Collections_CollectionHolder_setup(
                    out exn
                ));
            });
            Once("setup_DefaultArguments", () => {
                Console.WriteLine("setting up DefaultArguments...");
                Utilities.Check((out CreatedRef exn) => TestAPI_DefaultArguments_setup(
                    out exn
                ));
            });
            Once("setup_Deprecations", () => {
                Console.WriteLine("setting up Deprecations...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Deprecations_setup(
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Bool, Bool>", () => {
                Console.WriteLine("setting up Dictionary<Bool, Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup(
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Int, Int>", () => {
                Console.WriteLine("setting up Dictionary<Int, Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup(
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Int, OptionalConverter<Int>>", () => {
                Console.WriteLine("setting up Dictionary<Int, Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup(
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Swift.String, Swift.String>", () => {
                Console.WriteLine("setting up Dictionary<String, String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup(
                    out exn
                ));
            });
            Once("setup_EmptyEnum", () => {
                Console.WriteLine("setting up EmptyEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_EmptyEnum_setup(
                    out exn
                ));
            });
            Once("setup_Functions", () => {
                Console.WriteLine("setting up Functions...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Functions_setup(
                    out exn
                ));
            });
            Once("setup_Functions.TheError", () => {
                Console.WriteLine("setting up Functions.TheError...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Functions_TheError_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<ArrayConverter<Int>>", () => {
                Console.WriteLine("setting up Optional<Array<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<ArrayConverter<OptionalConverter<Int>>>", () => {
                Console.WriteLine("setting up Optional<Array<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Bool>", () => {
                Console.WriteLine("setting up Optional<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<DictionaryConverter<Int, Int>>", () => {
                Console.WriteLine("setting up Optional<Dictionary<Int, Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<DictionaryConverter<Int, OptionalConverter<Int>>>", () => {
                Console.WriteLine("setting up Optional<Dictionary<Int, Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Double>", () => {
                Console.WriteLine("setting up Optional<Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Float>", () => {
                Console.WriteLine("setting up Optional<Float>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Int16>", () => {
                Console.WriteLine("setting up Optional<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Int32>", () => {
                Console.WriteLine("setting up Optional<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Int64>", () => {
                Console.WriteLine("setting up Optional<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Int8>", () => {
                Console.WriteLine("setting up Optional<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Int>", () => {
                Console.WriteLine("setting up Optional<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<SetConverter<Int>>", () => {
                Console.WriteLine("setting up Optional<Set<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<SetConverter<OptionalConverter<Int>>>", () => {
                Console.WriteLine("setting up Optional<Set<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<SimpleEnum>", () => {
                Console.WriteLine("setting up Optional<SimpleEnum>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<UInt16>", () => {
                Console.WriteLine("setting up Optional<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<UInt32>", () => {
                Console.WriteLine("setting up Optional<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<UInt64>", () => {
                Console.WriteLine("setting up Optional<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_OptionalConverter<UInt8>", () => {
                Console.WriteLine("setting up Optional<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_Primitives", () => {
                Console.WriteLine("setting up Primitives...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Primitives_setup(
                    out exn
                ));
            });
            Once("setup_Primitives.PrimitiveHolder", () => {
                Console.WriteLine("setting up Primitives.PrimitiveHolder...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Primitives_PrimitiveHolder_setup(
                    out exn
                ));
            });
            Once("setup_SetConverter<Bool>", () => {
                Console.WriteLine("setting up Set<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup(
                    out exn
                ));
            });
            Once("setup_SetConverter<Int>", () => {
                Console.WriteLine("setting up Set<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup(
                    out exn
                ));
            });
            Once("setup_SetConverter<OptionalConverter<Int>>", () => {
                Console.WriteLine("setting up Set<Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup(
                    out exn
                ));
            });
            Once("setup_SetConverter<Swift.String>", () => {
                Console.WriteLine("setting up Set<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup(
                    out exn
                ));
            });
            Once("setup_SimpleEnum", () => {
                Console.WriteLine("setting up SimpleEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_SimpleEnum_setup(
                    out exn
                ));
            });
            Once("setup_Strings", () => {
                Console.WriteLine("setting up Strings...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Strings_setup(
                    out exn
                ));
            });
            Once("setup_Structs", () => {
                Console.WriteLine("setting up Structs...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_setup(
                    out exn
                ));
            });
            Once("setup_Structs.MemberwiseStruct", () => {
                Console.WriteLine("setting up Structs.MemberwiseStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_MemberwiseStruct_setup(
                    out exn
                ));
            });
            Once("setup_Structs.ReferenceStruct", () => {
                Console.WriteLine("setting up Structs.ReferenceStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_ReferenceStruct_setup(
                    out exn
                ));
            });
            Once("setup_Tuples", () => {
                Console.WriteLine("setting up Tuples...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Tuples_setup(
                    out exn
                ));
            });
        }
    }
}
