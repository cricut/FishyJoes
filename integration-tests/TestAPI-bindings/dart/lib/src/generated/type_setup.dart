import './AssociatedDataEnum.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedStrings.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './ClosedRanges.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Functions_TheError.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import './URLs.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:path/path.dart' as path;
import 'package:tuple/tuple.dart' as tuple;

typedef _Foundation_AttributedString_PuttingTypesIntoQuestionablePlacesConstructor = CreatedRef Function(
    ConsumedRef x,
    OutCreatedRef exn
);
typedef _Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_xGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Swift_String_PuttingTypesIntoQuestionablePlacesConstructor = CreatedRef Function(
    ConsumedRef x,
    OutCreatedRef exn
);
typedef _Swift_String_PuttingTypesIntoQuestionablePlaces_xGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing = CreatedRef Function(
    OutCreatedRef _exn
);
typedef TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef _exn
);
typedef _TestAPI_Collections_CollectionHolderConstructor = CreatedRef Function(
    ConsumedRef boolArray,
    ConsumedRef boolSet,
    ConsumedRef boolDictionary,
    ConsumedRef integerArray,
    ConsumedRef integerSet,
    ConsumedRef integerDictionary,
    ConsumedRef stringArray,
    ConsumedRef stringSet,
    ConsumedRef stringDictionary,
    OutCreatedRef exn
);
typedef _TestAPI_Collections_CollectionHolder_boolArrayGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_boolArraySetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_boolSetGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_boolSetSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_boolDictionaryGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_boolDictionarySetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_integerArrayGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_integerArraySetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_integerSetGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_integerSetSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_integerDictionaryGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_integerDictionarySetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_stringArrayGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_stringArraySetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_stringSetGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_stringSetSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_stringDictionaryGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Collections_CollectionHolder_stringDictionarySetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolderConstructor = CreatedRef Function(
    ffi.Bool b,
    ConsumedRef bq,
    ffi.Uint8 ui8,
    ConsumedRef ui8q,
    ffi.Uint16 ui16,
    ConsumedRef ui16q,
    ffi.Uint32 ui32,
    ConsumedRef ui32q,
    ffi.Uint64 ui64,
    ConsumedRef ui64q,
    ffi.UnsignedInt ui,
    ConsumedRef uiq,
    ffi.Int8 i8,
    ConsumedRef i8q,
    ffi.Int16 i16,
    ConsumedRef i16q,
    ffi.Int32 i32,
    ConsumedRef i32q,
    ffi.Int64 i64,
    ConsumedRef i64q,
    ffi.Int i,
    ConsumedRef iq,
    ffi.Float f,
    ConsumedRef fq,
    ffi.Double d,
    ConsumedRef dq,
    OutCreatedRef exn
);
typedef _TestAPI_Primitives_PrimitiveHolder_bGetter = ffi.Bool Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_bSetter = ffi.Void Function(UnownedRef obj, ffi.Bool newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_bqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_bqSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui8Getter = ffi.Uint8 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui8Setter = ffi.Void Function(UnownedRef obj, ffi.Uint8 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui8qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui8qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui16Getter = ffi.Uint16 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui16Setter = ffi.Void Function(UnownedRef obj, ffi.Uint16 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui16qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui16qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui32Getter = ffi.Uint32 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui32Setter = ffi.Void Function(UnownedRef obj, ffi.Uint32 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui32qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui32qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui64Getter = ffi.Uint64 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui64Setter = ffi.Void Function(UnownedRef obj, ffi.Uint64 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui64qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_ui64qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_uiGetter = ffi.UnsignedInt Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_uiSetter = ffi.Void Function(UnownedRef obj, ffi.UnsignedInt newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_uiqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_uiqSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i8Getter = ffi.Int8 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i8Setter = ffi.Void Function(UnownedRef obj, ffi.Int8 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i8qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i8qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i16Getter = ffi.Int16 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i16Setter = ffi.Void Function(UnownedRef obj, ffi.Int16 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i16qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i16qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i32Getter = ffi.Int32 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i32Setter = ffi.Void Function(UnownedRef obj, ffi.Int32 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i32qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i32qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i64Getter = ffi.Int64 Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i64Setter = ffi.Void Function(UnownedRef obj, ffi.Int64 newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i64qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_i64qSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_iGetter = ffi.Int Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_iSetter = ffi.Void Function(UnownedRef obj, ffi.Int newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_iqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_iqSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_fGetter = ffi.Float Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_fSetter = ffi.Void Function(UnownedRef obj, ffi.Float newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_fqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_fqSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_dGetter = ffi.Double Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_dSetter = ffi.Void Function(UnownedRef obj, ffi.Double newValue, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_dqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Primitives_PrimitiveHolder_dqSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Structs_MemberwiseStructConstructor = CreatedRef Function(
    ConsumedRef immutable,
    ConsumedRef mutable,
    OutCreatedRef exn
);
typedef _TestAPI_Structs_MemberwiseStruct_immutableGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Structs_MemberwiseStruct_immutableSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _TestAPI_Structs_MemberwiseStruct_mutableGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TestAPI_Structs_MemberwiseStruct_mutableSetter = ffi.Void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef TestAPI_AssociatedDataEnum_new_thing = CreatedRef Function(
    ffi.Int value,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_extract_thing = ffi.Void Function(
    UnownedRef obj,
    ffi.Pointer<ffi.Int> value,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_new_other = CreatedRef Function(
    ConsumedRef unnamed,
    ffi.Int _1,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_extract_other = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef unnamed,
    ffi.Pointer<ffi.Int> _1,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_new_bar = CreatedRef Function(
    ConsumedRef named,
    ConsumedRef _1,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_extract_bar = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef named,
    OutCreatedRef _1,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_new_noValue = CreatedRef Function(
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_extract_noValue = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_new_simpleEnum = CreatedRef Function(
    ConsumedRef value,
    OutCreatedRef _exn
);
typedef TestAPI_AssociatedDataEnum_extract_simpleEnum = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef value,
    OutCreatedRef _exn
);
typedef TestAPI_SimpleEnum_new_red = CreatedRef Function(
    OutCreatedRef _exn
);
typedef TestAPI_SimpleEnum_extract_red = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef _exn
);
typedef TestAPI_SimpleEnum_new_green = CreatedRef Function(
    OutCreatedRef _exn
);
typedef TestAPI_SimpleEnum_extract_green = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef _exn
);
typedef TestAPI_SimpleEnum_new_blue = CreatedRef Function(
    OutCreatedRef _exn
);
typedef TestAPI_SimpleEnum_extract_blue = ffi.Void Function(
    UnownedRef obj,
    OutCreatedRef _exn
);

final ensureLoaded = (() {
    FishyJoesRuntime.Loader.shared.ensureLoaded;

    final dylib = Loader.openLibrary('TestAPI-iota');
    final arena = ffi.Arena();

    dylib.lookupFunction<ffi.Void Function(), void Function()>('FishyJoes_TestAPI_registerTypes')();

    final Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_Foundation_AttributedString_PuttingTypesIntoQuestionablePlacesConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_xGetter>> get_x,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_Foundation_AttributedString_PuttingTypesIntoQuestionablePlacesConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_xGetter>> get_x,
            OutCreatedRef exn
        )
    >('Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup');
    final Swift_String_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_Swift_String_PuttingTypesIntoQuestionablePlacesConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_Swift_String_PuttingTypesIntoQuestionablePlaces_xGetter>> get_x,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_Swift_String_PuttingTypesIntoQuestionablePlacesConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_Swift_String_PuttingTypesIntoQuestionablePlaces_xGetter>> get_x,
            OutCreatedRef exn
        )
    >('Swift_String_PuttingTypesIntoQuestionablePlaces_setup');
    final Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing>> thing_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing>> thing_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing>> thing_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing>> thing_extractor,
            OutCreatedRef exn
        )
    >('Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup');
    final TestAPI_Collections_CollectionHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolderConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolArrayGetter>> get_boolArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolArraySetter>> set_boolArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolSetGetter>> get_boolSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolSetSetter>> set_boolSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolDictionaryGetter>> get_boolDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolDictionarySetter>> set_boolDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerArrayGetter>> get_integerArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerArraySetter>> set_integerArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerSetGetter>> get_integerSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerSetSetter>> set_integerSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerDictionaryGetter>> get_integerDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerDictionarySetter>> set_integerDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringArrayGetter>> get_stringArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringArraySetter>> set_stringArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringSetGetter>> get_stringSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringSetSetter>> set_stringSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringDictionaryGetter>> get_stringDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringDictionarySetter>> set_stringDictionary,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolderConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolArrayGetter>> get_boolArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolArraySetter>> set_boolArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolSetGetter>> get_boolSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolSetSetter>> set_boolSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolDictionaryGetter>> get_boolDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_boolDictionarySetter>> set_boolDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerArrayGetter>> get_integerArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerArraySetter>> set_integerArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerSetGetter>> get_integerSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerSetSetter>> set_integerSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerDictionaryGetter>> get_integerDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_integerDictionarySetter>> set_integerDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringArrayGetter>> get_stringArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringArraySetter>> set_stringArray,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringSetGetter>> get_stringSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringSetSetter>> set_stringSet,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringDictionaryGetter>> get_stringDictionary,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Collections_CollectionHolder_stringDictionarySetter>> set_stringDictionary,
            OutCreatedRef exn
        )
    >('TestAPI_Collections_CollectionHolder_setup');
    final TestAPI_Functions_TheError_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Functions_TheError_setup');
    final TestAPI_Primitives_PrimitiveHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolderConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bGetter>> get_b,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bSetter>> set_b,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bqGetter>> get_bq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bqSetter>> set_bq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8Getter>> get_ui8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8Setter>> set_ui8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8qGetter>> get_ui8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8qSetter>> set_ui8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16Getter>> get_ui16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16Setter>> set_ui16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16qGetter>> get_ui16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16qSetter>> set_ui16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32Getter>> get_ui32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32Setter>> set_ui32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32qGetter>> get_ui32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32qSetter>> set_ui32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64Getter>> get_ui64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64Setter>> set_ui64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64qGetter>> get_ui64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64qSetter>> set_ui64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiGetter>> get_ui,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiSetter>> set_ui,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiqGetter>> get_uiq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiqSetter>> set_uiq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8Getter>> get_i8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8Setter>> set_i8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8qGetter>> get_i8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8qSetter>> set_i8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16Getter>> get_i16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16Setter>> set_i16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16qGetter>> get_i16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16qSetter>> set_i16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32Getter>> get_i32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32Setter>> set_i32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32qGetter>> get_i32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32qSetter>> set_i32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64Getter>> get_i64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64Setter>> set_i64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64qGetter>> get_i64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64qSetter>> set_i64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iGetter>> get_i,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iSetter>> set_i,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iqGetter>> get_iq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iqSetter>> set_iq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fGetter>> get_f,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fSetter>> set_f,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fqGetter>> get_fq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fqSetter>> set_fq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dGetter>> get_d,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dSetter>> set_d,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dqGetter>> get_dq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dqSetter>> set_dq,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolderConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bGetter>> get_b,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bSetter>> set_b,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bqGetter>> get_bq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_bqSetter>> set_bq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8Getter>> get_ui8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8Setter>> set_ui8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8qGetter>> get_ui8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui8qSetter>> set_ui8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16Getter>> get_ui16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16Setter>> set_ui16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16qGetter>> get_ui16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui16qSetter>> set_ui16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32Getter>> get_ui32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32Setter>> set_ui32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32qGetter>> get_ui32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui32qSetter>> set_ui32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64Getter>> get_ui64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64Setter>> set_ui64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64qGetter>> get_ui64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_ui64qSetter>> set_ui64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiGetter>> get_ui,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiSetter>> set_ui,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiqGetter>> get_uiq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_uiqSetter>> set_uiq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8Getter>> get_i8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8Setter>> set_i8,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8qGetter>> get_i8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i8qSetter>> set_i8q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16Getter>> get_i16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16Setter>> set_i16,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16qGetter>> get_i16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i16qSetter>> set_i16q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32Getter>> get_i32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32Setter>> set_i32,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32qGetter>> get_i32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i32qSetter>> set_i32q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64Getter>> get_i64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64Setter>> set_i64,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64qGetter>> get_i64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_i64qSetter>> set_i64q,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iGetter>> get_i,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iSetter>> set_i,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iqGetter>> get_iq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_iqSetter>> set_iq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fGetter>> get_f,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fSetter>> set_f,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fqGetter>> get_fq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_fqSetter>> set_fq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dGetter>> get_d,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dSetter>> set_d,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dqGetter>> get_dq,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Primitives_PrimitiveHolder_dqSetter>> set_dq,
            OutCreatedRef exn
        )
    >('TestAPI_Primitives_PrimitiveHolder_setup');
    final TestAPI_Structs_MemberwiseStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStructConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStruct_immutableGetter>> get_immutable,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStruct_mutableGetter>> get_mutable,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStruct_mutableSetter>> set_mutable,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStructConstructor>> constructor,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStruct_immutableGetter>> get_immutable,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStruct_mutableGetter>> get_mutable,
            ffi.Pointer<ffi.NativeFunction<_TestAPI_Structs_MemberwiseStruct_mutableSetter>> set_mutable,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_MemberwiseStruct_setup');
    final TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup');
    final TestAPI_Structs_ReferenceStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_ReferenceStruct_setup');
    final TestAPI_AssociatedDataEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_thing>> thing_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_thing>> thing_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_other>> other_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_other>> other_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_bar>> bar_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_bar>> bar_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_noValue>> noValue_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_noValue>> noValue_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_simpleEnum>> simpleEnum_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_simpleEnum>> simpleEnum_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_thing>> thing_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_thing>> thing_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_other>> other_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_other>> other_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_bar>> bar_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_bar>> bar_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_noValue>> noValue_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_noValue>> noValue_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_simpleEnum>> simpleEnum_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_simpleEnum>> simpleEnum_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_AssociatedDataEnum_setup');
    final TestAPI_AttributedStrings_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_AttributedStrings_setup');
    final TestAPI_Bytes_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Bytes_setup');
    final TestAPI_ClosedRanges_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_ClosedRanges_setup');
    final TestAPI_Collections_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Collections_setup');
    final TestAPI_DefaultArguments_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_DefaultArguments_setup');
    final TestAPI_Deprecations_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Deprecations_setup');
    final TestAPI_EmptyEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_EmptyEnum_setup');
    final TestAPI_Functions_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Functions_setup');
    final TestAPI_Methods_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Methods_setup');
    final TestAPI_MethodsProtocol_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_MethodsProtocol_setup');
    final TestAPI_Primitives_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Primitives_setup');
    final TestAPI_Ranges_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Ranges_setup');
    final TestAPI_SimpleEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_new_red>> red_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_extract_red>> red_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_new_green>> green_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_extract_green>> green_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_new_blue>> blue_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_extract_blue>> blue_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_new_red>> red_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_extract_red>> red_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_new_green>> green_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_extract_green>> green_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_new_blue>> blue_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_SimpleEnum_extract_blue>> blue_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_SimpleEnum_setup');
    final TestAPI_Strings_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Strings_setup');
    final TestAPI_Structs_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_setup');
    final TestAPI_Tuples_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Tuples_setup');
    final TestAPI_URLs_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_URLs_setup');
    TestAPI.AttributedString_PuttingTypesIntoQuestionablePlaces.f__iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall");
    TestAPI.String_PuttingTypesIntoQuestionablePlaces.f__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall");
    TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.f__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall");
    TestAPI.AssociatedDataEnum.f__iota_TestAPI_AssociatedDataEnum_plus = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef other,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef other,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AssociatedDataEnum_plus");
    TestAPI.AttributedStrings.f__iota_TestAPI_AttributedStrings_attributedCharacters = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AttributedStrings_attributedCharacters");
    TestAPI.AttributedStrings.f__iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart");
    TestAPI.AttributedStrings.f__iota_TestAPI_AttributedStrings_echo = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AttributedStrings_echo");
    TestAPI.AttributedStrings.f__iota_TestAPI_AttributedStrings_emptyAttributeRuns = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AttributedStrings_emptyAttributeRuns");
    TestAPI.AttributedStrings.f__iota_TestAPI_AttributedStrings_firstIndex = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AttributedStrings_firstIndex");
    TestAPI.AttributedStrings.f__iota_TestAPI_AttributedStrings_fullRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AttributedStrings_fullRange");
    TestAPI.AttributedStrings.f__iota_TestAPI_AttributedStrings_lastIndex = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_AttributedStrings_lastIndex");
    TestAPI.Bytes.f__iota_TestAPI_Bytes_echoBytes = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef bytes,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef bytes,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Bytes_echoBytes");
    TestAPI.Bytes.f__iota_TestAPI_Bytes_echoData = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef data,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef data,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Bytes_echoData");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoDoubleRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoDoubleRange");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoFloatRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoFloatRange");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoInt16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoInt16Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoInt32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoInt32Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoInt64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoInt64Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoInt8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoInt8Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoIntRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoIntRange");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoStringRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoStringRange");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoUInt16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoUInt16Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoUInt32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoUInt32Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoUInt64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoUInt64Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoUInt8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoUInt8Range");
    TestAPI.ClosedRanges.f__iota_TestAPI_ClosedRanges_echoUIntRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_ClosedRanges_echoUIntRange");
    TestAPI.Collections.f__iota_TestAPI_Collections_collectionMapper = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef collection,
            UnownedRef mapper,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef collection,
            UnownedRef mapper,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Collections_collectionMapper");
    TestAPI.Collections.f__iota_TestAPI_Collections_echoArrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef arrayOfInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef arrayOfInt,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Collections_echoArrayOfInt");
    TestAPI.Collections.f__iota_TestAPI_Collections_echoDictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef dictionaryOfIntToInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef dictionaryOfIntToInt,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Collections_echoDictionaryOfIntToInt");
    TestAPI.Collections.f__iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef maybeArrayOfMaybeInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef maybeArrayOfMaybeInt,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt");
    TestAPI.Collections.f__iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef maybeDictionaryOfIntToMaybeInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef maybeDictionaryOfIntToMaybeInt,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt");
    TestAPI.Collections.f__iota_TestAPI_Collections_echoMaybeSetOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef maybeSetOfMaybeInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef maybeSetOfMaybeInt,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Collections_echoMaybeSetOfMaybeInt");
    TestAPI.Collections.f__iota_TestAPI_Collections_echoSetOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef setOfInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef setOfInt,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Collections_echoSetOfInt");
    TestAPI.DefaultArguments.f__iota_TestAPI_DefaultArguments_echoDefaults = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef y,
            UnownedRef x,
            ffi.Double z,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef y,
            UnownedRef x,
            double z,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_DefaultArguments_echoDefaults");
    TestAPI.Deprecations.f__iota_TestAPI_Deprecations_deprecatedMethod = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Deprecations_deprecatedMethod");
    TestAPI.EmptyEnum.f__iota_TestAPI_EmptyEnum_notGoingToHappen = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_EmptyEnum_notGoingToHappen");
    TestAPI.Functions.f__iota_TestAPI_Functions_exercise0 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_exercise0");
    TestAPI.Functions.f__iota_TestAPI_Functions_exercise1 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_exercise1");
    TestAPI.Functions.f__iota_TestAPI_Functions_exercise2 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_exercise2");
    TestAPI.Functions.f__iota_TestAPI_Functions_exercise3 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_exercise3");
    TestAPI.Functions.f__iota_TestAPI_Functions_exercise4 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_exercise4");
    TestAPI.Functions.f__iota_TestAPI_Functions_exercise5 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_exercise5");
    TestAPI.Functions.f__iota_TestAPI_Functions_exercise6 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_exercise6");
    TestAPI.Functions.f__iota_TestAPI_Functions_willThrow = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Functions_willThrow");
    TestAPI.Methods.f__iota_TestAPI_Methods_create = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Methods_create");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoBool = dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            ffi.Bool value,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            bool value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoBool");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoDouble = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            ffi.Double value,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            double value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoDouble");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoFloat = dylib.lookupFunction<
        ffi.Float Function(
            Env env,
            ffi.Float value,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            double value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoFloat");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoInt");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoInt16 = dylib.lookupFunction<
        ffi.Int16 Function(
            Env env,
            ffi.Int16 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoInt16");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoInt32 = dylib.lookupFunction<
        ffi.Int32 Function(
            Env env,
            ffi.Int32 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoInt32");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoInt64 = dylib.lookupFunction<
        ffi.Int64 Function(
            Env env,
            ffi.Int64 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoInt64");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoInt8 = dylib.lookupFunction<
        ffi.Int8 Function(
            Env env,
            ffi.Int8 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoInt8");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoUInt = dylib.lookupFunction<
        ffi.UnsignedInt Function(
            Env env,
            ffi.UnsignedInt value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoUInt");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoUInt16 = dylib.lookupFunction<
        ffi.Uint16 Function(
            Env env,
            ffi.Uint16 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoUInt16");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoUInt32 = dylib.lookupFunction<
        ffi.Uint32 Function(
            Env env,
            ffi.Uint32 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoUInt32");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoUInt64 = dylib.lookupFunction<
        ffi.Uint64 Function(
            Env env,
            ffi.Uint64 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoUInt64");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_echoUInt8 = dylib.lookupFunction<
        ffi.Uint8 Function(
            Env env,
            ffi.Uint8 value,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            int value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_echoUInt8");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoBool = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoBool");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoDouble = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoDouble");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoFloat = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoFloat");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoInt");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoInt16");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoInt32");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoInt64");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoInt8");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoUInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoUInt");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoUInt16");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoUInt32");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoUInt64");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_maybeEchoUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_maybeEchoUInt8");
    TestAPI.Primitives.f__iota_TestAPI_Primitives_valueMapper = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef value,
            UnownedRef mapper,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef value,
            UnownedRef mapper,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Primitives_valueMapper");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoInt16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoInt16Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoInt32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoInt32Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoInt64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoInt64Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoInt8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoInt8Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoIntRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoIntRange");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoUInt16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoUInt16Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoUInt32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoUInt32Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoUInt64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoUInt64Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoUInt8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoUInt8Range");
    TestAPI.Ranges.f__iota_TestAPI_Ranges_echoUIntRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Ranges_echoUIntRange");
    TestAPI.SimpleEnum.f__iota_TestAPI_SimpleEnum_hexMethod = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_SimpleEnum_hexMethod");
    TestAPI.SimpleEnum.f__iota_TestAPI_SimpleEnum_pickAColor = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            ffi.Int rawValue,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            int rawValue,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_SimpleEnum_pickAColor");
    TestAPI.SimpleEnum.f__iota_TestAPI_SimpleEnum_resetFavoriteColor = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_SimpleEnum_resetFavoriteColor");
    TestAPI.Strings.f__iota_TestAPI_Strings_echo = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Strings_echo");
    TestAPI.Structs_MemberwiseStruct.f__iota_TestAPI_Structs_MemberwiseStruct_create = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Structs_MemberwiseStruct_create");
    TestAPI.Structs_PuttingTypesIntoQuestionablePlaces.f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create");
    TestAPI.Structs_PuttingTypesIntoQuestionablePlaces.f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall");
    TestAPI.Structs_ReferenceStruct.f__iota_TestAPI_Structs_ReferenceStruct_create = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Structs_ReferenceStruct_create");
    TestAPI.Structs_ReferenceStruct.f__iota_TestAPI_Structs_ReferenceStruct_equals = dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Structs_ReferenceStruct_equals");
    TestAPI.Tuples.f__iota_TestAPI_Tuples_checkTuples = dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef t2,
            UnownedRef t3,
            UnownedRef t4,
            UnownedRef t5,
            UnownedRef t6,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef t2,
            UnownedRef t3,
            UnownedRef t4,
            UnownedRef t5,
            UnownedRef t6,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_Tuples_checkTuples");
    TestAPI.URLs.f__iota_TestAPI_URLs_echo = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef url,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef url,
            OutCreatedRef _exn
        )
    >("__iota_TestAPI_URLs_echo");
    TestAPI.AssociatedDataEnum.f__iota_get_TestAPI_AssociatedDataEnum_intValue = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AssociatedDataEnum_intValue");
    TestAPI.AssociatedDataEnum.f__iota_get_TestAPI_AssociatedDataEnum_staticThing = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AssociatedDataEnum_staticThing");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_accent = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_accent");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_chinese = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_chinese");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_chineseBMP = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_chineseBMP");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_chineseSIP = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_chineseSIP");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_emoji = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_emoji");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_emojiMulti = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_emojiMulti");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_polyglot = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_polyglot");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_script = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_script");
    TestAPI.AttributedStrings.f__iota_get_TestAPI_AttributedStrings_simple = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_AttributedStrings_simple");
    TestAPI.Bytes.f__iota_get_TestAPI_Bytes_bytes = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Bytes_bytes");
    TestAPI.Bytes.f__iota_get_TestAPI_Bytes_data = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Bytes_data");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_doubleRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_doubleRange");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_floatRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_floatRange");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_int16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_int16Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_int32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_int32Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_int64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_int64Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_int8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_int8Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_intRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_intRange");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_stringRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_stringRange");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_uInt16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_uInt16Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_uInt32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_uInt32Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_uInt64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_uInt64Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_uInt8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_uInt8Range");
    TestAPI.ClosedRanges.f__iota_get_TestAPI_ClosedRanges_uIntRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_ClosedRanges_uIntRange");
    TestAPI.Collections_CollectionHolder.f__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty");
    TestAPI.Collections_CollectionHolder.f__iota_get_TestAPI_Collections_CollectionHolder_staticProperty = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_CollectionHolder_staticProperty");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_arrayOfBigTuples = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_arrayOfBigTuples");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_arrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_arrayOfInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_defaultCollectionHolder = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_defaultCollectionHolder");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_dictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_dictionaryOfIntToInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_maybeArrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_maybeArrayOfInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_maybeArrayOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_maybeArrayOfMaybeInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_maybeSetOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_maybeSetOfInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_maybeSetOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_maybeSetOfMaybeInt");
    TestAPI.Collections.f__iota_get_TestAPI_Collections_setOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Collections_setOfInt");
    TestAPI.Deprecations.f__iota_get_TestAPI_Deprecations_deprecatedVariable = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Deprecations_deprecatedVariable");
    TestAPI.Functions.f__iota_get_TestAPI_Functions_abs = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Functions_abs");
    TestAPI.Functions.f__iota_get_TestAPI_Functions_add3Things = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Functions_add3Things");
    TestAPI.Functions.f__iota_get_TestAPI_Functions_const42 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Functions_const42");
    TestAPI.Functions.f__iota_get_TestAPI_Functions_fifthThing = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Functions_fifthThing");
    TestAPI.Functions.f__iota_get_TestAPI_Functions_intCompose = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Functions_intCompose");
    TestAPI.Functions.f__iota_get_TestAPI_Functions_makeList = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Functions_makeList");
    TestAPI.Functions.f__iota_get_TestAPI_Functions_sixthThing = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Functions_sixthThing");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_instanceGet = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_instanceGet");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_instanceGetMethod = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_instanceGetMethod");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_instanceModifiable = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_instanceModifiable");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_instanceStored = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_instanceStored");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_staticGet = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_staticGet");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_staticGetMethod = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_staticGetMethod");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_staticModifiable = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_staticModifiable");
    TestAPI.Methods.f__iota_get_TestAPI_Methods_staticStored = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Methods_staticStored");
    TestAPI.Primitives_PrimitiveHolder.f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty");
    TestAPI.Primitives_PrimitiveHolder.f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_bitCountInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_bitCountInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_bitCountUInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_bitCountUInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_defaultPrimitiveHolder = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_defaultPrimitiveHolder");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_falseBool = dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_falseBool");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyBool = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyBool");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyDouble = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyDouble");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyFloat = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyFloat");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeBool = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeBool");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeDouble = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeDouble");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeFloat = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeFloat");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeUInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeUInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeUInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeUInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeUInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyMaybeUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyMaybeUInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyUInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyUInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyUInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyUInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyUInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_manyUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_manyUInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxDouble = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxDouble");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxFloat = dylib.lookupFunction<
        ffi.Float Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxFloat");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxInt16 = dylib.lookupFunction<
        ffi.Int16 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxInt32 = dylib.lookupFunction<
        ffi.Int32 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxInt64 = dylib.lookupFunction<
        ffi.Int64 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxInt8 = dylib.lookupFunction<
        ffi.Int8 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxUInt = dylib.lookupFunction<
        ffi.UnsignedInt Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxUInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxUInt16 = dylib.lookupFunction<
        ffi.Uint16 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxUInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxUInt32 = dylib.lookupFunction<
        ffi.Uint32 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxUInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxUInt64 = dylib.lookupFunction<
        ffi.Uint64 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxUInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_maxUInt8 = dylib.lookupFunction<
        ffi.Uint8 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_maxUInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minDouble = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minDouble");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minFloat = dylib.lookupFunction<
        ffi.Float Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minFloat");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minInt16 = dylib.lookupFunction<
        ffi.Int16 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minInt32 = dylib.lookupFunction<
        ffi.Int32 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minInt64 = dylib.lookupFunction<
        ffi.Int64 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minInt8 = dylib.lookupFunction<
        ffi.Int8 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minUInt = dylib.lookupFunction<
        ffi.UnsignedInt Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minUInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minUInt16 = dylib.lookupFunction<
        ffi.Uint16 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minUInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minUInt32 = dylib.lookupFunction<
        ffi.Uint32 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minUInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minUInt64 = dylib.lookupFunction<
        ffi.Uint64 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minUInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_minUInt8 = dylib.lookupFunction<
        ffi.Uint8 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_minUInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_trueBool = dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_trueBool");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroDouble = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroDouble");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroFloat = dylib.lookupFunction<
        ffi.Float Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroFloat");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroInt16 = dylib.lookupFunction<
        ffi.Int16 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroInt32 = dylib.lookupFunction<
        ffi.Int32 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroInt64 = dylib.lookupFunction<
        ffi.Int64 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroInt8 = dylib.lookupFunction<
        ffi.Int8 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroInt8");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroUInt = dylib.lookupFunction<
        ffi.UnsignedInt Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroUInt");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroUInt16 = dylib.lookupFunction<
        ffi.Uint16 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroUInt16");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroUInt32 = dylib.lookupFunction<
        ffi.Uint32 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroUInt32");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroUInt64 = dylib.lookupFunction<
        ffi.Uint64 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroUInt64");
    TestAPI.Primitives.f__iota_get_TestAPI_Primitives_zeroUInt8 = dylib.lookupFunction<
        ffi.Uint8 Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Primitives_zeroUInt8");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_int16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_int16Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_int32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_int32Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_int64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_int64Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_int8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_int8Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_intRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_intRange");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_uInt16Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_uInt16Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_uInt32Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_uInt32Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_uInt64Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_uInt64Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_uInt8Range = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_uInt8Range");
    TestAPI.Ranges.f__iota_get_TestAPI_Ranges_uIntRange = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Ranges_uIntRange");
    TestAPI.SimpleEnum.f__iota_get_TestAPI_SimpleEnum_favoriteColor = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_SimpleEnum_favoriteColor");
    TestAPI.SimpleEnum.f__iota_get_TestAPI_SimpleEnum_hex = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_SimpleEnum_hex");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_accent = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_accent");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_chinese = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_chinese");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_chineseBMP = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_chineseBMP");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_chineseSIP = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_chineseSIP");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_emoji = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_emoji");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_emojiMulti = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_emojiMulti");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_script = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_script");
    TestAPI.Strings.f__iota_get_TestAPI_Strings_simple = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Strings_simple");
    TestAPI.Structs_ReferenceStruct.f__iota_get_TestAPI_Structs_ReferenceStruct_hash = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Structs_ReferenceStruct_hash");
    TestAPI.Structs_ReferenceStruct.f__iota_get_TestAPI_Structs_ReferenceStruct_immutable = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Structs_ReferenceStruct_immutable");
    TestAPI.Structs_ReferenceStruct.f__iota_get_TestAPI_Structs_ReferenceStruct_mutable = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Structs_ReferenceStruct_mutable");
    TestAPI.Tuples.f__iota_get_TestAPI_Tuples_tuple2 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Tuples_tuple2");
    TestAPI.Tuples.f__iota_get_TestAPI_Tuples_tuple3 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Tuples_tuple3");
    TestAPI.Tuples.f__iota_get_TestAPI_Tuples_tuple4 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Tuples_tuple4");
    TestAPI.Tuples.f__iota_get_TestAPI_Tuples_tuple5 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Tuples_tuple5");
    TestAPI.Tuples.f__iota_get_TestAPI_Tuples_tuple6 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_Tuples_tuple6");
    TestAPI.URLs.f__iota_get_TestAPI_URLs_localFile = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_URLs_localFile");
    TestAPI.URLs.f__iota_get_TestAPI_URLs_remoteFile = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_URLs_remoteFile");
    TestAPI.URLs.f__iota_get_TestAPI_URLs_simple = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_TestAPI_URLs_simple");
    TestAPI.Collections_CollectionHolder.f__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef staticMutableProperty,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef staticMutableProperty,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty");
    TestAPI.Methods.f__iota_set_TestAPI_Methods_instanceModifiable = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            ffi.Int instanceModifiable,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            int instanceModifiable,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_Methods_instanceModifiable");
    TestAPI.Methods.f__iota_set_TestAPI_Methods_instanceStored = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            ffi.Int instanceStored,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            int instanceStored,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_Methods_instanceStored");
    TestAPI.Methods.f__iota_set_TestAPI_Methods_staticModifiable = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Int staticModifiable,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            int staticModifiable,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_Methods_staticModifiable");
    TestAPI.Methods.f__iota_set_TestAPI_Methods_staticStored = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Int staticStored,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            int staticStored,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_Methods_staticStored");
    TestAPI.Primitives_PrimitiveHolder.f__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef staticMutableProperty,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef staticMutableProperty,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty");
    TestAPI.SimpleEnum.f__iota_set_TestAPI_SimpleEnum_favoriteColor = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef favoriteColor,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef favoriteColor,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_SimpleEnum_favoriteColor");
    TestAPI.Structs_ReferenceStruct.f__iota_set_TestAPI_Structs_ReferenceStruct_mutable = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef mutable,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef mutable,
            OutCreatedRef _exn
        )
    >("__iota_set_TestAPI_Structs_ReferenceStruct_mutable");

    Loader.shared.once("setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", () {
        // print("setting up ((Int) -> Int, (Int) -> Int) -> (Int) -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function2Converter_setup<int Function(int), int Function(int), int Function(int)>(
                Loader.shared.env,
                "Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () {
        // print("setting up (Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup<List<int?>?, List<int?>?>(
                Loader.shared.env,
                "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", () {
        // print("setting up (Optional<UInt8>) -> Optional<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup<int?, int?>(
                Loader.shared.env,
                "Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () {
        // print("setting up (Float, Double, Int) -> Double (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function3Converter_setup<double, double, double, int>(
                Loader.shared.env,
                "Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<Swift.Int, Swift.Int>", () {
        // print("setting up (Int) -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup<int, int>(
                Loader.shared.env,
                "Function1Converter<Swift.Int, Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", () {
        // print("setting up (String, Int, Double, String, () -> Int, Int) -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function6Converter_setup<int, String, int, double, String, int Function(), int>(
                Loader.shared.env,
                "Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", () {
        // print("setting up (String, Int, Double, String, () -> Int) -> () -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function5Converter_setup<int Function(), String, int, double, String, int Function()>(
                Loader.shared.env,
                "Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () {
        // print("setting up (String, String, String, String) -> Array<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function4Converter_setup<List<String>, String, String, String, String>(
                Loader.shared.env,
                "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<Swift.Int>", () {
        // print("setting up () -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function0Converter_setup<int>(
                Loader.shared.env,
                "Function0Converter<Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Bool>>", () {
        // print("setting up Array<Optional<Bool>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<bool?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Bool>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Double>>", () {
        // print("setting up Array<Optional<Double>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<double?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Double>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Float>>", () {
        // print("setting up Array<Optional<Float>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<double?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Float>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int>>", () {
        // print("setting up Array<Optional<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int16>>", () {
        // print("setting up Array<Optional<Int16>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Int16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int32>>", () {
        // print("setting up Array<Optional<Int32>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Int32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int64>>", () {
        // print("setting up Array<Optional<Int64>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Int64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int8>>", () {
        // print("setting up Array<Optional<Int8>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.Int8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt>>", () {
        // print("setting up Array<Optional<UInt>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.UInt>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt16>>", () {
        // print("setting up Array<Optional<UInt16>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.UInt16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt32>>", () {
        // print("setting up Array<Optional<UInt32>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.UInt32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt64>>", () {
        // print("setting up Array<Optional<UInt64>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.UInt64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt8>>", () {
        // print("setting up Array<Optional<UInt8>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Swift.UInt8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Foundation.AttributedString.Runs.Run>", () {
        // print("setting up Array<AttributedString.Runs.Run> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<FishyJoesRuntime.AttributedString_Runs_Run>(
                Loader.shared.env,
                "ArrayConverter<Foundation.AttributedString.Runs.Run>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Foundation.AttributedSubstring>", () {
        // print("setting up Array<AttributedSubstring> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<FishyJoesRuntime.AttributedSubstring>(
                Loader.shared.env,
                "ArrayConverter<Foundation.AttributedSubstring>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Bool>", () {
        // print("setting up Array<Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<bool>(
                Loader.shared.env,
                "ArrayConverter<Swift.Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Double>", () {
        // print("setting up Array<Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<double>(
                Loader.shared.env,
                "ArrayConverter<Swift.Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Float>", () {
        // print("setting up Array<Float> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<double>(
                Loader.shared.env,
                "ArrayConverter<Swift.Float>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int>", () {
        // print("setting up Array<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int16>", () {
        // print("setting up Array<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.Int16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int32>", () {
        // print("setting up Array<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.Int32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int64>", () {
        // print("setting up Array<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.Int64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int8>", () {
        // print("setting up Array<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.Int8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.String>", () {
        // print("setting up Array<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<String>(
                Loader.shared.env,
                "ArrayConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt>", () {
        // print("setting up Array<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.UInt>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt16>", () {
        // print("setting up Array<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.UInt16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt32>", () {
        // print("setting up Array<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.UInt32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt64>", () {
        // print("setting up Array<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.UInt64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt8>", () {
        // print("setting up Array<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Swift.UInt8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>", () {
        // print("setting up Array<(Int8, Int16, Int32, Int64)> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup<tuple.Tuple4<int, int, int, int>>(
                Loader.shared.env,
                "ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.Bool, Swift.Bool>", () {
        // print("setting up Dictionary<Bool, Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup<bool, bool>(
                Loader.shared.env,
                "DictionaryConverter<Swift.Bool, Swift.Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>", () {
        // print("setting up Dictionary<Int, Optional<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup<int, int?>(
                Loader.shared.env,
                "DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.Int, Swift.Int>", () {
        // print("setting up Dictionary<Int, Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup<int, int>(
                Loader.shared.env,
                "DictionaryConverter<Swift.Int, Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.String, Swift.String>", () {
        // print("setting up Dictionary<String, String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup<String, String>(
                Loader.shared.env,
                "DictionaryConverter<Swift.String, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>", () {
        // print("setting up Optional<Array<Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<Swift.Int>>", () {
        // print("setting up Optional<Array<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>", () {
        // print("setting up Optional<Dictionary<Int, Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>", () {
        // print("setting up Optional<Dictionary<Int, Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>", () {
        // print("setting up Optional<Set<Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<Swift.Int>>", () {
        // print("setting up Optional<Set<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Bool>", () {
        // print("setting up Optional<Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Double>", () {
        // print("setting up Optional<Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Float>", () {
        // print("setting up Optional<Float> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int>", () {
        // print("setting up Optional<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int16>", () {
        // print("setting up Optional<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int32>", () {
        // print("setting up Optional<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int64>", () {
        // print("setting up Optional<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int8>", () {
        // print("setting up Optional<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<TestAPI.SimpleEnum>", () {
        // print("setting up Optional<SimpleEnum> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt>", () {
        // print("setting up Optional<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt16>", () {
        // print("setting up Optional<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt32>", () {
        // print("setting up Optional<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt64>", () {
        // print("setting up Optional<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt8>", () {
        // print("setting up Optional<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Double>", () {
        // print("setting up ClosedRange<Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<double>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Float>", () {
        // print("setting up ClosedRange<Float> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<double>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.Float>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int>", () {
        // print("setting up ClosedRange<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int16>", () {
        // print("setting up ClosedRange<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.Int16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int32>", () {
        // print("setting up ClosedRange<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.Int32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int64>", () {
        // print("setting up ClosedRange<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.Int64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int8>", () {
        // print("setting up ClosedRange<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.Int8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.String>", () {
        // print("setting up ClosedRange<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<String>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt>", () {
        // print("setting up ClosedRange<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.UInt>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt16>", () {
        // print("setting up ClosedRange<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.UInt16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt32>", () {
        // print("setting up ClosedRange<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.UInt32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt64>", () {
        // print("setting up ClosedRange<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.UInt64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt8>", () {
        // print("setting up ClosedRange<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup<int>(
                Loader.shared.env,
                "ClosedRangeConverter<Swift.UInt8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Foundation.AttributedString.Index>", () {
        // print("setting up Range<AttributedString.Index> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<FishyJoesRuntime.AttributedString_Index>(
                Loader.shared.env,
                "RangeConverter<Foundation.AttributedString.Index>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int>", () {
        // print("setting up Range<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int16>", () {
        // print("setting up Range<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.Int16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int32>", () {
        // print("setting up Range<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.Int32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int64>", () {
        // print("setting up Range<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.Int64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int8>", () {
        // print("setting up Range<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.Int8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt>", () {
        // print("setting up Range<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.UInt>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt16>", () {
        // print("setting up Range<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.UInt16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt32>", () {
        // print("setting up Range<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.UInt32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt64>", () {
        // print("setting up Range<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.UInt64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt8>", () {
        // print("setting up Range<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup<int>(
                Loader.shared.env,
                "RangeConverter<Swift.UInt8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<OptionalConverter<Swift.Int>>", () {
        // print("setting up Set<Optional<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup<int?>(
                Loader.shared.env,
                "SetConverter<OptionalConverter<Swift.Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.Bool>", () {
        // print("setting up Set<Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup<bool>(
                Loader.shared.env,
                "SetConverter<Swift.Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.Int>", () {
        // print("setting up Set<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup<int>(
                Loader.shared.env,
                "SetConverter<Swift.Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.String>", () {
        // print("setting up Set<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup<String>(
                Loader.shared.env,
                "SetConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.AttributedString_PuttingTypesIntoQuestionablePlaces.ffi_constructor),
                ffi.Pointer.fromFunction(TestAPI.AttributedString_PuttingTypesIntoQuestionablePlaces.ffi_get_x),
                exn
            );
        });
    });

    Loader.shared.once("setup_Swift.String.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up Swift.String.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.String_PuttingTypesIntoQuestionablePlaces.ffi_constructor),
                ffi.Pointer.fromFunction(TestAPI.String_PuttingTypesIntoQuestionablePlaces.ffi_get_x),
                exn
            );
        });
    });

    Loader.shared.once("setup_Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.newThing),
                ffi.Pointer.fromFunction(TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.extractThing),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Collections.CollectionHolder", () {
        // print("setting up TestAPI.Collections.CollectionHolder (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Collections_CollectionHolder_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_constructor),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_boolArray),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_boolArray),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_boolSet),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_boolSet),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_boolDictionary),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_boolDictionary),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_integerArray),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_integerArray),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_integerSet),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_integerSet),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_integerDictionary),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_integerDictionary),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_stringArray),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_stringArray),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_stringSet),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_stringSet),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_get_stringDictionary),
                ffi.Pointer.fromFunction(TestAPI.Collections_CollectionHolder.ffi_set_stringDictionary),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Functions.TheError", () {
        // print("setting up TestAPI.Functions.TheError (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Functions_TheError_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.Functions_TheError.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Primitives.PrimitiveHolder", () {
        // print("setting up TestAPI.Primitives.PrimitiveHolder (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Primitives_PrimitiveHolder_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_constructor),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_b, false),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_b),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_bq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_bq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui8, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui8),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui8q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui8q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui16, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui16),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui16q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui16q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui32, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui32),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui32q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui32q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui64, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui64),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui64q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui64q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_ui, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_ui),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_uiq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_uiq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i8, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i8),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i8q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i8q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i16, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i16),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i16q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i16q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i32, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i32),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i32q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i32q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i64, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i64),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i64q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i64q),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_i, 0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_i),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_iq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_iq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_f, 0.0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_f),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_fq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_fq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_d, 0.0),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_d),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_get_dq),
                ffi.Pointer.fromFunction(TestAPI.Primitives_PrimitiveHolder.ffi_set_dq),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.MemberwiseStruct", () {
        // print("setting up TestAPI.Structs.MemberwiseStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_MemberwiseStruct_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.Structs_MemberwiseStruct.ffi_constructor),
                ffi.Pointer.fromFunction(TestAPI.Structs_MemberwiseStruct.ffi_get_immutable),
                ffi.Pointer.fromFunction(TestAPI.Structs_MemberwiseStruct.ffi_get_mutable),
                ffi.Pointer.fromFunction(TestAPI.Structs_MemberwiseStruct.ffi_set_mutable),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up TestAPI.Structs.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.Structs_PuttingTypesIntoQuestionablePlaces.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.ReferenceStruct", () {
        // print("setting up TestAPI.Structs.ReferenceStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_ReferenceStruct_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.Structs_ReferenceStruct.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.AssociatedDataEnum", () {
        // print("setting up TestAPI.AssociatedDataEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_AssociatedDataEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newThing),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractThing),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newOther),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractOther),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newBar),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractBar),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newNoValue),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractNoValue),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newSimpleEnum),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractSimpleEnum),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.AttributedStrings", () {
        // print("setting up TestAPI.AttributedStrings (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_AttributedStrings_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Bytes", () {
        // print("setting up TestAPI.Bytes (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Bytes_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ClosedRanges", () {
        // print("setting up TestAPI.ClosedRanges (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ClosedRanges_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Collections", () {
        // print("setting up TestAPI.Collections (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Collections_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.DefaultArguments", () {
        // print("setting up TestAPI.DefaultArguments (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_DefaultArguments_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Deprecations", () {
        // print("setting up TestAPI.Deprecations (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Deprecations_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.EmptyEnum", () {
        // print("setting up TestAPI.EmptyEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_EmptyEnum_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Functions", () {
        // print("setting up TestAPI.Functions (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Functions_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Methods", () {
        // print("setting up TestAPI.Methods (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Methods_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.Methods.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.MethodsProtocol", () {
        // print("setting up TestAPI.MethodsProtocol (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_MethodsProtocol_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Primitives", () {
        // print("setting up TestAPI.Primitives (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Primitives_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Ranges", () {
        // print("setting up TestAPI.Ranges (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Ranges_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.SimpleEnum", () {
        // print("setting up TestAPI.SimpleEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_SimpleEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(TestAPI.SimpleEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(TestAPI.SimpleEnum.newRed),
                ffi.Pointer.fromFunction(TestAPI.SimpleEnum.extractRed),
                ffi.Pointer.fromFunction(TestAPI.SimpleEnum.newGreen),
                ffi.Pointer.fromFunction(TestAPI.SimpleEnum.extractGreen),
                ffi.Pointer.fromFunction(TestAPI.SimpleEnum.newBlue),
                ffi.Pointer.fromFunction(TestAPI.SimpleEnum.extractBlue),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Strings", () {
        // print("setting up TestAPI.Strings (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Strings_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs", () {
        // print("setting up TestAPI.Structs (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Tuples", () {
        // print("setting up TestAPI.Tuples (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Tuples_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.URLs", () {
        // print("setting up TestAPI.URLs (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_URLs_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple2Converter<Swift.Int, Swift.String>", () {
        // print("setting up (Int, String) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple2Converter_setup<int, String>(
                Loader.shared.env,
                "Tuple2Converter<Swift.Int, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>", () {
        // print("setting up (Int8, Int16, Int32, Int64) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple4Converter_setup<int, int, int, int>(
                Loader.shared.env,
                "Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple3Converter<Swift.String, Swift.Double, Swift.String>", () {
        // print("setting up (String, Double, String) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple3Converter_setup<String, double, String>(
                Loader.shared.env,
                "Tuple3Converter<Swift.String, Swift.Double, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>", () {
        // print("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple6Converter_setup<String, int, double, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple5<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>>, bool>(
                Loader.shared.env,
                "Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>", () {
        // print("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple5Converter_setup<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>>(
                Loader.shared.env,
                "Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>", () {
        // print("setting up ((Int, String), (String, Double, String), String, Bool) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple4Converter_setup<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>(
                Loader.shared.env,
                "Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>",
                exn
            );
        });
    });

    arena.releaseAll();
})();
