using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

using static Cricut.FishyJoesRuntime.Loader;

namespace Cricut.TestAPI {
    public class _TypeSetup {
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoes_TestAPI_registerTypes();

        delegate CreatedRef _Foundation_AttributedString_PuttingTypesIntoQuestionablePlacesConstructor(
            ConsumedRef x,
            out CreatedRef exn
        );
        delegate CreatedRef _Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_xGetter(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup(
            IntPtr envRef,
            _Foundation_AttributedString_PuttingTypesIntoQuestionablePlacesConstructor constructor,
            _Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_xGetter get_x,
            out CreatedRef _exn
        );

        delegate CreatedRef _Swift_String_PuttingTypesIntoQuestionablePlacesConstructor(
            ConsumedRef x,
            out CreatedRef exn
        );
        delegate CreatedRef _Swift_String_PuttingTypesIntoQuestionablePlaces_xGetter(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
            IntPtr envRef,
            _Swift_String_PuttingTypesIntoQuestionablePlacesConstructor constructor,
            _Swift_String_PuttingTypesIntoQuestionablePlaces_xGetter get_x,
            out CreatedRef _exn
        );

        delegate CreatedRef Cricut_TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing(
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing(
            UnownedRef obj,
            out CreatedRef _exn
        );
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
            IntPtr envRef,
            FishyJoesRuntime.EnumDiscriminator discriminator,
            Cricut_TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing thing_constructor,
            Cricut_TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing thing_extractor,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Actors_TemperatureLogger_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_Collections_CollectionHolderConstructor(
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
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_boolArrayGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_boolArraySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_boolSetGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_boolSetSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_boolDictionaryGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_boolDictionarySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_integerArrayGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_integerArraySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_integerSetGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_integerSetSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_integerDictionaryGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_integerDictionarySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_stringArrayGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_stringArraySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_stringSetGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_stringSetSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Collections_CollectionHolder_stringDictionaryGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Collections_CollectionHolder_stringDictionarySetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Collections_CollectionHolder_setup(
            IntPtr envRef,
            _TestAPI_Collections_CollectionHolderConstructor constructor,
            _TestAPI_Collections_CollectionHolder_boolArrayGetter get_boolArray,
            _TestAPI_Collections_CollectionHolder_boolArraySetter set_boolArray,
            _TestAPI_Collections_CollectionHolder_boolSetGetter get_boolSet,
            _TestAPI_Collections_CollectionHolder_boolSetSetter set_boolSet,
            _TestAPI_Collections_CollectionHolder_boolDictionaryGetter get_boolDictionary,
            _TestAPI_Collections_CollectionHolder_boolDictionarySetter set_boolDictionary,
            _TestAPI_Collections_CollectionHolder_integerArrayGetter get_integerArray,
            _TestAPI_Collections_CollectionHolder_integerArraySetter set_integerArray,
            _TestAPI_Collections_CollectionHolder_integerSetGetter get_integerSet,
            _TestAPI_Collections_CollectionHolder_integerSetSetter set_integerSet,
            _TestAPI_Collections_CollectionHolder_integerDictionaryGetter get_integerDictionary,
            _TestAPI_Collections_CollectionHolder_integerDictionarySetter set_integerDictionary,
            _TestAPI_Collections_CollectionHolder_stringArrayGetter get_stringArray,
            _TestAPI_Collections_CollectionHolder_stringArraySetter set_stringArray,
            _TestAPI_Collections_CollectionHolder_stringSetGetter get_stringSet,
            _TestAPI_Collections_CollectionHolder_stringSetSetter set_stringSet,
            _TestAPI_Collections_CollectionHolder_stringDictionaryGetter get_stringDictionary,
            _TestAPI_Collections_CollectionHolder_stringDictionarySetter set_stringDictionary,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolderConstructor(
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
        delegate bool _TestAPI_Primitives_PrimitiveHolder_bGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_bSetter(UnownedRef obj, bool newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_bqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_bqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate byte _TestAPI_Primitives_PrimitiveHolder_ui8Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui8Setter(UnownedRef obj, byte newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_ui8qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui8qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate ushort _TestAPI_Primitives_PrimitiveHolder_ui16Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui16Setter(UnownedRef obj, ushort newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_ui16qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui16qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate uint _TestAPI_Primitives_PrimitiveHolder_ui32Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui32Setter(UnownedRef obj, uint newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_ui32qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui32qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate ulong _TestAPI_Primitives_PrimitiveHolder_ui64Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui64Setter(UnownedRef obj, ulong newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_ui64qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_ui64qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate nuint _TestAPI_Primitives_PrimitiveHolder_uiGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_uiSetter(UnownedRef obj, nuint newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_uiqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_uiqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate sbyte _TestAPI_Primitives_PrimitiveHolder_i8Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i8Setter(UnownedRef obj, sbyte newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_i8qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i8qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate short _TestAPI_Primitives_PrimitiveHolder_i16Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i16Setter(UnownedRef obj, short newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_i16qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i16qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate int _TestAPI_Primitives_PrimitiveHolder_i32Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i32Setter(UnownedRef obj, int newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_i32qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i32qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate long _TestAPI_Primitives_PrimitiveHolder_i64Getter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i64Setter(UnownedRef obj, long newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_i64qGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_i64qSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate nint _TestAPI_Primitives_PrimitiveHolder_iGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_iSetter(UnownedRef obj, nint newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_iqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_iqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate float _TestAPI_Primitives_PrimitiveHolder_fGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_fSetter(UnownedRef obj, float newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_fqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_fqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate double _TestAPI_Primitives_PrimitiveHolder_dGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_dSetter(UnownedRef obj, double newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Primitives_PrimitiveHolder_dqGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Primitives_PrimitiveHolder_dqSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Primitives_PrimitiveHolder_setup(
            IntPtr envRef,
            _TestAPI_Primitives_PrimitiveHolderConstructor constructor,
            _TestAPI_Primitives_PrimitiveHolder_bGetter get_b,
            _TestAPI_Primitives_PrimitiveHolder_bSetter set_b,
            _TestAPI_Primitives_PrimitiveHolder_bqGetter get_bq,
            _TestAPI_Primitives_PrimitiveHolder_bqSetter set_bq,
            _TestAPI_Primitives_PrimitiveHolder_ui8Getter get_ui8,
            _TestAPI_Primitives_PrimitiveHolder_ui8Setter set_ui8,
            _TestAPI_Primitives_PrimitiveHolder_ui8qGetter get_ui8q,
            _TestAPI_Primitives_PrimitiveHolder_ui8qSetter set_ui8q,
            _TestAPI_Primitives_PrimitiveHolder_ui16Getter get_ui16,
            _TestAPI_Primitives_PrimitiveHolder_ui16Setter set_ui16,
            _TestAPI_Primitives_PrimitiveHolder_ui16qGetter get_ui16q,
            _TestAPI_Primitives_PrimitiveHolder_ui16qSetter set_ui16q,
            _TestAPI_Primitives_PrimitiveHolder_ui32Getter get_ui32,
            _TestAPI_Primitives_PrimitiveHolder_ui32Setter set_ui32,
            _TestAPI_Primitives_PrimitiveHolder_ui32qGetter get_ui32q,
            _TestAPI_Primitives_PrimitiveHolder_ui32qSetter set_ui32q,
            _TestAPI_Primitives_PrimitiveHolder_ui64Getter get_ui64,
            _TestAPI_Primitives_PrimitiveHolder_ui64Setter set_ui64,
            _TestAPI_Primitives_PrimitiveHolder_ui64qGetter get_ui64q,
            _TestAPI_Primitives_PrimitiveHolder_ui64qSetter set_ui64q,
            _TestAPI_Primitives_PrimitiveHolder_uiGetter get_ui,
            _TestAPI_Primitives_PrimitiveHolder_uiSetter set_ui,
            _TestAPI_Primitives_PrimitiveHolder_uiqGetter get_uiq,
            _TestAPI_Primitives_PrimitiveHolder_uiqSetter set_uiq,
            _TestAPI_Primitives_PrimitiveHolder_i8Getter get_i8,
            _TestAPI_Primitives_PrimitiveHolder_i8Setter set_i8,
            _TestAPI_Primitives_PrimitiveHolder_i8qGetter get_i8q,
            _TestAPI_Primitives_PrimitiveHolder_i8qSetter set_i8q,
            _TestAPI_Primitives_PrimitiveHolder_i16Getter get_i16,
            _TestAPI_Primitives_PrimitiveHolder_i16Setter set_i16,
            _TestAPI_Primitives_PrimitiveHolder_i16qGetter get_i16q,
            _TestAPI_Primitives_PrimitiveHolder_i16qSetter set_i16q,
            _TestAPI_Primitives_PrimitiveHolder_i32Getter get_i32,
            _TestAPI_Primitives_PrimitiveHolder_i32Setter set_i32,
            _TestAPI_Primitives_PrimitiveHolder_i32qGetter get_i32q,
            _TestAPI_Primitives_PrimitiveHolder_i32qSetter set_i32q,
            _TestAPI_Primitives_PrimitiveHolder_i64Getter get_i64,
            _TestAPI_Primitives_PrimitiveHolder_i64Setter set_i64,
            _TestAPI_Primitives_PrimitiveHolder_i64qGetter get_i64q,
            _TestAPI_Primitives_PrimitiveHolder_i64qSetter set_i64q,
            _TestAPI_Primitives_PrimitiveHolder_iGetter get_i,
            _TestAPI_Primitives_PrimitiveHolder_iSetter set_i,
            _TestAPI_Primitives_PrimitiveHolder_iqGetter get_iq,
            _TestAPI_Primitives_PrimitiveHolder_iqSetter set_iq,
            _TestAPI_Primitives_PrimitiveHolder_fGetter get_f,
            _TestAPI_Primitives_PrimitiveHolder_fSetter set_f,
            _TestAPI_Primitives_PrimitiveHolder_fqGetter get_fq,
            _TestAPI_Primitives_PrimitiveHolder_fqSetter set_fq,
            _TestAPI_Primitives_PrimitiveHolder_dGetter get_d,
            _TestAPI_Primitives_PrimitiveHolder_dSetter set_d,
            _TestAPI_Primitives_PrimitiveHolder_dqGetter get_dq,
            _TestAPI_Primitives_PrimitiveHolder_dqSetter set_dq,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_Structs_MemberwiseStructConstructor(
            ConsumedRef immutable,
            ConsumedRef mutable,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_Structs_MemberwiseStruct_immutableGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Structs_MemberwiseStruct_immutableSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate CreatedRef _TestAPI_Structs_MemberwiseStruct_mutableGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Structs_MemberwiseStruct_mutableSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_MemberwiseStruct_setup(
            IntPtr envRef,
            _TestAPI_Structs_MemberwiseStructConstructor constructor,
            _TestAPI_Structs_MemberwiseStruct_immutableGetter get_immutable,
            _TestAPI_Structs_MemberwiseStruct_immutableSetter set_immutable,
            _TestAPI_Structs_MemberwiseStruct_mutableGetter get_mutable,
            _TestAPI_Structs_MemberwiseStruct_mutableSetter set_mutable,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_Structs_MutableStructConstructor(
            nint i,
            out CreatedRef exn
        );
        delegate nint _TestAPI_Structs_MutableStruct_iGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_Structs_MutableStruct_iSetter(UnownedRef obj, nint newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_MutableStruct_setup(
            IntPtr envRef,
            _TestAPI_Structs_MutableStructConstructor constructor,
            _TestAPI_Structs_MutableStruct_iGetter get_i,
            _TestAPI_Structs_MutableStruct_iSetter set_i,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_ReferenceStruct_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__AProtocolConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate bool _TestAPI_CommonInterface__AProtocolConverter_Getbaz(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__AProtocolConverter_Getfoo(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__AProtocolConverter_bar(UnownedRef obj, nint x, nint y, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__AProtocolConverter_hasADefaultImplementation(UnownedRef obj, nint x, double y, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__AProtocolConverter_hasADefaultImplementation2(UnownedRef obj, string a, bool b, string c, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__AProtocolConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__AProtocolConverterConstructor constructor,
            _TestAPI_CommonInterface__AProtocolConverter_Getbaz Getbaz,
            _TestAPI_CommonInterface__AProtocolConverter_Getfoo Getfoo,
            _TestAPI_CommonInterface__AProtocolConverter_bar bar,
            _TestAPI_CommonInterface__AProtocolConverter_hasADefaultImplementation hasADefaultImplementation,
            _TestAPI_CommonInterface__AProtocolConverter_hasADefaultImplementation2 hasADefaultImplementation2,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_AProtocolImplementationConstructor(
            ConsumedRef foo,
            bool baz,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_AProtocolImplementation_fooGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_AProtocolImplementation_fooSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        delegate bool _TestAPI_AProtocolImplementation_bazGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_AProtocolImplementation_bazSetter(UnownedRef obj, bool newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_AProtocolImplementation_setup(
            IntPtr envRef,
            _TestAPI_AProtocolImplementationConstructor constructor,
            _TestAPI_AProtocolImplementation_fooGetter get_foo,
            _TestAPI_AProtocolImplementation_fooSetter set_foo,
            _TestAPI_AProtocolImplementation_bazGetter get_baz,
            _TestAPI_AProtocolImplementation_bazSetter set_baz,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Actors_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

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
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_AssociatedDataEnum_setup(
            IntPtr envRef,
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

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_AsyncFunctions_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_AttributedStrings_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Bytes_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_ClosedRanges_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Collections_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_DefaultArguments_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Deprecations_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyClass_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyClass2_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyEnum_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_EmptyStructConstructor(
            out CreatedRef exn
        );
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyStruct_setup(
            IntPtr envRef,
            _TestAPI_EmptyStructConstructor constructor,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_EmptyStruct2Constructor(
            out CreatedRef exn
        );
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_EmptyStruct2_setup(
            IntPtr envRef,
            _TestAPI_EmptyStruct2Constructor constructor,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Functions_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Methods_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Primitives_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Ranges_setup(
            IntPtr envRef,
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
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_SimpleEnum_setup(
            IntPtr envRef,
            FishyJoesRuntime.EnumDiscriminator discriminator,
            Cricut_TestAPI_SimpleEnum_new_red red_constructor,
            Cricut_TestAPI_SimpleEnum_extract_red red_extractor,
            Cricut_TestAPI_SimpleEnum_new_green green_constructor,
            Cricut_TestAPI_SimpleEnum_extract_green green_extractor,
            Cricut_TestAPI_SimpleEnum_new_blue blue_constructor,
            Cricut_TestAPI_SimpleEnum_extract_blue blue_extractor,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Strings_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Structs_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStructConstructor(
            ConsumedRef const42,
            ConsumedRef iabs,
            ConsumedRef intCompose,
            ConsumedRef add3Things,
            ConsumedRef makeList,
            ConsumedRef fifthThing,
            ConsumedRef six,
            ConsumedRef willThrow,
            ConsumedRef exercise0Fun,
            ConsumedRef exercise1Fun,
            ConsumedRef exercise2Fun,
            ConsumedRef exercise3Fun,
            ConsumedRef exercise4Fun,
            ConsumedRef exercise5Fun,
            ConsumedRef exercise6Fun,
            ConsumedRef thunkTwiceMakerFun,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_const42Getter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_iabsGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_intComposeGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_add3ThingsGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_makeListGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_fifthThingGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_sixGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_willThrowGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0FunGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1FunGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2FunGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3FunGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4FunGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5FunGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6FunGetter(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMakerFunGetter(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestAsyncForeignSideFunctionsStruct_setup(
            IntPtr envRef,
            _TestAPI_TestAsyncForeignSideFunctionsStructConstructor constructor,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_const42Getter get_const42,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_iabsGetter get_iabs,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_intComposeGetter get_intCompose,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_add3ThingsGetter get_add3Things,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_makeListGetter get_makeList,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_fifthThingGetter get_fifthThing,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_sixGetter get_six,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_willThrowGetter get_willThrow,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0FunGetter get_exercise0Fun,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1FunGetter get_exercise1Fun,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2FunGetter get_exercise2Fun,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3FunGetter get_exercise3Fun,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4FunGetter get_exercise4Fun,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5FunGetter get_exercise5Fun,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6FunGetter get_exercise6Fun,
            _TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMakerFunGetter get_thunkTwiceMakerFun,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getadd3Things(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getconst42(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetfifthThing(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getiabs(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetintCompose(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetmakeList(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getsix(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetwillThrow(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise0(UnownedRef obj, System.Func<System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise1(UnownedRef obj, System.Func<nint, System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise2(UnownedRef obj, System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise3(UnownedRef obj, System.Func<float, double, nint, System.Threading.Tasks.Task<double>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise4(UnownedRef obj, System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise5(UnownedRef obj, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise6(UnownedRef obj, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_thunkTwiceMaker(UnownedRef obj, System.Func<System.Threading.Tasks.Task> thunk, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_defaultExercise6(UnownedRef obj, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestAsyncFunctionsConverter_witness(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverterConstructor constructor,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getadd3Things Getadd3Things,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getconst42 Getconst42,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetfifthThing GetfifthThing,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getiabs Getiabs,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetintCompose GetintCompose,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetmakeList GetmakeList,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getsix Getsix,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetwillThrow GetwillThrow,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise0 exercise0,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise1 exercise1,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise2 exercise2,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise3 exercise3,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise4 exercise4,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise5 exercise5,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise6 exercise6,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_thunkTwiceMaker thunkTwiceMaker,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_defaultExercise6 defaultExercise6,
            _TestAPI_CommonInterface__TestAsyncFunctionsConverter_witness witness,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestAsyncSwiftSideFunctionsClass_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__TestDefaultComputedPropertiesConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate nint _TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_Getnoot(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_Getpluto(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__TestDefaultComputedPropertiesConverterConstructor constructor,
            _TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_Getnoot Getnoot,
            _TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_Getpluto Getpluto,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestDefaultComputedPropertiesClass_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        delegate CreatedRef Cricut_TestAPI_TestDefaultComputedPropertiesEnum_new_qux(
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_TestDefaultComputedPropertiesEnum_extract_qux(
            UnownedRef obj,
            out CreatedRef _exn
        );
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestDefaultComputedPropertiesEnum_setup(
            IntPtr envRef,
            FishyJoesRuntime.EnumDiscriminator discriminator,
            Cricut_TestAPI_TestDefaultComputedPropertiesEnum_new_qux qux_constructor,
            Cricut_TestAPI_TestDefaultComputedPropertiesEnum_extract_qux qux_extractor,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_TestDefaultComputedPropertiesStructConstructor(
            bool spam,
            nint noot,
            out CreatedRef exn
        );
        delegate bool _TestAPI_TestDefaultComputedPropertiesStruct_spamGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_TestDefaultComputedPropertiesStruct_spamSetter(UnownedRef obj, bool newValue, out CreatedRef exn);
        delegate nint _TestAPI_TestDefaultComputedPropertiesStruct_nootGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_TestDefaultComputedPropertiesStruct_nootSetter(UnownedRef obj, nint newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestDefaultComputedPropertiesStruct_setup(
            IntPtr envRef,
            _TestAPI_TestDefaultComputedPropertiesStructConstructor constructor,
            _TestAPI_TestDefaultComputedPropertiesStruct_spamGetter get_spam,
            _TestAPI_TestDefaultComputedPropertiesStruct_spamSetter set_spam,
            _TestAPI_TestDefaultComputedPropertiesStruct_nootGetter get_noot,
            _TestAPI_TestDefaultComputedPropertiesStruct_nootSetter set_noot,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__TestDifferingExportNameProtocolConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate nint _TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_Gettata(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__TestDifferingExportNameProtocolConverterConstructor constructor,
            _TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_Gettata Gettata,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_TestDifferingExportNameStructConstructor(
            nint tata,
            out CreatedRef exn
        );
        delegate nint _TestAPI_TestDifferingExportNameStruct_tataGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_TestDifferingExportNameStruct_tataSetter(UnownedRef obj, nint newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestDifferingExportNameStruct_setup(
            IntPtr envRef,
            _TestAPI_TestDifferingExportNameStructConstructor constructor,
            _TestAPI_TestDifferingExportNameStruct_tataGetter get_tata,
            _TestAPI_TestDifferingExportNameStruct_tataSetter set_tata,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__TestLeadingUnderscoredPropConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_Get_leadingUnderscoreProp(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__TestLeadingUnderscoredPropConverterConstructor constructor,
            _TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_Get_leadingUnderscoreProp Get_leadingUnderscoreProp,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_TestLeadingUnderscoredPropStructConstructor(
            ConsumedRef _leadingUnderscoreProp,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_TestLeadingUnderscoredPropStruct__leadingUnderscorePropGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_TestLeadingUnderscoredPropStruct__leadingUnderscorePropSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestLeadingUnderscoredPropStruct_setup(
            IntPtr envRef,
            _TestAPI_TestLeadingUnderscoredPropStructConstructor constructor,
            _TestAPI_TestLeadingUnderscoredPropStruct__leadingUnderscorePropGetter get__leadingUnderscoreProp,
            _TestAPI_TestLeadingUnderscoredPropStruct__leadingUnderscorePropSetter set__leadingUnderscoreProp,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__TestMethodsProtocolConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate void _TestAPI_CommonInterface__TestMethodsProtocolConverter_foo(UnownedRef obj, out CreatedRef exn);
        delegate bool _TestAPI_CommonInterface__TestMethodsProtocolConverter_bar(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_CommonInterface__TestMethodsProtocolConverter_baz(UnownedRef obj, bool qux, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestMethodsProtocolConverter_garply(UnownedRef obj, string _0, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestMethodsProtocolConverter_xyzzy(UnownedRef obj, nint thud, System.Collections.Generic.IList<double> grault, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestMethodsProtocolConverter_plugh(UnownedRef obj, System.Tuple<bool, double, System.Collections.Generic.IList<string>> fred, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__TestMethodsProtocolConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__TestMethodsProtocolConverterConstructor constructor,
            _TestAPI_CommonInterface__TestMethodsProtocolConverter_foo foo,
            _TestAPI_CommonInterface__TestMethodsProtocolConverter_bar bar,
            _TestAPI_CommonInterface__TestMethodsProtocolConverter_baz baz,
            _TestAPI_CommonInterface__TestMethodsProtocolConverter_garply garply,
            _TestAPI_CommonInterface__TestMethodsProtocolConverter_xyzzy xyzzy,
            _TestAPI_CommonInterface__TestMethodsProtocolConverter_plugh plugh,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__TestOptionalsProtocolConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_CommonInterface__TestOptionalsProtocolConverter_Getflarp(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestOptionalsProtocolConverter_wombat(UnownedRef obj, nint? zxc, out CreatedRef exn);
        delegate nint _TestAPI_CommonInterface__TestOptionalsProtocolConverter_spqr(UnownedRef obj, Cricut.TestAPI.AssociatedDataEnum pippo, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__TestOptionalsProtocolConverterConstructor constructor,
            _TestAPI_CommonInterface__TestOptionalsProtocolConverter_Getflarp Getflarp,
            _TestAPI_CommonInterface__TestOptionalsProtocolConverter_wombat wombat,
            _TestAPI_CommonInterface__TestOptionalsProtocolConverter_spqr spqr,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_CommonInterface__TestPropertiesProtocolConverterConstructor(
            ConsumedRef ptr,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_CommonInterface__TestPropertiesProtocolConverter_Getcorge(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef _TestAPI_CommonInterface__TestPropertiesProtocolConverter_Getfrob(UnownedRef obj, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup(
            IntPtr envRef,
            _TestAPI_CommonInterface__TestPropertiesProtocolConverterConstructor constructor,
            _TestAPI_CommonInterface__TestPropertiesProtocolConverter_Getcorge Getcorge,
            _TestAPI_CommonInterface__TestPropertiesProtocolConverter_Getfrob Getfrob,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestProtocolClass_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        delegate CreatedRef Cricut_TestAPI_TestProtocolEnum_new_qux(
            out CreatedRef _exn
        );
        unsafe delegate void Cricut_TestAPI_TestProtocolEnum_extract_qux(
            UnownedRef obj,
            out CreatedRef _exn
        );
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestProtocolEnum_setup(
            IntPtr envRef,
            FishyJoesRuntime.EnumDiscriminator discriminator,
            Cricut_TestAPI_TestProtocolEnum_new_qux qux_constructor,
            Cricut_TestAPI_TestProtocolEnum_extract_qux qux_extractor,
            out CreatedRef _exn
        );

        delegate CreatedRef _TestAPI_TestProtocolStructConstructor(
            ConsumedRef corge,
            out CreatedRef exn
        );
        delegate CreatedRef _TestAPI_TestProtocolStruct_corgeGetter(UnownedRef obj, out CreatedRef exn);
        delegate void _TestAPI_TestProtocolStruct_corgeSetter(UnownedRef obj, ConsumedRef newValue, out CreatedRef exn);
        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_TestProtocolStruct_setup(
            IntPtr envRef,
            _TestAPI_TestProtocolStructConstructor constructor,
            _TestAPI_TestProtocolStruct_corgeGetter get_corge,
            _TestAPI_TestProtocolStruct_corgeSetter set_corge,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_Tuples_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void TestAPI_URLs_setup(
            IntPtr envRef,
            out CreatedRef _exn
        );

        public static void _ensureLoaded() {}

        static _TypeSetup() {
            // There's no explicit way to call the static constructor, so do this instead
            FishyJoesRuntime.Loader.ensureLoaded();
            FishyJoes_TestAPI_registerTypes();

            Once("setup_Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (@escaping (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<string>, System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>>(
                    Loader.env,
                    "Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>", () => {
                Console.WriteLine("setting up (@escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) async throws -> String...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (@escaping (Swift.Float, Swift.Double, Swift.Int) async throws -> Swift.Double) throws -> Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<string>, System.Func<float, double, nint, System.Threading.Tasks.Task<double>>>(
                    Loader.env,
                    "Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up (@escaping (Swift.Int) throws -> Swift.Int, @escaping (Swift.Int) throws -> Swift.Int) throws -> (Swift.Int) throws -> Swift.Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function2Converter_setup<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>(
                    Loader.env,
                    "Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function2Converter_setup<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (@escaping (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<string>, System.Func<nint, System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<string>, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) async throws -> () async throws -> Swift.Int) throws -> Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<string>, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>>(
                    Loader.env,
                    "Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (@escaping (Swift.String, Swift.String, Swift.String, Swift.String) async throws -> Array<Swift.String>) throws -> Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<string>, System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>>(
                    Loader.env,
                    "Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>", () => {
                Console.WriteLine("setting up (@escaping (Float, Double, Int) async throws -> Double) async throws -> String...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up (@escaping (Int) throws -> Int, @escaping (Int) throws -> Int) throws -> (Int) throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function2Converter_setup<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>(
                    Loader.env,
                    "Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function2Converter_setup<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>", () => {
                Console.WriteLine("setting up (@escaping (Int) async throws -> Int) async throws -> String...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>", () => {
                Console.WriteLine("setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>", () => {
                Console.WriteLine("setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) async throws -> String...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>", () => {
                Console.WriteLine("setting up (@escaping (String, String, String, String) async throws -> Array<String>) async throws -> String...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (@escaping () async throws -> Swift.Int) throws -> Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<string>, System.Func<System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>", () => {
                Console.WriteLine("setting up (@escaping () async throws -> Int) async throws -> String...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>", () => {
                Console.WriteLine("setting up (@escaping () async throws -> Void) throws -> () async throws -> Void...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Func<System.Threading.Tasks.Task>, System.Func<System.Threading.Tasks.Task>>(
                    Loader.env,
                    "Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () => {
                Console.WriteLine("setting up (Optional<Array<Optional<Swift.Int>>>) throws -> Optional<Array<Optional<Swift.Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Collections.Generic.IList<nint?>?, System.Collections.Generic.IList<nint?>?>(
                    Loader.env,
                    "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () => {
                Console.WriteLine("setting up (Optional<Array<Optional<Int>>>) throws -> Optional<Array<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Collections.Generic.IList<nint?>?, System.Collections.Generic.IList<nint?>?>(
                    Loader.env,
                    "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", () => {
                Console.WriteLine("setting up (Optional<Swift.UInt8>) throws -> Optional<Swift.UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<byte?, byte?>(
                    Loader.env,
                    "Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", () => {
                Console.WriteLine("setting up (Optional<UInt8>) throws -> Optional<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<byte?, byte?>(
                    Loader.env,
                    "Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>",
                    out exn
                ));
            });
            Once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>", () => {
                Console.WriteLine("setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Future<Swift.Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function3Converter_setup<System.Threading.Tasks.Task<double>, float, double, nint>(
                    Loader.env,
                    "Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>",
                    out exn
                ));
            });
            Once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () => {
                Console.WriteLine("setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Swift.Double...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function3Converter_setup<double, float, double, nint>(
                    Loader.env,
                    "Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<Swift.Int, FutureConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up (Swift.Int) throws -> Future<Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Threading.Tasks.Task<nint>, nint>(
                    Loader.env,
                    "Function1Converter<Swift.Int, FutureConverter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (Swift.Int) throws -> Swift.Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<nint, nint>(
                    Loader.env,
                    "Function1Converter<Swift.Int, Swift.Int>",
                    out exn
                ));
            });
            Once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int, Swift.Int) throws -> Swift.Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function6Converter_setup<nint, string, nint, double, string, System.Func<nint>, nint>(
                    Loader.env,
                    "Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>",
                    out exn
                ));
            });
            Once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", () => {
                Console.WriteLine("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int) throws -> () throws -> Swift.Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function5Converter_setup<System.Func<nint>, string, nint, double, string, System.Func<nint>>(
                    Loader.env,
                    "Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) throws -> Future<Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function6Converter_setup<System.Threading.Tasks.Task<nint>, string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint>(
                    Loader.env,
                    "Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>", () => {
                Console.WriteLine("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) throws -> Future<() async throws -> Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function5Converter_setup<System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>, string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>",
                    out exn
                ));
            });
            Once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>", () => {
                Console.WriteLine("setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Future<Array<Swift.String>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function4Converter_setup<System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>, string, string, string, string>(
                    Loader.env,
                    "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>",
                    out exn
                ));
            });
            Once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Array<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function4Converter_setup<System.Collections.Generic.IList<string>, string, string, string, string>(
                    Loader.env,
                    "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () => {
                Console.WriteLine("setting up (Float, Double, Int) throws -> Double...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function3Converter_setup<double, float, double, nint>(
                    Loader.env,
                    "Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () => {
                Console.WriteLine("setting up (Float, Double, Int) async throws -> Double...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction3Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function1Converter<Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (Int) throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<nint, nint>(
                    Loader.env,
                    "Function1Converter<Swift.Int, Swift.Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction1Converter<Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (Int) async throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, @escaping () throws -> Int, Int) throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function6Converter_setup<nint, string, nint, double, string, System.Func<nint>, nint>(
                    Loader.env,
                    "Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>",
                    out exn
                ));
            });
            Once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, @escaping () throws -> Int) throws -> () throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function5Converter_setup<System.Func<nint>, string, nint, double, string, System.Func<nint>>(
                    Loader.env,
                    "Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction6Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction5Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (String, String, String, String) throws -> Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function4Converter_setup<System.Collections.Generic.IList<string>, string, string, string, string>(
                    Loader.env,
                    "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (String, String, String, String) async throws -> Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction4Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function0Converter<FutureConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up () throws -> Future<Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function0Converter_setup<System.Threading.Tasks.Task<nint>>(
                    Loader.env,
                    "Function0Converter<FutureConverter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>", () => {
                Console.WriteLine("setting up () throws -> Future<Void>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function0Converter_setup<System.Threading.Tasks.Task>(
                    Loader.env,
                    "Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>",
                    out exn
                ));
            });
            Once("setup_Function0Converter<Swift.Int>", () => {
                Console.WriteLine("setting up () throws -> Swift.Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function0Converter_setup<nint>(
                    Loader.env,
                    "Function0Converter<Swift.Int>",
                    out exn
                ));
            });
            Once("setup_Function0Converter<Swift.Int>", () => {
                Console.WriteLine("setting up () throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function0Converter_setup<nint>(
                    Loader.env,
                    "Function0Converter<Swift.Int>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction0Converter<Swift.Int>", () => {
                Console.WriteLine("setting up () async throws -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Function0Converter<FishyJoesCommonRuntime.VoidConverter>", () => {
                Console.WriteLine("setting up () throws -> Void...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function0Converter_setup(
                    Loader.env,
                    "Function0Converter<FishyJoesCommonRuntime.VoidConverter>",
                    out exn
                ));
            });
            Once("setup_AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>", () => {
                Console.WriteLine("setting up () async throws -> Void...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_FutureConverter<Function1Converter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up Future<(Swift.Int) throws -> Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Func<nint, nint>>(
                    Loader.env,
                    "FutureConverter<Function1Converter<Swift.Int, Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up Future<(Swift.Int) async throws -> Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Func<nint, System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<Function0Converter<Swift.Int>>", () => {
                Console.WriteLine("setting up Future<() throws -> Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Func<nint>>(
                    Loader.env,
                    "FutureConverter<Function0Converter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<AsyncFunction0Converter<Swift.Int>>", () => {
                Console.WriteLine("setting up Future<() async throws -> Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Func<System.Threading.Tasks.Task<nint>>>(
                    Loader.env,
                    "FutureConverter<AsyncFunction0Converter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>", () => {
                Console.WriteLine("setting up Future<() async throws -> Void>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Func<System.Threading.Tasks.Task>>(
                    Loader.env,
                    "FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>", () => {
                Console.WriteLine("setting up Future<Future<() async throws -> Swift.Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>(
                    Loader.env,
                    "FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>", () => {
                Console.WriteLine("setting up Future<Future<Array<Swift.String>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>(
                    Loader.env,
                    "FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<FutureConverter<Swift.Double>>", () => {
                Console.WriteLine("setting up Future<Future<Swift.Double>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Threading.Tasks.Task<double>>(
                    Loader.env,
                    "FutureConverter<FutureConverter<Swift.Double>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<FutureConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up Future<Future<Swift.Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Threading.Tasks.Task<nint>>(
                    Loader.env,
                    "FutureConverter<FutureConverter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<FutureConverter<Swift.String>>", () => {
                Console.WriteLine("setting up Future<Future<Swift.String>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Threading.Tasks.Task<string>>(
                    Loader.env,
                    "FutureConverter<FutureConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>", () => {
                Console.WriteLine("setting up Future<Future<Void>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Threading.Tasks.Task>(
                    Loader.env,
                    "FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up Future<Array<Swift.String>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Collections.Generic.IList<string>>(
                    Loader.env,
                    "FutureConverter<ArrayConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () => {
                Console.WriteLine("setting up Future<Optional<Array<Optional<Swift.Int>>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<System.Collections.Generic.IList<nint?>?>(
                    Loader.env,
                    "FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<OptionalConverter<Swift.UInt8>>", () => {
                Console.WriteLine("setting up Future<Optional<Swift.UInt8>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<byte?>(
                    Loader.env,
                    "FutureConverter<OptionalConverter<Swift.UInt8>>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<Swift.Double>", () => {
                Console.WriteLine("setting up Future<Swift.Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<double>(
                    Loader.env,
                    "FutureConverter<Swift.Double>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<Swift.Int>", () => {
                Console.WriteLine("setting up Future<Swift.Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<nint>(
                    Loader.env,
                    "FutureConverter<Swift.Int>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<Swift.String>", () => {
                Console.WriteLine("setting up Future<Swift.String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<string>(
                    Loader.env,
                    "FutureConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<Swift.UInt>", () => {
                Console.WriteLine("setting up Future<Swift.UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<nuint>(
                    Loader.env,
                    "FutureConverter<Swift.UInt>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<FishyJoesCommonRuntime.VoidConverter>", () => {
                Console.WriteLine("setting up Future<Void>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup(
                    Loader.env,
                    "FutureConverter<FishyJoesCommonRuntime.VoidConverter>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Bool>>", () => {
                Console.WriteLine("setting up Array<Optional<Bool>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<bool?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Bool>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Double>>", () => {
                Console.WriteLine("setting up Array<Optional<Double>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<double?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Double>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Float>>", () => {
                Console.WriteLine("setting up Array<Optional<Float>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<float?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Float>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up Array<Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<nint?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Int16>>", () => {
                Console.WriteLine("setting up Array<Optional<Int16>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<short?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Int16>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Int32>>", () => {
                Console.WriteLine("setting up Array<Optional<Int32>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Int32>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Int64>>", () => {
                Console.WriteLine("setting up Array<Optional<Int64>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<long?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Int64>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.Int8>>", () => {
                Console.WriteLine("setting up Array<Optional<Int8>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<sbyte?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.Int8>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.UInt>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<nuint?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.UInt>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.UInt16>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt16>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<ushort?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.UInt16>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.UInt32>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt32>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<uint?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.UInt32>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.UInt64>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt64>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<ulong?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.UInt64>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<OptionalConverter<Swift.UInt8>>", () => {
                Console.WriteLine("setting up Array<Optional<UInt8>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<byte?>(
                    Loader.env,
                    "ArrayConverter<OptionalConverter<Swift.UInt8>>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Foundation.AttributedString.Runs.Run>", () => {
                Console.WriteLine("setting up Array<AttributedString.Runs.Run>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<Cricut.FishyJoesRuntime.AttributedString.RunsView.Run>(
                    Loader.env,
                    "ArrayConverter<Foundation.AttributedString.Runs.Run>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Foundation.AttributedSubstring>", () => {
                Console.WriteLine("setting up Array<AttributedSubstring>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<Cricut.FishyJoesRuntime.AttributedSubstring>(
                    Loader.env,
                    "ArrayConverter<Foundation.AttributedSubstring>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Bool>", () => {
                Console.WriteLine("setting up Array<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<bool>(
                    Loader.env,
                    "ArrayConverter<Swift.Bool>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Double>", () => {
                Console.WriteLine("setting up Array<Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<double>(
                    Loader.env,
                    "ArrayConverter<Swift.Double>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Float>", () => {
                Console.WriteLine("setting up Array<Float>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<float>(
                    Loader.env,
                    "ArrayConverter<Swift.Float>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Int>", () => {
                Console.WriteLine("setting up Array<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<nint>(
                    Loader.env,
                    "ArrayConverter<Swift.Int>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Int16>", () => {
                Console.WriteLine("setting up Array<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<short>(
                    Loader.env,
                    "ArrayConverter<Swift.Int16>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Int32>", () => {
                Console.WriteLine("setting up Array<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                    Loader.env,
                    "ArrayConverter<Swift.Int32>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Int64>", () => {
                Console.WriteLine("setting up Array<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<long>(
                    Loader.env,
                    "ArrayConverter<Swift.Int64>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.Int8>", () => {
                Console.WriteLine("setting up Array<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<sbyte>(
                    Loader.env,
                    "ArrayConverter<Swift.Int8>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.String>", () => {
                Console.WriteLine("setting up Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<string>(
                    Loader.env,
                    "ArrayConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.UInt>", () => {
                Console.WriteLine("setting up Array<UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<nuint>(
                    Loader.env,
                    "ArrayConverter<Swift.UInt>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.UInt16>", () => {
                Console.WriteLine("setting up Array<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<ushort>(
                    Loader.env,
                    "ArrayConverter<Swift.UInt16>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.UInt32>", () => {
                Console.WriteLine("setting up Array<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<uint>(
                    Loader.env,
                    "ArrayConverter<Swift.UInt32>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.UInt64>", () => {
                Console.WriteLine("setting up Array<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<ulong>(
                    Loader.env,
                    "ArrayConverter<Swift.UInt64>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Swift.UInt8>", () => {
                Console.WriteLine("setting up Array<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<byte>(
                    Loader.env,
                    "ArrayConverter<Swift.UInt8>",
                    out exn
                ));
            });
            Once("setup_ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>", () => {
                Console.WriteLine("setting up Array<(Int8, Int16, Int32, Int64)>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ArrayConverter_setup<System.Tuple<sbyte, short, int, long>>(
                    Loader.env,
                    "ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>",
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Swift.Bool, Swift.Bool>", () => {
                Console.WriteLine("setting up Dictionary<Bool, Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_DictionaryConverter_setup<bool, bool>(
                    Loader.env,
                    "DictionaryConverter<Swift.Bool, Swift.Bool>",
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up Dictionary<Int, Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_DictionaryConverter_setup<nint, nint?>(
                    Loader.env,
                    "DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up Dictionary<Int, Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_DictionaryConverter_setup<nint, nint>(
                    Loader.env,
                    "DictionaryConverter<Swift.Int, Swift.Int>",
                    out exn
                ));
            });
            Once("setup_DictionaryConverter<Swift.String, Swift.String>", () => {
                Console.WriteLine("setting up Dictionary<String, String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_DictionaryConverter_setup<string, string>(
                    Loader.env,
                    "DictionaryConverter<Swift.String, Swift.String>",
                    out exn
                ));
            });
            Once("setup_OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>", () => {
                Console.WriteLine("setting up Optional<Array<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<ArrayConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up Optional<Array<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>", () => {
                Console.WriteLine("setting up Optional<Dictionary<Int, Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up Optional<Dictionary<Int, Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>", () => {
                Console.WriteLine("setting up Optional<Set<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<SetConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up Optional<Set<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Bool>", () => {
                Console.WriteLine("setting up Optional<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Double>", () => {
                Console.WriteLine("setting up Optional<Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Float>", () => {
                Console.WriteLine("setting up Optional<Float>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Int>", () => {
                Console.WriteLine("setting up Optional<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Int16>", () => {
                Console.WriteLine("setting up Optional<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Int32>", () => {
                Console.WriteLine("setting up Optional<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Int64>", () => {
                Console.WriteLine("setting up Optional<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.Int8>", () => {
                Console.WriteLine("setting up Optional<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<TestAPI.SimpleEnum>", () => {
                Console.WriteLine("setting up Optional<SimpleEnum>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.String>", () => {
                Console.WriteLine("setting up Optional<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.UInt>", () => {
                Console.WriteLine("setting up Optional<UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.UInt16>", () => {
                Console.WriteLine("setting up Optional<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.UInt32>", () => {
                Console.WriteLine("setting up Optional<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.UInt64>", () => {
                Console.WriteLine("setting up Optional<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.UInt8>", () => {
                Console.WriteLine("setting up Optional<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.Double>", () => {
                Console.WriteLine("setting up ClosedRange<Double>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<double>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.Double>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.Float>", () => {
                Console.WriteLine("setting up ClosedRange<Float>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<float>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.Float>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.Int>", () => {
                Console.WriteLine("setting up ClosedRange<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<nint>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.Int>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.Int16>", () => {
                Console.WriteLine("setting up ClosedRange<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<short>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.Int16>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.Int32>", () => {
                Console.WriteLine("setting up ClosedRange<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.Int32>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.Int64>", () => {
                Console.WriteLine("setting up ClosedRange<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<long>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.Int64>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.Int8>", () => {
                Console.WriteLine("setting up ClosedRange<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<sbyte>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.Int8>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.String>", () => {
                Console.WriteLine("setting up ClosedRange<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<string>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.UInt>", () => {
                Console.WriteLine("setting up ClosedRange<UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<nuint>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.UInt>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.UInt16>", () => {
                Console.WriteLine("setting up ClosedRange<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<ushort>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.UInt16>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.UInt32>", () => {
                Console.WriteLine("setting up ClosedRange<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<uint>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.UInt32>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.UInt64>", () => {
                Console.WriteLine("setting up ClosedRange<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<ulong>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.UInt64>",
                    out exn
                ));
            });
            Once("setup_ClosedRangeConverter<Swift.UInt8>", () => {
                Console.WriteLine("setting up ClosedRange<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_ClosedRangeConverter_setup<byte>(
                    Loader.env,
                    "ClosedRangeConverter<Swift.UInt8>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Foundation.AttributedString.Index>", () => {
                Console.WriteLine("setting up Range<AttributedString.Index>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<Cricut.FishyJoesRuntime.AttributedString.Index>(
                    Loader.env,
                    "RangeConverter<Foundation.AttributedString.Index>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.Int>", () => {
                Console.WriteLine("setting up Range<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<nint>(
                    Loader.env,
                    "RangeConverter<Swift.Int>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.Int16>", () => {
                Console.WriteLine("setting up Range<Int16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<short>(
                    Loader.env,
                    "RangeConverter<Swift.Int16>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.Int32>", () => {
                Console.WriteLine("setting up Range<Int32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<int>(
                    Loader.env,
                    "RangeConverter<Swift.Int32>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.Int64>", () => {
                Console.WriteLine("setting up Range<Int64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<long>(
                    Loader.env,
                    "RangeConverter<Swift.Int64>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.Int8>", () => {
                Console.WriteLine("setting up Range<Int8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<sbyte>(
                    Loader.env,
                    "RangeConverter<Swift.Int8>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.UInt>", () => {
                Console.WriteLine("setting up Range<UInt>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<nuint>(
                    Loader.env,
                    "RangeConverter<Swift.UInt>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.UInt16>", () => {
                Console.WriteLine("setting up Range<UInt16>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<ushort>(
                    Loader.env,
                    "RangeConverter<Swift.UInt16>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.UInt32>", () => {
                Console.WriteLine("setting up Range<UInt32>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<uint>(
                    Loader.env,
                    "RangeConverter<Swift.UInt32>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.UInt64>", () => {
                Console.WriteLine("setting up Range<UInt64>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<ulong>(
                    Loader.env,
                    "RangeConverter<Swift.UInt64>",
                    out exn
                ));
            });
            Once("setup_RangeConverter<Swift.UInt8>", () => {
                Console.WriteLine("setting up Range<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_RangeConverter_setup<byte>(
                    Loader.env,
                    "RangeConverter<Swift.UInt8>",
                    out exn
                ));
            });
            Once("setup_SetConverter<OptionalConverter<Swift.Int>>", () => {
                Console.WriteLine("setting up Set<Optional<Int>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_SetConverter_setup<nint?>(
                    Loader.env,
                    "SetConverter<OptionalConverter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_SetConverter<Swift.Bool>", () => {
                Console.WriteLine("setting up Set<Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_SetConverter_setup<bool>(
                    Loader.env,
                    "SetConverter<Swift.Bool>",
                    out exn
                ));
            });
            Once("setup_SetConverter<Swift.Int>", () => {
                Console.WriteLine("setting up Set<Int>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_SetConverter_setup<nint>(
                    Loader.env,
                    "SetConverter<Swift.Int>",
                    out exn
                ));
            });
            Once("setup_SetConverter<Swift.String>", () => {
                Console.WriteLine("setting up Set<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_SetConverter_setup<string>(
                    Loader.env,
                    "SetConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces", () => {
                Console.WriteLine("setting up Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces...");
                Utilities.Check((out CreatedRef exn) => Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup(
                    Loader.env,
                    bag<_Foundation_AttributedString_PuttingTypesIntoQuestionablePlacesConstructor>((ConsumedRef x, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.AttributedString_PuttingTypesIntoQuestionablePlaces(
                            x.Consume<string>()
                        ));
                    })),
                    bag<_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_xGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.AttributedString_PuttingTypesIntoQuestionablePlaces>().X)
                    )),
                    out exn
                ));
            });
            Once("setup_Swift.String.PuttingTypesIntoQuestionablePlaces", () => {
                Console.WriteLine("setting up Swift.String.PuttingTypesIntoQuestionablePlaces...");
                Utilities.Check((out CreatedRef exn) => Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
                    Loader.env,
                    bag<_Swift_String_PuttingTypesIntoQuestionablePlacesConstructor>((ConsumedRef x, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.String_PuttingTypesIntoQuestionablePlaces(
                            x.Consume<string>()
                        ));
                    })),
                    bag<_Swift_String_PuttingTypesIntoQuestionablePlaces_xGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.String_PuttingTypesIntoQuestionablePlaces>().X)
                    )),
                    out exn
                ));
            });
            Once("setup_Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces", () => {
                Console.WriteLine("setting up Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces...");
                Utilities.Check((out CreatedRef exn) => Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
                    Loader.env,
                    bag<FishyJoesRuntime.EnumDiscriminator>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        var enumeration = obj.Peek<Cricut.TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces>();
                        if (enumeration is Cricut.TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.Thing) { return (nint)0; }
                        throw new Exception($"Found unexpected subclass of Cricut.TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces: {enumeration}");
                    })),
                    bag<Cricut_TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing>(
                        (
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.Thing(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing>(
                        (
                            UnownedRef obj,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.Thing>();
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    out exn
                ));
            });
            Once("setup_TestAPI.Actors.TemperatureLogger", () => {
                Console.WriteLine("setting up TestAPI.Actors.TemperatureLogger...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Actors_TemperatureLogger_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Actors.TemperatureLogger(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Collections.CollectionHolder", () => {
                Console.WriteLine("setting up TestAPI.Collections.CollectionHolder...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Collections_CollectionHolder_setup(
                    Loader.env,
                    bag<_TestAPI_Collections_CollectionHolderConstructor>((ConsumedRef boolArray, ConsumedRef boolSet, ConsumedRef boolDictionary, ConsumedRef integerArray, ConsumedRef integerSet, ConsumedRef integerDictionary, ConsumedRef stringArray, ConsumedRef stringSet, ConsumedRef stringDictionary, out CreatedRef exn) => Catching(out exn, () => {
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
                    bag<_TestAPI_Collections_CollectionHolder_boolArrayGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolArray)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_boolArraySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolArray = newValue.Consume<System.Collections.Generic.IList<bool>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_boolSetGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolSet)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_boolSetSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolSet = newValue.Consume<System.Collections.Generic.ISet<bool>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_boolDictionaryGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolDictionary)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_boolDictionarySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().BoolDictionary = newValue.Consume<System.Collections.Generic.IDictionary<bool, bool>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_integerArrayGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerArray)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_integerArraySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerArray = newValue.Consume<System.Collections.Generic.IList<nint>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_integerSetGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerSet)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_integerSetSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerSet = newValue.Consume<System.Collections.Generic.ISet<nint>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_integerDictionaryGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerDictionary)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_integerDictionarySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().IntegerDictionary = newValue.Consume<System.Collections.Generic.IDictionary<nint, nint>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_stringArrayGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringArray)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_stringArraySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringArray = newValue.Consume<System.Collections.Generic.IList<string>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_stringSetGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringSet)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_stringSetSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringSet = newValue.Consume<System.Collections.Generic.ISet<string>>();
                    })),
                    bag<_TestAPI_Collections_CollectionHolder_stringDictionaryGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringDictionary)
                    )),
                    bag<_TestAPI_Collections_CollectionHolder_stringDictionarySetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Collections.CollectionHolder>().StringDictionary = newValue.Consume<System.Collections.Generic.IDictionary<string, string>>();
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Primitives.PrimitiveHolder", () => {
                Console.WriteLine("setting up TestAPI.Primitives.PrimitiveHolder...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Primitives_PrimitiveHolder_setup(
                    Loader.env,
                    bag<_TestAPI_Primitives_PrimitiveHolderConstructor>((bool b, ConsumedRef bq, byte ui8, ConsumedRef ui8q, ushort ui16, ConsumedRef ui16q, uint ui32, ConsumedRef ui32q, ulong ui64, ConsumedRef ui64q, nuint ui, ConsumedRef uiq, sbyte i8, ConsumedRef i8q, short i16, ConsumedRef i16q, int i32, ConsumedRef i32q, long i64, ConsumedRef i64q, nint i, ConsumedRef iq, float f, ConsumedRef fq, double d, ConsumedRef dq, out CreatedRef exn) => Catching(out exn, () => {
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
                    bag<_TestAPI_Primitives_PrimitiveHolder_bGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().B
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_bSetter>((UnownedRef obj, bool newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().B = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_bqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Bq)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_bqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Bq = newValue.Consume<bool?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui8Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui8Setter>((UnownedRef obj, byte newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui8qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui8qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui8q = newValue.Consume<byte?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui16Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui16Setter>((UnownedRef obj, ushort newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui16qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui16qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui16q = newValue.Consume<ushort?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui32Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui32Setter>((UnownedRef obj, uint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui32qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui32qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui32q = newValue.Consume<uint?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui64Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui64Setter>((UnownedRef obj, ulong newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui64qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_ui64qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui64q = newValue.Consume<ulong?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_uiGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_uiSetter>((UnownedRef obj, nuint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Ui = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_uiqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Uiq)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_uiqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Uiq = newValue.Consume<nuint?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i8Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i8Setter>((UnownedRef obj, sbyte newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i8qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i8qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I8q = newValue.Consume<sbyte?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i16Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i16Setter>((UnownedRef obj, short newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i16qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i16qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I16q = newValue.Consume<short?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i32Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i32Setter>((UnownedRef obj, int newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i32qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i32qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I32q = newValue.Consume<int?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i64Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i64Setter>((UnownedRef obj, long newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64 = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i64qGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64q)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_i64qSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I64q = newValue.Consume<long?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_iGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_iSetter>((UnownedRef obj, nint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().I = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_iqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Iq)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_iqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Iq = newValue.Consume<nint?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_fGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().F
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_fSetter>((UnownedRef obj, float newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().F = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_fqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Fq)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_fqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Fq = newValue.Consume<float?>();
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_dGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().D
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_dSetter>((UnownedRef obj, double newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().D = newValue;
                    })),
                    bag<_TestAPI_Primitives_PrimitiveHolder_dqGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Dq)
                    )),
                    bag<_TestAPI_Primitives_PrimitiveHolder_dqSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Primitives.PrimitiveHolder>().Dq = newValue.Consume<double?>();
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Structs.MemberwiseStruct", () => {
                Console.WriteLine("setting up TestAPI.Structs.MemberwiseStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_MemberwiseStruct_setup(
                    Loader.env,
                    bag<_TestAPI_Structs_MemberwiseStructConstructor>((ConsumedRef immutable, ConsumedRef mutable, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Structs.MemberwiseStruct(
                            immutable.Consume<string>(),
                            mutable.Consume<string>()
                        ));
                    })),
                    bag<_TestAPI_Structs_MemberwiseStruct_immutableGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Immutable)
                    )),
                    bag<_TestAPI_Structs_MemberwiseStruct_immutableSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Immutable = newValue.Consume<string>();
                    })),
                    bag<_TestAPI_Structs_MemberwiseStruct_mutableGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Mutable)
                    )),
                    bag<_TestAPI_Structs_MemberwiseStruct_mutableSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Structs.MemberwiseStruct>().Mutable = newValue.Consume<string>();
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Structs.MutableStruct", () => {
                Console.WriteLine("setting up TestAPI.Structs.MutableStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_MutableStruct_setup(
                    Loader.env,
                    bag<_TestAPI_Structs_MutableStructConstructor>((nint i, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Structs.MutableStruct(
                            i
                        ));
                    })),
                    bag<_TestAPI_Structs_MutableStruct_iGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.Structs.MutableStruct>().I
                    )),
                    bag<_TestAPI_Structs_MutableStruct_iSetter>((UnownedRef obj, nint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.Structs.MutableStruct>().I = newValue;
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Structs.PuttingTypesIntoQuestionablePlaces", () => {
                Console.WriteLine("setting up TestAPI.Structs.PuttingTypesIntoQuestionablePlaces...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Structs_PuttingTypesIntoQuestionablePlaces(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Structs.ReferenceStruct", () => {
                Console.WriteLine("setting up TestAPI.Structs.ReferenceStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_ReferenceStruct_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Structs.ReferenceStruct(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._AProtocolConverter", () => {
                Console.WriteLine("setting up TestAPI.AProtocol...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__AProtocolConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__AProtocolConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_AProtocol(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__AProtocolConverter_Getbaz>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.AProtocol>().GetBaz()
                    )),
                    bag<_TestAPI_CommonInterface__AProtocolConverter_Getfoo>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.AProtocol>().GetFoo())
                    )),
                    bag<_TestAPI_CommonInterface__AProtocolConverter_bar>((UnownedRef obj, nint x, nint y, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.AProtocol>().Bar(x, y))
                    )),
                    bag<_TestAPI_CommonInterface__AProtocolConverter_hasADefaultImplementation>((UnownedRef obj, nint x, double y, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.AProtocol>().HasADefaultImplementation(x, y))
                    )),
                    bag<_TestAPI_CommonInterface__AProtocolConverter_hasADefaultImplementation2>((UnownedRef obj, string a, bool b, string c, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.AProtocol>().HasADefaultImplementation2(a, b, c))
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI.AProtocolImplementation", () => {
                Console.WriteLine("setting up TestAPI.AProtocolImplementation...");
                Utilities.Check((out CreatedRef exn) => TestAPI_AProtocolImplementation_setup(
                    Loader.env,
                    bag<_TestAPI_AProtocolImplementationConstructor>((ConsumedRef foo, bool baz, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.AProtocolImplementation(
                            foo.Consume<string>(),
                            baz
                        ));
                    })),
                    bag<_TestAPI_AProtocolImplementation_fooGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.AProtocolImplementation>().Foo)
                    )),
                    bag<_TestAPI_AProtocolImplementation_fooSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.AProtocolImplementation>().Foo = newValue.Consume<string>();
                    })),
                    bag<_TestAPI_AProtocolImplementation_bazGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.AProtocolImplementation>().Baz
                    )),
                    bag<_TestAPI_AProtocolImplementation_bazSetter>((UnownedRef obj, bool newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.AProtocolImplementation>().Baz = newValue;
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Actors", () => {
                Console.WriteLine("setting up TestAPI.Actors...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Actors_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.AssociatedDataEnum", () => {
                Console.WriteLine("setting up TestAPI.AssociatedDataEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_AssociatedDataEnum_setup(
                    Loader.env,
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
            Once("setup_TestAPI.AsyncFunctions", () => {
                Console.WriteLine("setting up TestAPI.AsyncFunctions...");
                Utilities.Check((out CreatedRef exn) => TestAPI_AsyncFunctions_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.AttributedStrings", () => {
                Console.WriteLine("setting up TestAPI.AttributedStrings...");
                Utilities.Check((out CreatedRef exn) => TestAPI_AttributedStrings_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.Bytes", () => {
                Console.WriteLine("setting up TestAPI.Bytes...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Bytes_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.ClosedRanges", () => {
                Console.WriteLine("setting up TestAPI.ClosedRanges...");
                Utilities.Check((out CreatedRef exn) => TestAPI_ClosedRanges_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.Collections", () => {
                Console.WriteLine("setting up TestAPI.Collections...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Collections_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.DefaultArguments", () => {
                Console.WriteLine("setting up TestAPI.DefaultArguments...");
                Utilities.Check((out CreatedRef exn) => TestAPI_DefaultArguments_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.Deprecations", () => {
                Console.WriteLine("setting up TestAPI.Deprecations...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Deprecations_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.EmptyClass", () => {
                Console.WriteLine("setting up TestAPI.EmptyClass...");
                Utilities.Check((out CreatedRef exn) => TestAPI_EmptyClass_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.EmptyClass1(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.EmptyClass2", () => {
                Console.WriteLine("setting up TestAPI.EmptyClass2...");
                Utilities.Check((out CreatedRef exn) => TestAPI_EmptyClass2_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.EmptyClass2(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.EmptyEnum", () => {
                Console.WriteLine("setting up TestAPI.EmptyEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_EmptyEnum_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.EmptyStruct", () => {
                Console.WriteLine("setting up TestAPI.EmptyStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_EmptyStruct_setup(
                    Loader.env,
                    bag<_TestAPI_EmptyStructConstructor>((out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.EmptyStruct(
                        ));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.EmptyStruct2", () => {
                Console.WriteLine("setting up TestAPI.EmptyStruct2...");
                Utilities.Check((out CreatedRef exn) => TestAPI_EmptyStruct2_setup(
                    Loader.env,
                    bag<_TestAPI_EmptyStruct2Constructor>((out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.EmptyStruct2(
                        ));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Functions", () => {
                Console.WriteLine("setting up TestAPI.Functions...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Functions_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.Methods", () => {
                Console.WriteLine("setting up TestAPI.Methods...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Methods_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.Methods(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Primitives", () => {
                Console.WriteLine("setting up TestAPI.Primitives...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Primitives_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.Ranges", () => {
                Console.WriteLine("setting up TestAPI.Ranges...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Ranges_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.SimpleEnum", () => {
                Console.WriteLine("setting up TestAPI.SimpleEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_SimpleEnum_setup(
                    Loader.env,
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
            Once("setup_TestAPI.Strings", () => {
                Console.WriteLine("setting up TestAPI.Strings...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Strings_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.Structs", () => {
                Console.WriteLine("setting up TestAPI.Structs...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Structs_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.TestAsyncForeignSideFunctionsStruct", () => {
                Console.WriteLine("setting up TestAPI.TestAsyncForeignSideFunctionsStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestAsyncForeignSideFunctionsStruct_setup(
                    Loader.env,
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStructConstructor>((ConsumedRef const42, ConsumedRef iabs, ConsumedRef intCompose, ConsumedRef add3Things, ConsumedRef makeList, ConsumedRef fifthThing, ConsumedRef six, ConsumedRef willThrow, ConsumedRef exercise0Fun, ConsumedRef exercise1Fun, ConsumedRef exercise2Fun, ConsumedRef exercise3Fun, ConsumedRef exercise4Fun, ConsumedRef exercise5Fun, ConsumedRef exercise6Fun, ConsumedRef thunkTwiceMakerFun, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct(
                            const42.Consume<System.Func<System.Threading.Tasks.Task<nint>>>(),
                            iabs.Consume<System.Func<nint, System.Threading.Tasks.Task<nint>>>(),
                            intCompose.Consume<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>>(),
                            add3Things.Consume<System.Func<float, double, nint, System.Threading.Tasks.Task<double>>>(),
                            makeList.Consume<System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>>(),
                            fifthThing.Consume<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>>(),
                            six.Consume<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>>(),
                            willThrow.Consume<System.Func<System.Threading.Tasks.Task<nint>>>(),
                            exercise0Fun.Consume<System.Func<System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>>>(),
                            exercise1Fun.Consume<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>>>(),
                            exercise2Fun.Consume<System.Func<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>, System.Threading.Tasks.Task<string>>>(),
                            exercise3Fun.Consume<System.Func<System.Func<float, double, nint, System.Threading.Tasks.Task<double>>, System.Threading.Tasks.Task<string>>>(),
                            exercise4Fun.Consume<System.Func<System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>, System.Threading.Tasks.Task<string>>>(),
                            exercise5Fun.Consume<System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>, System.Threading.Tasks.Task<string>>>(),
                            exercise6Fun.Consume<System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>>>(),
                            thunkTwiceMakerFun.Consume<System.Func<System.Func<System.Threading.Tasks.Task>, System.Func<System.Threading.Tasks.Task>>>()
                        ));
                    })),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_const42Getter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Const42)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_iabsGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Iabs)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_intComposeGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().IntCompose)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_add3ThingsGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Add3Things)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_makeListGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().MakeList)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_fifthThingGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().FifthThing)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_sixGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Six)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_willThrowGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().WillThrow)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0FunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Exercise0Fun)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1FunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Exercise1Fun)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2FunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Exercise2Fun)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3FunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Exercise3Fun)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4FunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Exercise4Fun)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5FunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Exercise5Fun)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6FunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().Exercise6Fun)
                    )),
                    bag<_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMakerFunGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncForeignSideFunctionsStruct>().ThunkTwiceMakerFun)
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._TestAsyncFunctionsConverter", () => {
                Console.WriteLine("setting up TestAPI.TestAsyncFunctions...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_TestAsyncFunctions(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getadd3Things>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetAdd3Things())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getconst42>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetConst42())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetfifthThing>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetFifthThing())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getiabs>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetIabs())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetintCompose>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetIntCompose())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetmakeList>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetMakeList())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_Getsix>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetSix())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_GetwillThrow>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().GetWillThrow())
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise0>((UnownedRef obj, System.Func<System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Exercise0(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise1>((UnownedRef obj, System.Func<nint, System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Exercise1(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise2>((UnownedRef obj, System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Exercise2(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise3>((UnownedRef obj, System.Func<float, double, nint, System.Threading.Tasks.Task<double>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Exercise3(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise4>((UnownedRef obj, System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Exercise4(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise5>((UnownedRef obj, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Exercise5(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_exercise6>((UnownedRef obj, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Exercise6(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_thunkTwiceMaker>((UnownedRef obj, System.Func<System.Threading.Tasks.Task> thunk, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().ThunkTwiceMaker(thunk))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_defaultExercise6>((UnownedRef obj, System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().DefaultExercise6(fn))
                    )),
                    bag<_TestAPI_CommonInterface__TestAsyncFunctionsConverter_witness>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestAsyncFunctions>().Witness())
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestAsyncSwiftSideFunctionsClass", () => {
                Console.WriteLine("setting up TestAPI.TestAsyncSwiftSideFunctionsClass...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestAsyncSwiftSideFunctionsClass_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestAsyncSwiftSideFunctionsClass(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter", () => {
                Console.WriteLine("setting up TestAPI.TestDefaultComputedProperties...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__TestDefaultComputedPropertiesConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_TestDefaultComputedProperties(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_Getnoot>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.TestDefaultComputedProperties>().GetNoot()
                    )),
                    bag<_TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_Getpluto>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestDefaultComputedProperties>().GetPlutonic())
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestDefaultComputedPropertiesClass", () => {
                Console.WriteLine("setting up TestAPI.TestDefaultComputedPropertiesClass...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestDefaultComputedPropertiesClass_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestDefaultComputedPropertiesReference(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestDefaultComputedPropertiesEnum", () => {
                Console.WriteLine("setting up TestAPI.TestDefaultComputedPropertiesEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestDefaultComputedPropertiesEnum_setup(
                    Loader.env,
                    bag<FishyJoesRuntime.EnumDiscriminator>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        var enumeration = obj.Peek<Cricut.TestAPI.TestDefaultComputedPropertiesEnum>();
                        if (enumeration is Cricut.TestAPI.TestDefaultComputedPropertiesEnum.Qux) { return (nint)0; }
                        throw new Exception($"Found unexpected subclass of Cricut.TestAPI.TestDefaultComputedPropertiesEnum: {enumeration}");
                    })),
                    bag<Cricut_TestAPI_TestDefaultComputedPropertiesEnum_new_qux>(
                        (
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.TestDefaultComputedPropertiesEnum.Qux(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_TestDefaultComputedPropertiesEnum_extract_qux>(
                        (
                            UnownedRef obj,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.TestDefaultComputedPropertiesEnum.Qux>();
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestDefaultComputedPropertiesStruct", () => {
                Console.WriteLine("setting up TestAPI.TestDefaultComputedPropertiesStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestDefaultComputedPropertiesStruct_setup(
                    Loader.env,
                    bag<_TestAPI_TestDefaultComputedPropertiesStructConstructor>((bool spam, nint noot, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestDefaultComputedPropertiesStruct(
                            spam,
                            noot
                        ));
                    })),
                    bag<_TestAPI_TestDefaultComputedPropertiesStruct_spamGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.TestDefaultComputedPropertiesStruct>().Spam
                    )),
                    bag<_TestAPI_TestDefaultComputedPropertiesStruct_spamSetter>((UnownedRef obj, bool newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.TestDefaultComputedPropertiesStruct>().Spam = newValue;
                    })),
                    bag<_TestAPI_TestDefaultComputedPropertiesStruct_nootGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.TestDefaultComputedPropertiesStruct>().Noot
                    )),
                    bag<_TestAPI_TestDefaultComputedPropertiesStruct_nootSetter>((UnownedRef obj, nint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.TestDefaultComputedPropertiesStruct>().Noot = newValue;
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter", () => {
                Console.WriteLine("setting up TestAPI.TestDifferingExportNameProtocol...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__TestDifferingExportNameProtocolConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_TestDifferingExportNameProtocolDiffy(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_Gettata>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.TestDifferingExportNameProtocolDiffy>().GetTata()
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestDifferingExportNameStruct", () => {
                Console.WriteLine("setting up TestAPI.TestDifferingExportNameStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestDifferingExportNameStruct_setup(
                    Loader.env,
                    bag<_TestAPI_TestDifferingExportNameStructConstructor>((nint tata, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestDifferingExportNameStruct(
                            tata
                        ));
                    })),
                    bag<_TestAPI_TestDifferingExportNameStruct_tataGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        obj.Peek<Cricut.TestAPI.TestDifferingExportNameStruct>().Tata
                    )),
                    bag<_TestAPI_TestDifferingExportNameStruct_tataSetter>((UnownedRef obj, nint newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.TestDifferingExportNameStruct>().Tata = newValue;
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter", () => {
                Console.WriteLine("setting up TestAPI.TestLeadingUnderscoredProp...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__TestLeadingUnderscoredPropConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_TestLeadingUnderscoredProp(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_Get_leadingUnderscoreProp>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestLeadingUnderscoredProp>().Get_leadingUnderscoreProp())
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestLeadingUnderscoredPropStruct", () => {
                Console.WriteLine("setting up TestAPI.TestLeadingUnderscoredPropStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestLeadingUnderscoredPropStruct_setup(
                    Loader.env,
                    bag<_TestAPI_TestLeadingUnderscoredPropStructConstructor>((ConsumedRef _leadingUnderscoreProp, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestLeadingUnderscoredPropStruct(
                            _leadingUnderscoreProp.Consume<string>()
                        ));
                    })),
                    bag<_TestAPI_TestLeadingUnderscoredPropStruct__leadingUnderscorePropGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestLeadingUnderscoredPropStruct>()._leadingUnderscoreProp)
                    )),
                    bag<_TestAPI_TestLeadingUnderscoredPropStruct__leadingUnderscorePropSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.TestLeadingUnderscoredPropStruct>()._leadingUnderscoreProp = newValue.Consume<string>();
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._TestMethodsProtocolConverter", () => {
                Console.WriteLine("setting up TestAPI.TestMethodsProtocol...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__TestMethodsProtocolConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__TestMethodsProtocolConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_TestMethodsProtocol(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__TestMethodsProtocolConverter_foo>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => 
                        obj.Peek<Cricut.TestAPI.TestMethodsProtocol>().Foo()
                    )),
                    bag<_TestAPI_CommonInterface__TestMethodsProtocolConverter_bar>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => 
                        obj.Peek<Cricut.TestAPI.TestMethodsProtocol>().Bar()
                    )),
                    bag<_TestAPI_CommonInterface__TestMethodsProtocolConverter_baz>((UnownedRef obj, bool qux, out CreatedRef exn) => Catching(out exn, () => 
                        obj.Peek<Cricut.TestAPI.TestMethodsProtocol>().Baz(qux)
                    )),
                    bag<_TestAPI_CommonInterface__TestMethodsProtocolConverter_garply>((UnownedRef obj, string _0, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestMethodsProtocol>().Garply(_0))
                    )),
                    bag<_TestAPI_CommonInterface__TestMethodsProtocolConverter_xyzzy>((UnownedRef obj, nint thud, System.Collections.Generic.IList<double> grault, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestMethodsProtocol>().Xyzzy(thud, grault))
                    )),
                    bag<_TestAPI_CommonInterface__TestMethodsProtocolConverter_plugh>((UnownedRef obj, System.Tuple<bool, double, System.Collections.Generic.IList<string>> fred, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestMethodsProtocol>().Plugh(fred))
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._TestOptionalsProtocolConverter", () => {
                Console.WriteLine("setting up TestAPI.TestOptionalsProtocol...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__TestOptionalsProtocolConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_TestOptionalsProtocol(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__TestOptionalsProtocolConverter_Getflarp>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestOptionalsProtocol>().GetFlarp())
                    )),
                    bag<_TestAPI_CommonInterface__TestOptionalsProtocolConverter_wombat>((UnownedRef obj, nint? zxc, out CreatedRef exn) => Catching(out exn, () => 
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestOptionalsProtocol>().Wombat(zxc))
                    )),
                    bag<_TestAPI_CommonInterface__TestOptionalsProtocolConverter_spqr>((UnownedRef obj, Cricut.TestAPI.AssociatedDataEnum pippo, out CreatedRef exn) => Catching(out exn, () => 
                        obj.Peek<Cricut.TestAPI.TestOptionalsProtocol>().Spqr(pippo)
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI_CommonInterface._TestPropertiesProtocolConverter", () => {
                Console.WriteLine("setting up TestAPI.TestPropertiesProtocol...");
                Utilities.Check((out CreatedRef exn) => TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup(
                    Loader.env,
                    bag<_TestAPI_CommonInterface__TestPropertiesProtocolConverterConstructor>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.ExternalWitness_TestPropertiesProtocol(ptr));
                    })),
                    bag<_TestAPI_CommonInterface__TestPropertiesProtocolConverter_Getcorge>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestPropertiesProtocol>().GetCorge())
                    )),
                    bag<_TestAPI_CommonInterface__TestPropertiesProtocolConverter_Getfrob>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestPropertiesProtocol>().GetFrobby())
                    )),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestProtocolClass", () => {
                Console.WriteLine("setting up TestAPI.TestProtocolClass...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestProtocolClass_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestProtocolClass(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestProtocolEnum", () => {
                Console.WriteLine("setting up TestAPI.TestProtocolEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestProtocolEnum_setup(
                    Loader.env,
                    bag<FishyJoesRuntime.EnumDiscriminator>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        var enumeration = obj.Peek<Cricut.TestAPI.TestProtocolEnum>();
                        if (enumeration is Cricut.TestAPI.TestProtocolEnum.Qux) { return (nint)0; }
                        throw new Exception($"Found unexpected subclass of Cricut.TestAPI.TestProtocolEnum: {enumeration}");
                    })),
                    bag<Cricut_TestAPI_TestProtocolEnum_new_qux>(
                        (
                            out CreatedRef exn
                        ) => Catching(out exn, () => 
                            new CreatedRef(new Cricut.TestAPI.TestProtocolEnum.Qux(
                            ))
                        )
                    ),
                    bag<Cricut_TestAPI_TestProtocolEnum_extract_qux>(
                        (
                            UnownedRef obj,
                            out CreatedRef exn
                        ) => {
                            try {
                                var enumeration = obj.Peek<Cricut.TestAPI.TestProtocolEnum.Qux>();
                                exn = CreatedRef.Null;
                            } catch (Exception e) {
                                exn = new CreatedRef(e);
                            }
                        }
                    ),
                    out exn
                ));
            });
            Once("setup_TestAPI.TestProtocolStruct", () => {
                Console.WriteLine("setting up TestAPI.TestProtocolStruct...");
                Utilities.Check((out CreatedRef exn) => TestAPI_TestProtocolStruct_setup(
                    Loader.env,
                    bag<_TestAPI_TestProtocolStructConstructor>((ConsumedRef corge, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.TestAPI.TestProtocolStruct(
                            corge.Consume<string>()
                        ));
                    })),
                    bag<_TestAPI_TestProtocolStruct_corgeGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () =>
                        new CreatedRef(obj.Peek<Cricut.TestAPI.TestProtocolStruct>().Corge)
                    )),
                    bag<_TestAPI_TestProtocolStruct_corgeSetter>((UnownedRef obj, ConsumedRef newValue, out CreatedRef exn) => Catching(out exn, () => {
                        obj.Peek<Cricut.TestAPI.TestProtocolStruct>().Corge = newValue.Consume<string>();
                    })),
                    out exn
                ));
            });
            Once("setup_TestAPI.Tuples", () => {
                Console.WriteLine("setting up TestAPI.Tuples...");
                Utilities.Check((out CreatedRef exn) => TestAPI_Tuples_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_TestAPI.URLs", () => {
                Console.WriteLine("setting up TestAPI.URLs...");
                Utilities.Check((out CreatedRef exn) => TestAPI_URLs_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (Bool, Double, Array<String>)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple3Converter_setup<bool, double, System.Collections.Generic.IList<string>>(
                    Loader.env,
                    "Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>", () => {
                Console.WriteLine("setting up (Bool, Int, String)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple3Converter_setup<bool, nint, string>(
                    Loader.env,
                    "Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>",
                    out exn
                ));
            });
            Once("setup_Tuple2Converter<Swift.Int, Swift.String>", () => {
                Console.WriteLine("setting up (Int, String)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple2Converter_setup<nint, string>(
                    Loader.env,
                    "Tuple2Converter<Swift.Int, Swift.String>",
                    out exn
                ));
            });
            Once("setup_Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>", () => {
                Console.WriteLine("setting up (Int8, Int16, Int32, Int64)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple4Converter_setup<sbyte, short, int, long>(
                    Loader.env,
                    "Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>",
                    out exn
                ));
            });
            Once("setup_Tuple3Converter<Swift.String, Swift.Double, Swift.String>", () => {
                Console.WriteLine("setting up (String, Double, String)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple3Converter_setup<string, double, string>(
                    Loader.env,
                    "Tuple3Converter<Swift.String, Swift.Double, Swift.String>",
                    out exn
                ));
            });
            Once("setup_Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>", () => {
                Console.WriteLine("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple6Converter_setup<string, nint, double, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>, bool>(
                    Loader.env,
                    "Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>",
                    out exn
                ));
            });
            Once("setup_Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>", () => {
                Console.WriteLine("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple5Converter_setup<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>(
                    Loader.env,
                    "Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>", () => {
                Console.WriteLine("setting up ((Int, String), (String, Double, String), String, Bool)...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Tuple4Converter_setup<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>(
                    Loader.env,
                    "Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>",
                    out exn
                ));
            });
        }
    }
}
