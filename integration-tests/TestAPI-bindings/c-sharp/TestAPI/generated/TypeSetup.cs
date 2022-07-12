using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

using static Cricut.FishyJoesRuntime.Loader;

namespace Cricut.TestAPI {
    public class _TypeSetup {
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoes_TestAPI_registerTypes();

        delegate IntPtr Cricut_TestAPI_AssociatedDataEnum_new_thing(
            nint value,
            out IntPtr _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_thing(
            IntPtr obj,
            ref nint value,
            out IntPtr _exn
        );
        delegate IntPtr Cricut_TestAPI_AssociatedDataEnum_new_other(
            IntPtr unnamed,
            nint _1,
            out IntPtr _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_other(
            IntPtr obj,
            ref IntPtr unnamed,
            ref nint _1,
            out IntPtr _exn
        );
        delegate IntPtr Cricut_TestAPI_AssociatedDataEnum_new_bar(
            IntPtr named,
            IntPtr _1,
            out IntPtr _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_bar(
            IntPtr obj,
            ref IntPtr named,
            ref IntPtr _1,
            out IntPtr _exn
        );
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_AssociatedDataEnum_setup(
            FishyJoesRuntime.EnumDiscriminator discriminator,
            Cricut_TestAPI_AssociatedDataEnum_new_thing thing_constructor,
            Cricut_TestAPI_AssociatedDataEnum_extract_thing thing_extractor,
            Cricut_TestAPI_AssociatedDataEnum_new_other other_constructor,
            Cricut_TestAPI_AssociatedDataEnum_extract_other other_extractor,
            Cricut_TestAPI_AssociatedDataEnum_new_bar bar_constructor,
            Cricut_TestAPI_AssociatedDataEnum_extract_bar bar_extractor,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Bytes_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Collections_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        delegate IntPtr _Collections_CollectionHolderConstructor(
            IntPtr boolArray,
            IntPtr boolSet,
            IntPtr boolDictionary,
            IntPtr integerArray,
            IntPtr integerSet,
            IntPtr integerDictionary,
            IntPtr stringArray,
            IntPtr stringSet,
            IntPtr stringDictionary,
            out IntPtr exn
        );
        delegate IntPtr _Collections_CollectionHolder_boolArrayGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_boolArraySetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_boolSetGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_boolSetSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_boolDictionaryGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_boolDictionarySetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_integerArrayGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_integerArraySetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_integerSetGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_integerSetSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_integerDictionaryGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_integerDictionarySetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_stringArrayGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_stringArraySetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_stringSetGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_stringSetSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Collections_CollectionHolder_stringDictionaryGetter(IntPtr obj, out IntPtr exn);
        delegate void _Collections_CollectionHolder_stringDictionarySetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Collections_CollectionHolder_setup(
            _Collections_CollectionHolderConstructor constructor,
            _Collections_CollectionHolder_boolArrayGetter get_boolArray,
            _Collections_CollectionHolder_boolArraySetter set_boolArray,
            _Collections_CollectionHolder_boolSetGetter get_boolSet,
            _Collections_CollectionHolder_boolSetSetter set_boolSet,
            _Collections_CollectionHolder_boolDictionaryGetter get_boolDictionary,
            _Collections_CollectionHolder_boolDictionarySetter set_boolDictionary,
            _Collections_CollectionHolder_integerArrayGetter get_integerArray,
            _Collections_CollectionHolder_integerArraySetter set_integerArray,
            _Collections_CollectionHolder_integerSetGetter get_integerSet,
            _Collections_CollectionHolder_integerSetSetter set_integerSet,
            _Collections_CollectionHolder_integerDictionaryGetter get_integerDictionary,
            _Collections_CollectionHolder_integerDictionarySetter set_integerDictionary,
            _Collections_CollectionHolder_stringArrayGetter get_stringArray,
            _Collections_CollectionHolder_stringArraySetter set_stringArray,
            _Collections_CollectionHolder_stringSetGetter get_stringSet,
            _Collections_CollectionHolder_stringSetSetter set_stringSet,
            _Collections_CollectionHolder_stringDictionaryGetter get_stringDictionary,
            _Collections_CollectionHolder_stringDictionarySetter set_stringDictionary,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyEnum_setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Functions_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Functions_TheError_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Primitives_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        delegate IntPtr _Primitives_PrimitiveHolderConstructor(
            bool b,
            IntPtr bq,
            byte ui8,
            IntPtr ui8q,
            ushort ui16,
            IntPtr ui16q,
            uint ui32,
            IntPtr ui32q,
            ulong ui64,
            IntPtr ui64q,
            sbyte i8,
            IntPtr i8q,
            short i16,
            IntPtr i16q,
            int i32,
            IntPtr i32q,
            long i64,
            IntPtr i64q,
            float f,
            IntPtr fq,
            double d,
            IntPtr dq,
            out IntPtr exn
        );
        delegate bool _Primitives_PrimitiveHolder_bGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_bSetter(IntPtr obj, bool newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_bqGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_bqSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate byte _Primitives_PrimitiveHolder_ui8Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui8Setter(IntPtr obj, byte newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_ui8qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui8qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate ushort _Primitives_PrimitiveHolder_ui16Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui16Setter(IntPtr obj, ushort newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_ui16qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui16qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate uint _Primitives_PrimitiveHolder_ui32Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui32Setter(IntPtr obj, uint newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_ui32qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui32qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate ulong _Primitives_PrimitiveHolder_ui64Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui64Setter(IntPtr obj, ulong newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_ui64qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_ui64qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate sbyte _Primitives_PrimitiveHolder_i8Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i8Setter(IntPtr obj, sbyte newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_i8qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i8qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate short _Primitives_PrimitiveHolder_i16Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i16Setter(IntPtr obj, short newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_i16qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i16qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate int _Primitives_PrimitiveHolder_i32Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i32Setter(IntPtr obj, int newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_i32qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i32qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate long _Primitives_PrimitiveHolder_i64Getter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i64Setter(IntPtr obj, long newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_i64qGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_i64qSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate float _Primitives_PrimitiveHolder_fGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_fSetter(IntPtr obj, float newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_fqGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_fqSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate double _Primitives_PrimitiveHolder_dGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_dSetter(IntPtr obj, double newValue, out IntPtr exn);
        delegate IntPtr _Primitives_PrimitiveHolder_dqGetter(IntPtr obj, out IntPtr exn);
        delegate void _Primitives_PrimitiveHolder_dqSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Primitives_PrimitiveHolder_setup(
            _Primitives_PrimitiveHolderConstructor constructor,
            _Primitives_PrimitiveHolder_bGetter get_b,
            _Primitives_PrimitiveHolder_bSetter set_b,
            _Primitives_PrimitiveHolder_bqGetter get_bq,
            _Primitives_PrimitiveHolder_bqSetter set_bq,
            _Primitives_PrimitiveHolder_ui8Getter get_ui8,
            _Primitives_PrimitiveHolder_ui8Setter set_ui8,
            _Primitives_PrimitiveHolder_ui8qGetter get_ui8q,
            _Primitives_PrimitiveHolder_ui8qSetter set_ui8q,
            _Primitives_PrimitiveHolder_ui16Getter get_ui16,
            _Primitives_PrimitiveHolder_ui16Setter set_ui16,
            _Primitives_PrimitiveHolder_ui16qGetter get_ui16q,
            _Primitives_PrimitiveHolder_ui16qSetter set_ui16q,
            _Primitives_PrimitiveHolder_ui32Getter get_ui32,
            _Primitives_PrimitiveHolder_ui32Setter set_ui32,
            _Primitives_PrimitiveHolder_ui32qGetter get_ui32q,
            _Primitives_PrimitiveHolder_ui32qSetter set_ui32q,
            _Primitives_PrimitiveHolder_ui64Getter get_ui64,
            _Primitives_PrimitiveHolder_ui64Setter set_ui64,
            _Primitives_PrimitiveHolder_ui64qGetter get_ui64q,
            _Primitives_PrimitiveHolder_ui64qSetter set_ui64q,
            _Primitives_PrimitiveHolder_i8Getter get_i8,
            _Primitives_PrimitiveHolder_i8Setter set_i8,
            _Primitives_PrimitiveHolder_i8qGetter get_i8q,
            _Primitives_PrimitiveHolder_i8qSetter set_i8q,
            _Primitives_PrimitiveHolder_i16Getter get_i16,
            _Primitives_PrimitiveHolder_i16Setter set_i16,
            _Primitives_PrimitiveHolder_i16qGetter get_i16q,
            _Primitives_PrimitiveHolder_i16qSetter set_i16q,
            _Primitives_PrimitiveHolder_i32Getter get_i32,
            _Primitives_PrimitiveHolder_i32Setter set_i32,
            _Primitives_PrimitiveHolder_i32qGetter get_i32q,
            _Primitives_PrimitiveHolder_i32qSetter set_i32q,
            _Primitives_PrimitiveHolder_i64Getter get_i64,
            _Primitives_PrimitiveHolder_i64Setter set_i64,
            _Primitives_PrimitiveHolder_i64qGetter get_i64q,
            _Primitives_PrimitiveHolder_i64qSetter set_i64q,
            _Primitives_PrimitiveHolder_fGetter get_f,
            _Primitives_PrimitiveHolder_fSetter set_f,
            _Primitives_PrimitiveHolder_fqGetter get_fq,
            _Primitives_PrimitiveHolder_fqSetter set_fq,
            _Primitives_PrimitiveHolder_dGetter get_d,
            _Primitives_PrimitiveHolder_dSetter set_d,
            _Primitives_PrimitiveHolder_dqGetter get_dq,
            _Primitives_PrimitiveHolder_dqSetter set_dq,
            out IntPtr _exn
        );

        delegate IntPtr Cricut_TestAPI_SimpleEnum_new_red(
            out IntPtr _exn
        );
        unsafe delegate void Cricut_TestAPI_SimpleEnum_extract_red(
            IntPtr obj,
            out IntPtr _exn
        );
        delegate IntPtr Cricut_TestAPI_SimpleEnum_new_green(
            out IntPtr _exn
        );
        unsafe delegate void Cricut_TestAPI_SimpleEnum_extract_green(
            IntPtr obj,
            out IntPtr _exn
        );
        delegate IntPtr Cricut_TestAPI_SimpleEnum_new_blue(
            out IntPtr _exn
        );
        unsafe delegate void Cricut_TestAPI_SimpleEnum_extract_blue(
            IntPtr obj,
            out IntPtr _exn
        );
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_SimpleEnum_setup(
            FishyJoesRuntime.EnumDiscriminator discriminator,
            Cricut_TestAPI_SimpleEnum_new_red red_constructor,
            Cricut_TestAPI_SimpleEnum_extract_red red_extractor,
            Cricut_TestAPI_SimpleEnum_new_green green_constructor,
            Cricut_TestAPI_SimpleEnum_extract_green green_extractor,
            Cricut_TestAPI_SimpleEnum_new_blue blue_constructor,
            Cricut_TestAPI_SimpleEnum_extract_blue blue_extractor,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Strings_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        delegate IntPtr _Structs_MemberwiseStructConstructor(
            IntPtr immutable,
            IntPtr mutable,
            out IntPtr exn
        );
        delegate IntPtr _Structs_MemberwiseStruct_immutableGetter(IntPtr obj, out IntPtr exn);
        delegate void _Structs_MemberwiseStruct_immutableSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        delegate IntPtr _Structs_MemberwiseStruct_mutableGetter(IntPtr obj, out IntPtr exn);
        delegate void _Structs_MemberwiseStruct_mutableSetter(IntPtr obj, IntPtr newValue, out IntPtr exn);
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_MemberwiseStruct_setup(
            _Structs_MemberwiseStructConstructor constructor,
            _Structs_MemberwiseStruct_immutableGetter get_immutable,
            _Structs_MemberwiseStruct_immutableSetter set_immutable,
            _Structs_MemberwiseStruct_mutableGetter get_mutable,
            _Structs_MemberwiseStruct_mutableSetter set_mutable,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_ReferenceStruct_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Tuples_setup(
            out IntPtr _exn
        );

        public static void _ensureLoaded() {}

        static _TypeSetup() {
            // There's no explicit way to call the static constructor, so do this instead
            FishyJoesRuntime.Loader.ensureLoaded();
            FishyJoes_TestAPI_registerTypes();

            Once("setup_FishyJoesRuntime_((Int) -> Int, (Int) -> Int) -> (Int) -> Int", () => {
                Console.WriteLine("setting up ((Int) -> Int, (Int) -> Int) -> (Int) -> Int...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function2Converter_setup<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>(
                    "Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_((Int, String), (String, Double, String), String, Bool)", () => {
                Console.WriteLine("setting up ((Int, String), (String, Double, String), String, Bool)...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Tuple4Converter_setup<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>(
                    "Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_() -> Int", () => {
                Console.WriteLine("setting up () -> Int...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function0Converter_setup<nint>(
                    "Function0Converter<Int>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(Float, Double, Int) -> Double", () => {
                Console.WriteLine("setting up (Float, Double, Int) -> Double...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function3Converter_setup<double, float, double, nint>(
                    "Function3Converter<Float, Double, Int, Double>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(Int) -> Int", () => {
                Console.WriteLine("setting up (Int) -> Int...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function1Converter_setup<nint, nint>(
                    "Function1Converter<Int, Int>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(Int, String)", () => {
                Console.WriteLine("setting up (Int, String)...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Tuple2Converter_setup<nint, string>(
                    "Tuple2Converter<Int, Swift.String>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>>", () => {
                Console.WriteLine("setting up (Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function1Converter_setup<System.Collections.Generic.IList<nint?>?, System.Collections.Generic.IList<nint?>?>(
                    "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(Optional<UInt8>) -> Optional<UInt8>", () => {
                Console.WriteLine("setting up (Optional<UInt8>) -> Optional<UInt8>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function1Converter_setup<byte?, byte?>(
                    "Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(String, Double, String)", () => {
                Console.WriteLine("setting up (String, Double, String)...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Tuple3Converter_setup<string, double, string>(
                    "Tuple3Converter<Swift.String, Double, Swift.String>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)", () => {
                Console.WriteLine("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Tuple6Converter_setup<string, nint, double, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>, bool>(
                    "Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(String, Int, Double, String, () -> Int) -> () -> Int", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int) -> () -> Int...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function5Converter_setup<System.Func<nint>, string, nint, double, string, System.Func<nint>>(
                    "Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(String, Int, Double, String, () -> Int, Int) -> Int", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int, Int) -> Int...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function6Converter_setup<nint, string, nint, double, string, System.Func<nint>, nint>(
                    "Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(String, String, String, String) -> Array<String>", () => {
                Console.WriteLine("setting up (String, String, String, String) -> Array<String>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Function4Converter_setup<System.Collections.Generic.IList<string>, string, string, string, string>(
                    "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_(String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))", () => {
                Console.WriteLine("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_Tuple5Converter_setup<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>(
                    "Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Bool>", () => {
                Console.WriteLine("setting up Array<Bool>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<bool>(
                    "ArrayConverter<Bool>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Double>", () => {
                Console.WriteLine("setting up Array<Double>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<double>(
                    "ArrayConverter<Double>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Float>", () => {
                Console.WriteLine("setting up Array<Float>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<float>(
                    "ArrayConverter<Float>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Int16>", () => {
                Console.WriteLine("setting up Array<Int16>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<short>(
                    "ArrayConverter<Int16>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Int32>", () => {
                Console.WriteLine("setting up Array<Int32>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<int>(
                    "ArrayConverter<Int32>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Int64>", () => {
                Console.WriteLine("setting up Array<Int64>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<long>(
                    "ArrayConverter<Int64>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Int8>", () => {
                Console.WriteLine("setting up Array<Int8>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<sbyte>(
                    "ArrayConverter<Int8>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Int>", () => {
                Console.WriteLine("setting up Array<Int>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<nint>(
                    "ArrayConverter<Int>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Bool>>", () => {
                Console.WriteLine("setting up Array<Optional<Bool>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<bool?>(
                    "ArrayConverter<OptionalConverter<Bool>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Double>>", () => {
                Console.WriteLine("setting up Array<Optional<Double>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<double?>(
                    "ArrayConverter<OptionalConverter<Double>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Float>>", () => {
                Console.WriteLine("setting up Array<Optional<Float>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<float?>(
                    "ArrayConverter<OptionalConverter<Float>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Int16>>", () => {
                Console.WriteLine("setting up Array<Optional<Int16>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<short?>(
                    "ArrayConverter<OptionalConverter<Int16>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Int32>>", () => {
                Console.WriteLine("setting up Array<Optional<Int32>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<int?>(
                    "ArrayConverter<OptionalConverter<Int32>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Int64>>", () => {
                Console.WriteLine("setting up Array<Optional<Int64>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<long?>(
                    "ArrayConverter<OptionalConverter<Int64>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Int8>>", () => {
                Console.WriteLine("setting up Array<Optional<Int8>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<sbyte?>(
                    "ArrayConverter<OptionalConverter<Int8>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<Int>>", () => {
                Console.WriteLine("setting up Array<Optional<Int>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<nint?>(
                    "ArrayConverter<OptionalConverter<Int>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<UInt16>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt16>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<ushort?>(
                    "ArrayConverter<OptionalConverter<UInt16>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<UInt32>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt32>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<uint?>(
                    "ArrayConverter<OptionalConverter<UInt32>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<UInt64>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt64>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<ulong?>(
                    "ArrayConverter<OptionalConverter<UInt64>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<Optional<UInt8>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt8>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<byte?>(
                    "ArrayConverter<OptionalConverter<UInt8>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<String>", () => {
                Console.WriteLine("setting up Array<String>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<string>(
                    "ArrayConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<UInt16>", () => {
                Console.WriteLine("setting up Array<UInt16>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<ushort>(
                    "ArrayConverter<UInt16>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<UInt32>", () => {
                Console.WriteLine("setting up Array<UInt32>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<uint>(
                    "ArrayConverter<UInt32>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<UInt64>", () => {
                Console.WriteLine("setting up Array<UInt64>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<ulong>(
                    "ArrayConverter<UInt64>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Array<UInt8>", () => {
                Console.WriteLine("setting up Array<UInt8>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_ArrayConverter_setup<byte>(
                    "ArrayConverter<UInt8>",
                    out exn
                ));
            });
            Once("setup_TestAPI_AssociatedDataEnum", () => {
                Console.WriteLine("setting up AssociatedDataEnum...");
                Utilities.Check((out IntPtr exn) => TestAPI_AssociatedDataEnum_setup(
                    bag<FishyJoesRuntime.EnumDiscriminator>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => {
                        var enumeration = PeekHandle<Cricut.TestAPI.AssociatedDataEnum>(obj);
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.Thing) { return (nint)0; }
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.Other) { return (nint)1; }
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.Bar) { return (nint)2; }
                        throw new Exception($"Found unexpected subclass of Cricut.TestAPI.AssociatedDataEnum: {enumeration}");
                    })),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_thing>(
                        (
                            nint _value,
                            out IntPtr exn
                        ) => Catching(out exn, () => 
                            PassOwnership(new Cricut.TestAPI.AssociatedDataEnum.Thing(
                                _value
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_thing>(
                        (
                            IntPtr obj,
                            ref nint _value,
                            out IntPtr exn
                        ) => {
                            try {
                                var enumeration = PeekHandle<Cricut.TestAPI.AssociatedDataEnum.Thing>(obj);
                                _value = enumeration.Value;
                                exn = IntPtr.Zero;
                            } catch (Exception e) {
                                exn = PassOwnership(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_other>(
                        (
                            IntPtr _unnamed,
                            nint __1,
                            out IntPtr exn
                        ) => Catching(out exn, () => 
                            PassOwnership(new Cricut.TestAPI.AssociatedDataEnum.Other(
                                PeekHandle<string>(_unnamed),
                                __1
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_other>(
                        (
                            IntPtr obj,
                            ref IntPtr _unnamed,
                            ref nint __1,
                            out IntPtr exn
                        ) => {
                            try {
                                var enumeration = PeekHandle<Cricut.TestAPI.AssociatedDataEnum.Other>(obj);
                                _unnamed = PassOwnership(enumeration.Unnamed);
                                __1 = enumeration._1;
                                exn = IntPtr.Zero;
                            } catch (Exception e) {
                                exn = PassOwnership(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_bar>(
                        (
                            IntPtr _named,
                            IntPtr __1,
                            out IntPtr exn
                        ) => Catching(out exn, () => 
                            PassOwnership(new Cricut.TestAPI.AssociatedDataEnum.Bar(
                                PeekHandle<string>(_named),
                                PeekHandle<Cricut.TestAPI.AssociatedDataEnum>(__1)
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_bar>(
                        (
                            IntPtr obj,
                            ref IntPtr _named,
                            ref IntPtr __1,
                            out IntPtr exn
                        ) => {
                            try {
                                var enumeration = PeekHandle<Cricut.TestAPI.AssociatedDataEnum.Bar>(obj);
                                _named = PassOwnership(enumeration.Named);
                                __1 = PassOwnership(enumeration._1);
                                exn = IntPtr.Zero;
                            } catch (Exception e) {
                                exn = PassOwnership(e);
                            }
                        }
                    ),
                    out exn
                ));
            });
            Once("setup_TestAPI_Bytes", () => {
                Console.WriteLine("setting up Bytes...");
                Utilities.Check((out IntPtr exn) => TestAPI_Bytes_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Bytes(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Collections", () => {
                Console.WriteLine("setting up Collections...");
                Utilities.Check((out IntPtr exn) => TestAPI_Collections_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Collections(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Collections.CollectionHolder", () => {
                Console.WriteLine("setting up Collections.CollectionHolder...");
                Utilities.Check((out IntPtr exn) => TestAPI_Collections_CollectionHolder_setup(
                    bag<_Collections_CollectionHolderConstructor>((IntPtr boolArray, IntPtr boolSet, IntPtr boolDictionary, IntPtr integerArray, IntPtr integerSet, IntPtr integerDictionary, IntPtr stringArray, IntPtr stringSet, IntPtr stringDictionary, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Collections.CollectionHolder(
                            PeekHandle<System.Collections.Generic.IList<bool>>(boolArray),
                            PeekHandle<System.Collections.Generic.ISet<bool>>(boolSet),
                            PeekHandle<System.Collections.Generic.IDictionary<bool, bool>>(boolDictionary),
                            PeekHandle<System.Collections.Generic.IList<nint>>(integerArray),
                            PeekHandle<System.Collections.Generic.ISet<nint>>(integerSet),
                            PeekHandle<System.Collections.Generic.IDictionary<nint, nint>>(integerDictionary),
                            PeekHandle<System.Collections.Generic.IList<string>>(stringArray),
                            PeekHandle<System.Collections.Generic.ISet<string>>(stringSet),
                            PeekHandle<System.Collections.Generic.IDictionary<string, string>>(stringDictionary)
                        ));
                    })),
                    bag<_Collections_CollectionHolder_boolArrayGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).BoolArray)
                    )),
                    bag<_Collections_CollectionHolder_boolArraySetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).BoolArray = PeekHandle<System.Collections.Generic.IList<bool>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_boolSetGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).BoolSet)
                    )),
                    bag<_Collections_CollectionHolder_boolSetSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).BoolSet = PeekHandle<System.Collections.Generic.ISet<bool>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_boolDictionaryGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).BoolDictionary)
                    )),
                    bag<_Collections_CollectionHolder_boolDictionarySetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).BoolDictionary = PeekHandle<System.Collections.Generic.IDictionary<bool, bool>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_integerArrayGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).IntegerArray)
                    )),
                    bag<_Collections_CollectionHolder_integerArraySetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).IntegerArray = PeekHandle<System.Collections.Generic.IList<nint>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_integerSetGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).IntegerSet)
                    )),
                    bag<_Collections_CollectionHolder_integerSetSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).IntegerSet = PeekHandle<System.Collections.Generic.ISet<nint>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_integerDictionaryGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).IntegerDictionary)
                    )),
                    bag<_Collections_CollectionHolder_integerDictionarySetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).IntegerDictionary = PeekHandle<System.Collections.Generic.IDictionary<nint, nint>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_stringArrayGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).StringArray)
                    )),
                    bag<_Collections_CollectionHolder_stringArraySetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).StringArray = PeekHandle<System.Collections.Generic.IList<string>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_stringSetGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).StringSet)
                    )),
                    bag<_Collections_CollectionHolder_stringSetSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).StringSet = PeekHandle<System.Collections.Generic.ISet<string>>(newValue);
                    })),
                    bag<_Collections_CollectionHolder_stringDictionaryGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).StringDictionary)
                    )),
                    bag<_Collections_CollectionHolder_stringDictionarySetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Collections.CollectionHolder>(obj).StringDictionary = PeekHandle<System.Collections.Generic.IDictionary<string, string>>(newValue);
                    })),
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Dictionary<Bool, Bool>", () => {
                Console.WriteLine("setting up Dictionary<Bool, Bool>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_DictionaryConverter_setup<bool, bool>(
                    "DictionaryConverter<Bool, Bool>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Dictionary<Int, Int>", () => {
                Console.WriteLine("setting up Dictionary<Int, Int>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_DictionaryConverter_setup<nint, nint>(
                    "DictionaryConverter<Int, Int>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Dictionary<Int, Optional<Int>>", () => {
                Console.WriteLine("setting up Dictionary<Int, Optional<Int>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_DictionaryConverter_setup<nint, nint?>(
                    "DictionaryConverter<Int, OptionalConverter<Int>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Dictionary<String, String>", () => {
                Console.WriteLine("setting up Dictionary<String, String>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_DictionaryConverter_setup<string, string>(
                    "DictionaryConverter<Swift.String, Swift.String>",
                    out exn
                ));
            });
            Once("setup_TestAPI_EmptyEnum", () => {
                Console.WriteLine("setting up EmptyEnum...");
                Utilities.Check((out IntPtr exn) => TestAPI_EmptyEnum_setup(
                    out exn
                ));
            });
            Once("setup_TestAPI_Functions", () => {
                Console.WriteLine("setting up Functions...");
                Utilities.Check((out IntPtr exn) => TestAPI_Functions_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Functions(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Functions.TheError", () => {
                Console.WriteLine("setting up Functions.TheError...");
                Utilities.Check((out IntPtr exn) => TestAPI_Functions_TheError_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Functions.TheError(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Array<Int>>", () => {
                Console.WriteLine("setting up Optional<Array<Int>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Array<Optional<Int>>>", () => {
                Console.WriteLine("setting up Optional<Array<Optional<Int>>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Bool>", () => {
                Console.WriteLine("setting up Optional<Bool>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Dictionary<Int, Int>>", () => {
                Console.WriteLine("setting up Optional<Dictionary<Int, Int>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Dictionary<Int, Optional<Int>>>", () => {
                Console.WriteLine("setting up Optional<Dictionary<Int, Optional<Int>>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Double>", () => {
                Console.WriteLine("setting up Optional<Double>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Float>", () => {
                Console.WriteLine("setting up Optional<Float>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Int16>", () => {
                Console.WriteLine("setting up Optional<Int16>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Int32>", () => {
                Console.WriteLine("setting up Optional<Int32>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Int64>", () => {
                Console.WriteLine("setting up Optional<Int64>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Int8>", () => {
                Console.WriteLine("setting up Optional<Int8>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Int>", () => {
                Console.WriteLine("setting up Optional<Int>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Set<Int>>", () => {
                Console.WriteLine("setting up Optional<Set<Int>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<Set<Optional<Int>>>", () => {
                Console.WriteLine("setting up Optional<Set<Optional<Int>>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<SimpleEnum>", () => {
                Console.WriteLine("setting up Optional<SimpleEnum>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<UInt16>", () => {
                Console.WriteLine("setting up Optional<UInt16>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<UInt32>", () => {
                Console.WriteLine("setting up Optional<UInt32>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<UInt64>", () => {
                Console.WriteLine("setting up Optional<UInt64>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Optional<UInt8>", () => {
                Console.WriteLine("setting up Optional<UInt8>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_OptionalConverter_setup(
                    out exn
                ));
            });
            Once("setup_TestAPI_Primitives", () => {
                Console.WriteLine("setting up Primitives...");
                Utilities.Check((out IntPtr exn) => TestAPI_Primitives_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Primitives(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Primitives.PrimitiveHolder", () => {
                Console.WriteLine("setting up Primitives.PrimitiveHolder...");
                Utilities.Check((out IntPtr exn) => TestAPI_Primitives_PrimitiveHolder_setup(
                    bag<_Primitives_PrimitiveHolderConstructor>((bool b, IntPtr bq, byte ui8, IntPtr ui8q, ushort ui16, IntPtr ui16q, uint ui32, IntPtr ui32q, ulong ui64, IntPtr ui64q, sbyte i8, IntPtr i8q, short i16, IntPtr i16q, int i32, IntPtr i32q, long i64, IntPtr i64q, float f, IntPtr fq, double d, IntPtr dq, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Primitives.PrimitiveHolder(
                            b,
                            PeekHandle<bool?>(bq),
                            ui8,
                            PeekHandle<byte?>(ui8q),
                            ui16,
                            PeekHandle<ushort?>(ui16q),
                            ui32,
                            PeekHandle<uint?>(ui32q),
                            ui64,
                            PeekHandle<ulong?>(ui64q),
                            i8,
                            PeekHandle<sbyte?>(i8q),
                            i16,
                            PeekHandle<short?>(i16q),
                            i32,
                            PeekHandle<int?>(i32q),
                            i64,
                            PeekHandle<long?>(i64q),
                            f,
                            PeekHandle<float?>(fq),
                            d,
                            PeekHandle<double?>(dq)
                        ));
                    })),
                    bag<_Primitives_PrimitiveHolder_bGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).B
                    )),
                    bag<_Primitives_PrimitiveHolder_bSetter>((IntPtr obj, bool newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).B = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_bqGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Bq)
                    )),
                    bag<_Primitives_PrimitiveHolder_bqSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Bq = PeekHandle<bool?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_ui8Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui8
                    )),
                    bag<_Primitives_PrimitiveHolder_ui8Setter>((IntPtr obj, byte newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui8 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui8qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui8q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui8qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui8q = PeekHandle<byte?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_ui16Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui16
                    )),
                    bag<_Primitives_PrimitiveHolder_ui16Setter>((IntPtr obj, ushort newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui16 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui16qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui16q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui16qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui16q = PeekHandle<ushort?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_ui32Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui32
                    )),
                    bag<_Primitives_PrimitiveHolder_ui32Setter>((IntPtr obj, uint newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui32 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui32qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui32q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui32qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui32q = PeekHandle<uint?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_ui64Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui64
                    )),
                    bag<_Primitives_PrimitiveHolder_ui64Setter>((IntPtr obj, ulong newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui64 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui64qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui64q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui64qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Ui64q = PeekHandle<ulong?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_i8Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I8
                    )),
                    bag<_Primitives_PrimitiveHolder_i8Setter>((IntPtr obj, sbyte newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I8 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i8qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I8q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i8qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I8q = PeekHandle<sbyte?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_i16Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I16
                    )),
                    bag<_Primitives_PrimitiveHolder_i16Setter>((IntPtr obj, short newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I16 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i16qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I16q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i16qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I16q = PeekHandle<short?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_i32Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I32
                    )),
                    bag<_Primitives_PrimitiveHolder_i32Setter>((IntPtr obj, int newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I32 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i32qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I32q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i32qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I32q = PeekHandle<int?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_i64Getter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I64
                    )),
                    bag<_Primitives_PrimitiveHolder_i64Setter>((IntPtr obj, long newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I64 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i64qGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I64q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i64qSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).I64q = PeekHandle<long?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_fGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).F
                    )),
                    bag<_Primitives_PrimitiveHolder_fSetter>((IntPtr obj, float newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).F = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_fqGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Fq)
                    )),
                    bag<_Primitives_PrimitiveHolder_fqSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Fq = PeekHandle<float?>(newValue);
                    })),
                    bag<_Primitives_PrimitiveHolder_dGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).D
                    )),
                    bag<_Primitives_PrimitiveHolder_dSetter>((IntPtr obj, double newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).D = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_dqGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Dq)
                    )),
                    bag<_Primitives_PrimitiveHolder_dqSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(obj).Dq = PeekHandle<double?>(newValue);
                    })),
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Set<Bool>", () => {
                Console.WriteLine("setting up Set<Bool>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_SetConverter_setup<bool>(
                    "SetConverter<Bool>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Set<Int>", () => {
                Console.WriteLine("setting up Set<Int>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_SetConverter_setup<nint>(
                    "SetConverter<Int>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Set<Optional<Int>>", () => {
                Console.WriteLine("setting up Set<Optional<Int>>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_SetConverter_setup<nint?>(
                    "SetConverter<OptionalConverter<Int>>",
                    out exn
                ));
            });
            Once("setup_FishyJoesRuntime_Set<String>", () => {
                Console.WriteLine("setting up Set<String>...");
                Utilities.Check((out IntPtr exn) => FishyJoesRuntime_SetConverter_setup<string>(
                    "SetConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_TestAPI_SimpleEnum", () => {
                Console.WriteLine("setting up SimpleEnum...");
                Utilities.Check((out IntPtr exn) => TestAPI_SimpleEnum_setup(
                    bag<FishyJoesRuntime.EnumDiscriminator>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => {
                        var enumeration = PeekHandle<Cricut.TestAPI.SimpleEnum>(obj);
                        if (enumeration is Cricut.TestAPI.SimpleEnum.Red) { return (nint)0; }
                        if (enumeration is Cricut.TestAPI.SimpleEnum.Green) { return (nint)1; }
                        if (enumeration is Cricut.TestAPI.SimpleEnum.Blue) { return (nint)2; }
                        throw new Exception($"Found unexpected subclass of Cricut.TestAPI.SimpleEnum: {enumeration}");
                    })),
                    bag<Cricut_TestAPI_SimpleEnum_new_red>(
                        (
                            out IntPtr exn
                        ) => Catching(out exn, () => 
                            PassOwnership(new Cricut.TestAPI.SimpleEnum.Red(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_extract_red>(
                        (
                            IntPtr obj,
                            out IntPtr exn
                        ) => {
                            try {
                                var enumeration = PeekHandle<Cricut.TestAPI.SimpleEnum.Red>(obj);
                                exn = IntPtr.Zero;
                            } catch (Exception e) {
                                exn = PassOwnership(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_new_green>(
                        (
                            out IntPtr exn
                        ) => Catching(out exn, () => 
                            PassOwnership(new Cricut.TestAPI.SimpleEnum.Green(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_extract_green>(
                        (
                            IntPtr obj,
                            out IntPtr exn
                        ) => {
                            try {
                                var enumeration = PeekHandle<Cricut.TestAPI.SimpleEnum.Green>(obj);
                                exn = IntPtr.Zero;
                            } catch (Exception e) {
                                exn = PassOwnership(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_new_blue>(
                        (
                            out IntPtr exn
                        ) => Catching(out exn, () => 
                            PassOwnership(new Cricut.TestAPI.SimpleEnum.Blue(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_extract_blue>(
                        (
                            IntPtr obj,
                            out IntPtr exn
                        ) => {
                            try {
                                var enumeration = PeekHandle<Cricut.TestAPI.SimpleEnum.Blue>(obj);
                                exn = IntPtr.Zero;
                            } catch (Exception e) {
                                exn = PassOwnership(e);
                            }
                        }
                    ),
                    out exn
                ));
            });
            Once("setup_TestAPI_Strings", () => {
                Console.WriteLine("setting up Strings...");
                Utilities.Check((out IntPtr exn) => TestAPI_Strings_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Strings(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Structs", () => {
                Console.WriteLine("setting up Structs...");
                Utilities.Check((out IntPtr exn) => TestAPI_Structs_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Structs(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Structs.MemberwiseStruct", () => {
                Console.WriteLine("setting up Structs.MemberwiseStruct...");
                Utilities.Check((out IntPtr exn) => TestAPI_Structs_MemberwiseStruct_setup(
                    bag<_Structs_MemberwiseStructConstructor>((IntPtr immutable, IntPtr mutable, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Structs.MemberwiseStruct(
                            PeekHandle<string>(immutable),
                            PeekHandle<string>(mutable)
                        ));
                    })),
                    bag<_Structs_MemberwiseStruct_immutableGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Structs.MemberwiseStruct>(obj).Immutable)
                    )),
                    bag<_Structs_MemberwiseStruct_immutableSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Structs.MemberwiseStruct>(obj).Immutable = PeekHandle<string>(newValue);
                    })),
                    bag<_Structs_MemberwiseStruct_mutableGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Cricut.TestAPI.Structs.MemberwiseStruct>(obj).Mutable)
                    )),
                    bag<_Structs_MemberwiseStruct_mutableSetter>((IntPtr obj, IntPtr newValue, out IntPtr exn) => Catching(out exn, () => {
                        PeekHandle<Cricut.TestAPI.Structs.MemberwiseStruct>(obj).Mutable = PeekHandle<string>(newValue);
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Structs.ReferenceStruct", () => {
                Console.WriteLine("setting up Structs.ReferenceStruct...");
                Utilities.Check((out IntPtr exn) => TestAPI_Structs_ReferenceStruct_setup(
                    bag<SwiftReference.ConstructorDelegate>((IntPtr ptr, out IntPtr exn) => Catching(out exn, () => {
                        return PassOwnership(new Cricut.TestAPI.Structs.ReferenceStruct(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_Tuples", () => {
                Console.WriteLine("setting up Tuples...");
                Utilities.Check((out IntPtr exn) => TestAPI_Tuples_setup(
                    out exn
                ));
            });
        }
    }
}
