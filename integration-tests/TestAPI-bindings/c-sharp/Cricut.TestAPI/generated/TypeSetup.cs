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

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void _TestAPI_AProtocolConverter_setup(
            IntPtr envRef,
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
        static extern void TestAPI_EmptyEnum_setup(
            IntPtr envRef,
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

            Once("setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", () => {
                Console.WriteLine("setting up ((Int) -> Int, (Int) -> Int) -> (Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function2Converter_setup<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>(
                    Loader.env,
                    "Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () => {
                Console.WriteLine("setting up (Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<System.Collections.Generic.IList<nint?>?, System.Collections.Generic.IList<nint?>?>(
                    Loader.env,
                    "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", () => {
                Console.WriteLine("setting up (Optional<UInt8>) -> Optional<UInt8>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<byte?, byte?>(
                    Loader.env,
                    "Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>",
                    out exn
                ));
            });
            Once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () => {
                Console.WriteLine("setting up (Float, Double, Int) -> Double...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function3Converter_setup<double, float, double, nint>(
                    Loader.env,
                    "Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<nint, nint>(
                    Loader.env,
                    "Function1Converter<Swift.Int, Swift.Int>",
                    out exn
                ));
            });
            Once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int, Int) -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function6Converter_setup<nint, string, nint, double, string, System.Func<nint>, nint>(
                    Loader.env,
                    "Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>",
                    out exn
                ));
            });
            Once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", () => {
                Console.WriteLine("setting up (String, Int, Double, String, () -> Int) -> () -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function5Converter_setup<System.Func<nint>, string, nint, double, string, System.Func<nint>>(
                    Loader.env,
                    "Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>",
                    out exn
                ));
            });
            Once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () => {
                Console.WriteLine("setting up (String, String, String, String) -> Array<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function4Converter_setup<System.Collections.Generic.IList<string>, string, string, string, string>(
                    Loader.env,
                    "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                    out exn
                ));
            });
            Once("setup_Function0Converter<Swift.Int>", () => {
                Console.WriteLine("setting up () -> Int...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function0Converter_setup<nint>(
                    Loader.env,
                    "Function0Converter<Swift.Int>",
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
            Once("setup__TestAPI.AProtocolConverter", () => {
                Console.WriteLine("setting up TestAPI.AProtocol...");
                Utilities.Check((out CreatedRef exn) => _TestAPI_AProtocolConverter_setup(
                    Loader.env,
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
            Once("setup_TestAPI.EmptyEnum", () => {
                Console.WriteLine("setting up TestAPI.EmptyEnum...");
                Utilities.Check((out CreatedRef exn) => TestAPI_EmptyEnum_setup(
                    Loader.env,
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
