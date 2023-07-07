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

        delegate CreatedRef Cricut_TestAPI_AssociatedDataEnum_new_thing(
            nint value,
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_thing(
            UnownedRef obj,
            ref nint value,
            out CreatedRef _exn
        );
        delegate CreatedRef Cricut_TestAPI_AssociatedDataEnum_new_other(
            ConsumedRef unnamed,
            nint _1,
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_other(
            UnownedRef obj,
            ref CreatedRef unnamed,
            ref nint _1,
            out CreatedRef _exn
        );
        delegate CreatedRef Cricut_TestAPI_AssociatedDataEnum_new_bar(
            ConsumedRef named,
            ConsumedRef _1,
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_bar(
            UnownedRef obj,
            ref CreatedRef named,
            ref CreatedRef _1,
            out CreatedRef _exn
        );
        delegate CreatedRef Cricut_TestAPI_AssociatedDataEnum_new_noValue(
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_noValue(
            UnownedRef obj,
            out CreatedRef _exn
        );
        delegate CreatedRef Cricut_TestAPI_AssociatedDataEnum_new_simpleEnum(
            ConsumedRef value,
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_AssociatedDataEnum_extract_simpleEnum(
            UnownedRef obj,
            ref CreatedRef value,
            out CreatedRef _exn
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
            Cricut_TestAPI_AssociatedDataEnum_new_noValue noValue_constructor,
            Cricut_TestAPI_AssociatedDataEnum_extract_noValue noValue_extractor,
            Cricut_TestAPI_AssociatedDataEnum_new_simpleEnum simpleEnum_constructor,
            Cricut_TestAPI_AssociatedDataEnum_extract_simpleEnum simpleEnum_extractor,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Bytes_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_ClosedRanges_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Collections_setup(
            out CreatedRef _exn
        );

        delegate CreatedRef _Collections_CollectionHolderConstructor(
            ConsumedRef boolArray,
            ConsumedRef boolSet,
            ConsumedRef boolDictionary,
            ConsumedRef integerArray,
            ConsumedRef integerSet,
            ConsumedRef integerDictionary,
            ConsumedRef stringArray,
            ConsumedRef stringSet,
            ConsumedRef stringDictionary,
            out CreatedRef exn
        );
        delegate CreatedRef _Collections_CollectionHolder_boolArrayGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_boolArraySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_boolSetGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_boolSetSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_boolDictionaryGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_boolDictionarySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_integerArrayGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_integerArraySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_integerSetGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_integerSetSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_integerDictionaryGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_integerDictionarySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_stringArrayGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_stringArraySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_stringSetGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_stringSetSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Collections_CollectionHolder_stringDictionaryGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Collections_CollectionHolder_stringDictionarySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
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
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_DefaultArguments_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Deprecations_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyEnum_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Functions_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Functions_TheError_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Primitives_setup(
            out CreatedRef _exn
        );

        delegate CreatedRef _Primitives_PrimitiveHolderConstructor(
            bool b,
            ConsumedRef bq,
            byte ui8,
            ConsumedRef ui8q,
            ushort ui16,
            ConsumedRef ui16q,
            uint ui32,
            ConsumedRef ui32q,
            ulong ui64,
            ConsumedRef ui64q,
            nuint ui,
            ConsumedRef uiq,
            sbyte i8,
            ConsumedRef i8q,
            short i16,
            ConsumedRef i16q,
            int i32,
            ConsumedRef i32q,
            long i64,
            ConsumedRef i64q,
            nint i,
            ConsumedRef iq,
            float f,
            ConsumedRef fq,
            double d,
            ConsumedRef dq,
            out CreatedRef exn
        );
        delegate bool _Primitives_PrimitiveHolder_bGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_bSetter(UnownedRef obj, bool newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_bqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_bqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate byte _Primitives_PrimitiveHolder_ui8Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui8Setter(UnownedRef obj, byte newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_ui8qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui8qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate ushort _Primitives_PrimitiveHolder_ui16Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui16Setter(UnownedRef obj, ushort newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_ui16qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui16qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate uint _Primitives_PrimitiveHolder_ui32Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui32Setter(UnownedRef obj, uint newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_ui32qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui32qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate ulong _Primitives_PrimitiveHolder_ui64Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui64Setter(UnownedRef obj, ulong newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_ui64qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_ui64qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate nuint _Primitives_PrimitiveHolder_uiGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_uiSetter(UnownedRef obj, nuint newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_uiqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_uiqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate sbyte _Primitives_PrimitiveHolder_i8Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i8Setter(UnownedRef obj, sbyte newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_i8qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i8qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate short _Primitives_PrimitiveHolder_i16Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i16Setter(UnownedRef obj, short newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_i16qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i16qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate int _Primitives_PrimitiveHolder_i32Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i32Setter(UnownedRef obj, int newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_i32qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i32qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate long _Primitives_PrimitiveHolder_i64Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i64Setter(UnownedRef obj, long newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_i64qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_i64qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate nint _Primitives_PrimitiveHolder_iGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_iSetter(UnownedRef obj, nint newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_iqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_iqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate float _Primitives_PrimitiveHolder_fGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_fSetter(UnownedRef obj, float newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_fqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_fqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate double _Primitives_PrimitiveHolder_dGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_dSetter(UnownedRef obj, double newValue, out CreatedRef exn);
        delegate CreatedRef _Primitives_PrimitiveHolder_dqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Primitives_PrimitiveHolder_dqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
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
            _Primitives_PrimitiveHolder_uiGetter get_ui,
            _Primitives_PrimitiveHolder_uiSetter set_ui,
            _Primitives_PrimitiveHolder_uiqGetter get_uiq,
            _Primitives_PrimitiveHolder_uiqSetter set_uiq,
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
            _Primitives_PrimitiveHolder_iGetter get_i,
            _Primitives_PrimitiveHolder_iSetter set_i,
            _Primitives_PrimitiveHolder_iqGetter get_iq,
            _Primitives_PrimitiveHolder_iqSetter set_iq,
            _Primitives_PrimitiveHolder_fGetter get_f,
            _Primitives_PrimitiveHolder_fSetter set_f,
            _Primitives_PrimitiveHolder_fqGetter get_fq,
            _Primitives_PrimitiveHolder_fqSetter set_fq,
            _Primitives_PrimitiveHolder_dGetter get_d,
            _Primitives_PrimitiveHolder_dSetter set_d,
            _Primitives_PrimitiveHolder_dqGetter get_dq,
            _Primitives_PrimitiveHolder_dqSetter set_dq,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Ranges_setup(
            out CreatedRef _exn
        );

        delegate CreatedRef Cricut_TestAPI_SimpleEnum_new_red(
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_SimpleEnum_extract_red(
            UnownedRef obj,
            out CreatedRef _exn
        );
        delegate CreatedRef Cricut_TestAPI_SimpleEnum_new_green(
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_SimpleEnum_extract_green(
            UnownedRef obj,
            out CreatedRef _exn
        );
        delegate CreatedRef Cricut_TestAPI_SimpleEnum_new_blue(
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_SimpleEnum_extract_blue(
            UnownedRef obj,
            out CreatedRef _exn
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
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Strings_setup(
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_setup(
            out CreatedRef _exn
        );

        delegate CreatedRef _Structs_MemberwiseStructConstructor(
            ConsumedRef immutable,
            ConsumedRef mutable,
            out CreatedRef exn
        );
        delegate CreatedRef _Structs_MemberwiseStruct_immutableGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Structs_MemberwiseStruct_immutableSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _Structs_MemberwiseStruct_mutableGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Structs_MemberwiseStruct_mutableSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_MemberwiseStruct_setup(
            _Structs_MemberwiseStructConstructor constructor,
            _Structs_MemberwiseStruct_immutableGetter get_immutable,
            _Structs_MemberwiseStruct_immutableSetter set_immutable,
            _Structs_MemberwiseStruct_mutableGetter get_mutable,
            _Structs_MemberwiseStruct_mutableSetter set_mutable,
            out CreatedRef _exn
        );

        delegate CreatedRef _Structs_MutableStructConstructor(
            nint i,
            out CreatedRef exn
        );
        delegate nint _Structs_MutableStruct_iGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _Structs_MutableStruct_iSetter(UnownedRef obj, nint newValue, out CreatedRef exn);
        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_MutableStruct_setup(
            _Structs_MutableStructConstructor constructor,
            _Structs_MutableStruct_iGetter get_i,
            _Structs_MutableStruct_iSetter set_i,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_ReferenceStruct_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
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
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function2Converter_setup<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>(
                    "Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>",
                    out exn
                ));
            });
            Once("setup_Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>", () => {
                Console.WriteLine("setting up ((Int, String), (String, Double, String), String, Bool)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple4Converter_setup<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>(
                    "Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>",
                    out exn
                ));
            });
            Once("setup_Function0Converter<Int>", () => {
                Console.WriteLine("setting up () -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function0Converter_setup<nint>(
                    "Function0Converter<Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction0Converter<Int>", () => {
                Console.WriteLine("setting up () async -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_AsyncFunction0Converter_setup<nint>(
                    "AsyncFunction0Converter<Int>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<Double, VoidConverter>", () => {
                Console.WriteLine("setting up (Double) -> Void...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup<double>(
                    "Function1Converter<Double, VoidConverter>",
                    out exn
                ));
            });
            Once("setup_Function3Converter<Float, Double, Int, Double>", () => {
                Console.WriteLine("setting up (Float, Double, Int) -> Double...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function3Converter_setup<double, float, double, nint>(
                    "Function3Converter<Float, Double, Int, Double>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<Int, Int>", () => {
                Console.WriteLine("setting up (Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup<nint, nint>(
                    "Function1Converter<Int, Int>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<Int, VoidConverter>", () => {
                Console.WriteLine("setting up (Int) -> Void...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup<nint>(
                    "Function1Converter<Int, VoidConverter>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<Int, Int>", () => {
                Console.WriteLine("setting up (Int) async -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_AsyncFunction1Converter_setup<nint, nint>(
                    "AsyncFunction1Converter<Int, Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction2Converter<Int, Int, Int>", () => {
                Console.WriteLine("setting up (Int, Int) async -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_AsyncFunction2Converter_setup<nint, nint, nint>(
                    "AsyncFunction2Converter<Int, Int, Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction3Converter<Int, Int, Int, Int>", () => {
                Console.WriteLine("setting up (Int, Int, Int) async -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_AsyncFunction3Converter_setup<nint, nint, nint, nint>(
                    "AsyncFunction3Converter<Int, Int, Int, Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction4Converter<Int, Int, Int, Int, Int>", () => {
                Console.WriteLine("setting up (Int, Int, Int, Int) async -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_AsyncFunction4Converter_setup<nint, nint, nint, nint, nint>(
                    "AsyncFunction4Converter<Int, Int, Int, Int, Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction5Converter<Int, Int, Int, Int, Int, Int>", () => {
                Console.WriteLine("setting up (Int, Int, Int, Int, Int) async -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_AsyncFunction5Converter_setup<nint, nint, nint, nint, nint, nint>(
                    "AsyncFunction5Converter<Int, Int, Int, Int, Int, Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction6Converter<Int, Int, Int, Int, Int, Int, Int>", () => {
                Console.WriteLine("setting up (Int, Int, Int, Int, Int, Int) async -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_AsyncFunction6Converter_setup<nint, nint, nint, nint, nint, nint, nint>(
                    "AsyncFunction6Converter<Int, Int, Int, Int, Int, Int, Int>",
                    out exn
                ));
            });
            Once("setup_Tuple2Converter<Int, Swift.String>", () => {
                Console.WriteLine("setting up (Int, String)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple2Converter_setup<nint, string>(
                    "Tuple2Converter<Int, Swift.String>",
                    out exn
                ));
            });
            Once("setup_Tuple4Converter<Int8, Int16, Int32, Int64>", () => {
                Console.WriteLine("setting up (Int8, Int16, Int32, Int64)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple4Converter_setup<sbyte, short, int, long>(
                    "Tuple4Converter<Int8, Int16, Int32, Int64>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>", () => {
                Console.WriteLine("setting up (Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup<System.Collections.Generic.IList<nint?>?, System.Collections.Generic.IList<nint?>?>(
                    "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>", () => {
                Console.WriteLine("setting up (Optional<UInt8>) -> Optional<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup<byte?, byte?>(
                    "Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>",
                    out exn
                ));
            });
            Once("setup_Tuple3Converter<Swift.String, Double, Swift.String>", () => {
                Console.WriteLine("setting up (String, Double, String)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple3Converter_setup<string, double, string>(
                    "Tuple3Converter<Swift.String, Double, Swift.String>",
                    out exn
                ));
            });
            Once("setup_Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>", () => {
                Console.WriteLine("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple6Converter_setup<string, nint, double, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>, bool>(
                    "Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>",
                    out exn
                ));
            });
            Once("setup_Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int) -> () -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function5Converter_setup<System.Func<nint>, string, nint, double, string, System.Func<nint>>(
                    "Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>",
                    out exn
                ));
            });
            Once("setup_Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int, Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function6Converter_setup<nint, string, nint, double, string, System.Func<nint>, nint>(
                    "Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>",
                    out exn
                ));
            });
            Once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (String, String, String, String) -> Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function4Converter_setup<System.Collections.Generic.IList<string>, string, string, string, string>(
                    "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>", () => {
                Console.WriteLine("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Tuple5Converter_setup<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>(
                    "Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<VoidConverter, VoidConverter>", () => {
                Console.WriteLine("setting up (Void) -> Void...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_Function1Converter_setup<void>(
                    "Function1Converter<VoidConverter, VoidConverter>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Tuple4Converter<Int8, Int16, Int32, Int64>>", () => {
                Console.WriteLine("setting up Array<(Int8, Int16, Int32, Int64)>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<System.Tuple<sbyte, short, int, long>>(
                    "ArrayConverter<Tuple4Converter<Int8, Int16, Int32, Int64>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Bool>", () => {
                Console.WriteLine("setting up Array<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<bool>(
                    "ArrayConverter<Bool>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Double>", () => {
                Console.WriteLine("setting up Array<Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<double>(
                    "ArrayConverter<Double>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Float>", () => {
                Console.WriteLine("setting up Array<Float>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<float>(
                    "ArrayConverter<Float>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int16>", () => {
                Console.WriteLine("setting up Array<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<short>(
                    "ArrayConverter<Int16>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int32>", () => {
                Console.WriteLine("setting up Array<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<int>(
                    "ArrayConverter<Int32>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int64>", () => {
                Console.WriteLine("setting up Array<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<long>(
                    "ArrayConverter<Int64>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int8>", () => {
                Console.WriteLine("setting up Array<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<sbyte>(
                    "ArrayConverter<Int8>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Int>", () => {
                Console.WriteLine("setting up Array<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<nint>(
                    "ArrayConverter<Int>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Bool>>", () => {
                Console.WriteLine("setting up Array<Optional<Bool>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<bool?>(
                    "ArrayConverter<OptionalConverter<Bool>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Double>>", () => {
                Console.WriteLine("setting up Array<Optional<Double>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<double?>(
                    "ArrayConverter<OptionalConverter<Double>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Float>>", () => {
                Console.WriteLine("setting up Array<Optional<Float>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<float?>(
                    "ArrayConverter<OptionalConverter<Float>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int16>>", () => {
                Console.WriteLine("setting up Array<Optional<Int16>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<short?>(
                    "ArrayConverter<OptionalConverter<Int16>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int32>>", () => {
                Console.WriteLine("setting up Array<Optional<Int32>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<int?>(
                    "ArrayConverter<OptionalConverter<Int32>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int64>>", () => {
                Console.WriteLine("setting up Array<Optional<Int64>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<long?>(
                    "ArrayConverter<OptionalConverter<Int64>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int8>>", () => {
                Console.WriteLine("setting up Array<Optional<Int8>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<sbyte?>(
                    "ArrayConverter<OptionalConverter<Int8>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Int>>", () => {
                Console.WriteLine("setting up Array<Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<nint?>(
                    "ArrayConverter<OptionalConverter<Int>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt16>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt16>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<ushort?>(
                    "ArrayConverter<OptionalConverter<UInt16>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt32>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt32>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<uint?>(
                    "ArrayConverter<OptionalConverter<UInt32>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt64>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt64>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<ulong?>(
                    "ArrayConverter<OptionalConverter<UInt64>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt8>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt8>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<byte?>(
                    "ArrayConverter<OptionalConverter<UInt8>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<UInt>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<nuint?>(
                    "ArrayConverter<OptionalConverter<UInt>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.String>", () => {
                Console.WriteLine("setting up Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<string>(
                    "ArrayConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt16>", () => {
                Console.WriteLine("setting up Array<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<ushort>(
                    "ArrayConverter<UInt16>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt32>", () => {
                Console.WriteLine("setting up Array<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<uint>(
                    "ArrayConverter<UInt32>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt64>", () => {
                Console.WriteLine("setting up Array<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<ulong>(
                    "ArrayConverter<UInt64>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt8>", () => {
                Console.WriteLine("setting up Array<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<byte>(
                    "ArrayConverter<UInt8>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<UInt>", () => {
                Console.WriteLine("setting up Array<UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ArrayConverter_setup<nuint>(
                    "ArrayConverter<UInt>",
                    out exn
                ));
            });
            Once("setup_AssociatedDataEnum", () => {
                Console.WriteLine("setting up AssociatedDataEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_AssociatedDataEnum_setup(
                    bag<FishyJoesRuntime.EnumDiscriminator>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        var enumeration = obj.Peek<Cricut.TestAPI.AssociatedDataEnum>();
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.Thing) { return (nint)0; }
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.Other) { return (nint)1; }
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.Bar) { return (nint)2; }
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.NoValue) { return (nint)3; }
                        if (enumeration is Cricut.TestAPI.AssociatedDataEnum.SimpleEnum) { return (nint)4; }
                        throw new Exception($"Found unexpected subclass of Cricut.TestAPI.AssociatedDataEnum: {enumeration}");
                    })),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_thing>(
                        (
                            nint _value,
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.AssociatedDataEnum.Thing(
                                _value
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_thing>(
                        (
                            UnownedRef obj,
                            ref nint _value,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.AssociatedDataEnum.Thing>();
                                _value = enumeration.Value;
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_other>(
                        (
                            ConsumedRef _unnamed,
                            nint __1,
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.AssociatedDataEnum.Other(
                                _unnamed.Consume<string>(),
                                __1
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_other>(
                        (
                            UnownedRef obj,
                            ref CreatedRef _unnamed,
                            ref nint __1,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.AssociatedDataEnum.Other>();
                                _unnamed = new CreatedRef(enumeration.Unnamed);
                                __1 = enumeration._1;
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_bar>(
                        (
                            ConsumedRef _named,
                            ConsumedRef __1,
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.AssociatedDataEnum.Bar(
                                _named.Consume<string>(),
                                __1.Consume<Cricut.TestAPI.AssociatedDataEnum>()
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_bar>(
                        (
                            UnownedRef obj,
                            ref CreatedRef _named,
                            ref CreatedRef __1,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.AssociatedDataEnum.Bar>();
                                _named = new CreatedRef(enumeration.Named);
                                __1 = new CreatedRef(enumeration._1);
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_noValue>(
                        (
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.AssociatedDataEnum.NoValue(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_noValue>(
                        (
                            UnownedRef obj,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.AssociatedDataEnum.NoValue>();
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_new_simpleEnum>(
                        (
                            ConsumedRef _value,
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.AssociatedDataEnum.SimpleEnum(
                                _value.Consume<Cricut.TestAPI.SimpleEnum>()
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_AssociatedDataEnum_extract_simpleEnum>(
                        (
                            UnownedRef obj,
                            ref CreatedRef _value,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.AssociatedDataEnum.SimpleEnum>();
                                _value = new CreatedRef(enumeration.Value);
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    out exn
                ));
            });
            Once("setup_Bytes", () => {
                Console.WriteLine("setting up Bytes...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Bytes_setup(
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Double>", () => {
                Console.WriteLine("setting up ClosedRange<Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<double>(
                    "ClosedRangeConverter<Double>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Float>", () => {
                Console.WriteLine("setting up ClosedRange<Float>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<float>(
                    "ClosedRangeConverter<Float>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Int16>", () => {
                Console.WriteLine("setting up ClosedRange<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<short>(
                    "ClosedRangeConverter<Int16>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Int32>", () => {
                Console.WriteLine("setting up ClosedRange<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<int>(
                    "ClosedRangeConverter<Int32>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Int64>", () => {
                Console.WriteLine("setting up ClosedRange<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<long>(
                    "ClosedRangeConverter<Int64>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Int8>", () => {
                Console.WriteLine("setting up ClosedRange<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<sbyte>(
                    "ClosedRangeConverter<Int8>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Int>", () => {
                Console.WriteLine("setting up ClosedRange<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<nint>(
                    "ClosedRangeConverter<Int>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.String>", () => {
                Console.WriteLine("setting up ClosedRange<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<string>(
                    "ClosedRangeConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<UInt16>", () => {
                Console.WriteLine("setting up ClosedRange<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<ushort>(
                    "ClosedRangeConverter<UInt16>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<UInt32>", () => {
                Console.WriteLine("setting up ClosedRange<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<uint>(
                    "ClosedRangeConverter<UInt32>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<UInt64>", () => {
                Console.WriteLine("setting up ClosedRange<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<ulong>(
                    "ClosedRangeConverter<UInt64>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<UInt8>", () => {
                Console.WriteLine("setting up ClosedRange<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<byte>(
                    "ClosedRangeConverter<UInt8>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<UInt>", () => {
                Console.WriteLine("setting up ClosedRange<UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_ClosedRangeConverter_setup<nuint>(
                    "ClosedRangeConverter<UInt>",
                    out exn
                ));
            });
            Once("setup_ClosedRanges", () => {
                Console.WriteLine("setting up ClosedRanges...");
                Utilities.Check((out CreatedRef exn) => TestAPI_ClosedRanges_setup(
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
                    bag<_Collections_CollectionHolderConstructor>((ConsumedRef boolArray, ConsumedRef boolSet, ConsumedRef boolDictionary, ConsumedRef integerArray, ConsumedRef integerSet, ConsumedRef integerDictionary, ConsumedRef stringArray, ConsumedRef stringSet, ConsumedRef stringDictionary, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Collections.CollectionHolder(
                            boolArray.Consume<System.Collections.Generic.IList<bool>>(),
                            boolSet.Consume<System.Collections.Generic.ISet<bool>>(),
                            boolDictionary.Consume<System.Collections.Generic.IDictionary<bool, bool>>(),
                            integerArray.Consume<System.Collections.Generic.IList<nint>>(),
                            integerSet.Consume<System.Collections.Generic.ISet<nint>>(),
                            integerDictionary.Consume<System.Collections.Generic.IDictionary<nint, nint>>(),
                            stringArray.Consume<System.Collections.Generic.IList<string>>(),
                            stringSet.Consume<System.Collections.Generic.ISet<string>>(),
                            stringDictionary.Consume<System.Collections.Generic.IDictionary<string, string>>()
                        ));
                    })),
                    bag<_Collections_CollectionHolder_boolArrayGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolArray)
                    )),
                    bag<_Collections_CollectionHolder_boolArraySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolArray = newValue.Consume<System.Collections.Generic.IList<bool>>();
                    })),
                    bag<_Collections_CollectionHolder_boolSetGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolSet)
                    )),
                    bag<_Collections_CollectionHolder_boolSetSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolSet = newValue.Consume<System.Collections.Generic.ISet<bool>>();
                    })),
                    bag<_Collections_CollectionHolder_boolDictionaryGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolDictionary)
                    )),
                    bag<_Collections_CollectionHolder_boolDictionarySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolDictionary = newValue.Consume<System.Collections.Generic.IDictionary<bool, bool>>();
                    })),
                    bag<_Collections_CollectionHolder_integerArrayGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerArray)
                    )),
                    bag<_Collections_CollectionHolder_integerArraySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerArray = newValue.Consume<System.Collections.Generic.IList<nint>>();
                    })),
                    bag<_Collections_CollectionHolder_integerSetGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerSet)
                    )),
                    bag<_Collections_CollectionHolder_integerSetSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerSet = newValue.Consume<System.Collections.Generic.ISet<nint>>();
                    })),
                    bag<_Collections_CollectionHolder_integerDictionaryGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerDictionary)
                    )),
                    bag<_Collections_CollectionHolder_integerDictionarySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerDictionary = newValue.Consume<System.Collections.Generic.IDictionary<nint, nint>>();
                    })),
                    bag<_Collections_CollectionHolder_stringArrayGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringArray)
                    )),
                    bag<_Collections_CollectionHolder_stringArraySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringArray = newValue.Consume<System.Collections.Generic.IList<string>>();
                    })),
                    bag<_Collections_CollectionHolder_stringSetGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringSet)
                    )),
                    bag<_Collections_CollectionHolder_stringSetSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringSet = newValue.Consume<System.Collections.Generic.ISet<string>>();
                    })),
                    bag<_Collections_CollectionHolder_stringDictionaryGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringDictionary)
                    )),
                    bag<_Collections_CollectionHolder_stringDictionarySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringDictionary = newValue.Consume<System.Collections.Generic.IDictionary<string, string>>();
                    })),
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
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup<bool, bool>(
                    "DictionaryConverter<Bool, Bool>",
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Int, Int>", () => {
                Console.WriteLine("setting up Dictionary<Int, Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup<nint, nint>(
                    "DictionaryConverter<Int, Int>",
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Int, OptionalConverter<Int>>", () => {
                Console.WriteLine("setting up Dictionary<Int, Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup<nint, nint?>(
                    "DictionaryConverter<Int, OptionalConverter<Int>>",
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Swift.String, Swift.String>", () => {
                Console.WriteLine("setting up Dictionary<String, String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_DictionaryConverter_setup<string, string>(
                    "DictionaryConverter<Swift.String, Swift.String>",
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
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Functions.TheError(ptr));
                    })),
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
            Once("setup_OptionalConverter<UInt>", () => {
                Console.WriteLine("setting up Optional<UInt>...");
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
                    bag<_Primitives_PrimitiveHolderConstructor>((bool b, ConsumedRef bq, byte ui8, ConsumedRef ui8q, ushort ui16, ConsumedRef ui16q, uint ui32, ConsumedRef ui32q, ulong ui64, ConsumedRef ui64q, nuint ui, ConsumedRef uiq, sbyte i8, ConsumedRef i8q, short i16, ConsumedRef i16q, int i32, ConsumedRef i32q, long i64, ConsumedRef i64q, nint i, ConsumedRef iq, float f, ConsumedRef fq, double d, ConsumedRef dq, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Primitives.PrimitiveHolder(
                            b,
                            bq.Consume<bool?>(),
                            ui8,
                            ui8q.Consume<byte?>(),
                            ui16,
                            ui16q.Consume<ushort?>(),
                            ui32,
                            ui32q.Consume<uint?>(),
                            ui64,
                            ui64q.Consume<ulong?>(),
                            ui,
                            uiq.Consume<nuint?>(),
                            i8,
                            i8q.Consume<sbyte?>(),
                            i16,
                            i16q.Consume<short?>(),
                            i32,
                            i32q.Consume<int?>(),
                            i64,
                            i64q.Consume<long?>(),
                            i,
                            iq.Consume<nint?>(),
                            f,
                            fq.Consume<float?>(),
                            d,
                            dq.Consume<double?>()
                        ));
                    })),
                    bag<_Primitives_PrimitiveHolder_bGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().B
                    )),
                    bag<_Primitives_PrimitiveHolder_bSetter>((UnownedRef obj, bool newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().B = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_bqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Bq)
                    )),
                    bag<_Primitives_PrimitiveHolder_bqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Bq = newValue.Consume<bool?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_ui8Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8
                    )),
                    bag<_Primitives_PrimitiveHolder_ui8Setter>((UnownedRef obj, byte newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui8qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui8qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8q = newValue.Consume<byte?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_ui16Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16
                    )),
                    bag<_Primitives_PrimitiveHolder_ui16Setter>((UnownedRef obj, ushort newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui16qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui16qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16q = newValue.Consume<ushort?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_ui32Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32
                    )),
                    bag<_Primitives_PrimitiveHolder_ui32Setter>((UnownedRef obj, uint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui32qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui32qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32q = newValue.Consume<uint?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_ui64Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64
                    )),
                    bag<_Primitives_PrimitiveHolder_ui64Setter>((UnownedRef obj, ulong newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_ui64qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64q)
                    )),
                    bag<_Primitives_PrimitiveHolder_ui64qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64q = newValue.Consume<ulong?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_uiGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui
                    )),
                    bag<_Primitives_PrimitiveHolder_uiSetter>((UnownedRef obj, nuint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_uiqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Uiq)
                    )),
                    bag<_Primitives_PrimitiveHolder_uiqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Uiq = newValue.Consume<nuint?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_i8Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8
                    )),
                    bag<_Primitives_PrimitiveHolder_i8Setter>((UnownedRef obj, sbyte newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i8qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i8qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8q = newValue.Consume<sbyte?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_i16Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16
                    )),
                    bag<_Primitives_PrimitiveHolder_i16Setter>((UnownedRef obj, short newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i16qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i16qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16q = newValue.Consume<short?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_i32Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32
                    )),
                    bag<_Primitives_PrimitiveHolder_i32Setter>((UnownedRef obj, int newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i32qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i32qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32q = newValue.Consume<int?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_i64Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64
                    )),
                    bag<_Primitives_PrimitiveHolder_i64Setter>((UnownedRef obj, long newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64 = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_i64qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64q)
                    )),
                    bag<_Primitives_PrimitiveHolder_i64qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64q = newValue.Consume<long?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_iGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I
                    )),
                    bag<_Primitives_PrimitiveHolder_iSetter>((UnownedRef obj, nint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_iqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Iq)
                    )),
                    bag<_Primitives_PrimitiveHolder_iqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Iq = newValue.Consume<nint?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_fGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().F
                    )),
                    bag<_Primitives_PrimitiveHolder_fSetter>((UnownedRef obj, float newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().F = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_fqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Fq)
                    )),
                    bag<_Primitives_PrimitiveHolder_fqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Fq = newValue.Consume<float?>();
                    })),
                    bag<_Primitives_PrimitiveHolder_dGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().D
                    )),
                    bag<_Primitives_PrimitiveHolder_dSetter>((UnownedRef obj, double newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().D = newValue;
                    })),
                    bag<_Primitives_PrimitiveHolder_dqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Dq)
                    )),
                    bag<_Primitives_PrimitiveHolder_dqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Dq = newValue.Consume<double?>();
                    })),
                    out exn
                ));
            });
            Once("setup_RangeConverter<Int16>", () => {
                Console.WriteLine("setting up Range<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<short>(
                    "RangeConverter<Int16>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Int32>", () => {
                Console.WriteLine("setting up Range<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<int>(
                    "RangeConverter<Int32>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Int64>", () => {
                Console.WriteLine("setting up Range<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<long>(
                    "RangeConverter<Int64>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Int8>", () => {
                Console.WriteLine("setting up Range<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<sbyte>(
                    "RangeConverter<Int8>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Int>", () => {
                Console.WriteLine("setting up Range<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<nint>(
                    "RangeConverter<Int>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<UInt16>", () => {
                Console.WriteLine("setting up Range<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<ushort>(
                    "RangeConverter<UInt16>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<UInt32>", () => {
                Console.WriteLine("setting up Range<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<uint>(
                    "RangeConverter<UInt32>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<UInt64>", () => {
                Console.WriteLine("setting up Range<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<ulong>(
                    "RangeConverter<UInt64>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<UInt8>", () => {
                Console.WriteLine("setting up Range<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<byte>(
                    "RangeConverter<UInt8>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<UInt>", () => {
                Console.WriteLine("setting up Range<UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_RangeConverter_setup<nuint>(
                    "RangeConverter<UInt>",
                    out exn
                ));
            });
            Once("setup_Ranges", () => {
                Console.WriteLine("setting up Ranges...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Ranges_setup(
                    out exn
                ));
            });
            Once("setup_SetConverter<Bool>", () => {
                Console.WriteLine("setting up Set<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup<bool>(
                    "SetConverter<Bool>",
                    out exn
                ));
            });
            Once("setup_SetConverter<Int>", () => {
                Console.WriteLine("setting up Set<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup<nint>(
                    "SetConverter<Int>",
                    out exn
                ));
            });
            Once("setup_SetConverter<OptionalConverter<Int>>", () => {
                Console.WriteLine("setting up Set<Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup<nint?>(
                    "SetConverter<OptionalConverter<Int>>",
                    out exn
                ));
            });
            Once("setup_SetConverter<Swift.String>", () => {
                Console.WriteLine("setting up Set<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesRuntime_SetConverter_setup<string>(
                    "SetConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_SimpleEnum", () => {
                Console.WriteLine("setting up SimpleEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_SimpleEnum_setup(
                    bag<FishyJoesRuntime.EnumDiscriminator>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        var enumeration = obj.Peek<Cricut.TestAPI.SimpleEnum>();
                        if (enumeration is Cricut.TestAPI.SimpleEnum.Red) { return (nint)0; }
                        if (enumeration is Cricut.TestAPI.SimpleEnum.Green) { return (nint)1; }
                        if (enumeration is Cricut.TestAPI.SimpleEnum.Blue) { return (nint)2; }
                        throw new Exception($"Found unexpected subclass of Cricut.TestAPI.SimpleEnum: {enumeration}");
                    })),
                    bag<Cricut_TestAPI_SimpleEnum_new_red>(
                        (
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.SimpleEnum.Red(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_extract_red>(
                        (
                            UnownedRef obj,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.SimpleEnum.Red>();
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_new_green>(
                        (
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.SimpleEnum.Green(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_extract_green>(
                        (
                            UnownedRef obj,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.SimpleEnum.Green>();
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_new_blue>(
                        (
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.SimpleEnum.Blue(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_SimpleEnum_extract_blue>(
                        (
                            UnownedRef obj,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.SimpleEnum.Blue>();
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
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
                    bag<_Structs_MemberwiseStructConstructor>((ConsumedRef immutable, ConsumedRef mutable, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Structs.MemberwiseStruct(
                            immutable.Consume<string>(),
                            mutable.Consume<string>()
                        ));
                    })),
                    bag<_Structs_MemberwiseStruct_immutableGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Immutable)
                    )),
                    bag<_Structs_MemberwiseStruct_immutableSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Immutable = newValue.Consume<string>();
                    })),
                    bag<_Structs_MemberwiseStruct_mutableGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Mutable)
                    )),
                    bag<_Structs_MemberwiseStruct_mutableSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Mutable = newValue.Consume<string>();
                    })),
                    out exn
                ));
            });
            Once("setup_Structs.MutableStruct", () => {
                Console.WriteLine("setting up Structs.MutableStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_MutableStruct_setup(
                    bag<_Structs_MutableStructConstructor>((nint i, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Structs.MutableStruct(
                            i
                        ));
                    })),
                    bag<_Structs_MutableStruct_iGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Structs.MutableStruct>().I
                    )),
                    bag<_Structs_MutableStruct_iSetter>((UnownedRef obj, nint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Structs.MutableStruct>().I = newValue;
                    })),
                    out exn
                ));
            });
            Once("setup_Structs.ReferenceStruct", () => {
                Console.WriteLine("setting up Structs.ReferenceStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_ReferenceStruct_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Structs.ReferenceStruct(ptr));
                    })),
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
