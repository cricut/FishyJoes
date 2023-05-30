import './AssociatedDataEnum.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'dart:typed_data' as typed_data;
import 'package:dart_runtime/runtime.dart';
import 'package:dart_runtime/utilities.dart' as utils;
import 'package:ffi/ffi.dart' as ffi;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as path;
import 'package:tuple/tuple.dart' as tuple;

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
typedef _Collections_CollectionHolderConstructor = CreatedRef Function(
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
typedef _Collections_CollectionHolder_boolArrayGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_boolArraySetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_boolSetGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_boolSetSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_boolDictionaryGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_boolDictionarySetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_integerArrayGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_integerArraySetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_integerSetGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_integerSetSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_integerDictionaryGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_integerDictionarySetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_stringArrayGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_stringArraySetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_stringSetGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_stringSetSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Collections_CollectionHolder_stringDictionaryGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Collections_CollectionHolder_stringDictionarySetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolderConstructor = CreatedRef Function(
    bool b,
    ConsumedRef bq,
    int ui8,
    ConsumedRef ui8q,
    int ui16,
    ConsumedRef ui16q,
    int ui32,
    ConsumedRef ui32q,
    int ui64,
    ConsumedRef ui64q,
    int i8,
    ConsumedRef i8q,
    int i16,
    ConsumedRef i16q,
    int i32,
    ConsumedRef i32q,
    int i64,
    ConsumedRef i64q,
    double f,
    ConsumedRef fq,
    double d,
    ConsumedRef dq,
    OutCreatedRef exn
);
typedef _Primitives_PrimitiveHolder_bGetter = bool Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_bSetter = void Function(UnownedRef obj, bool newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_bqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_bqSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui8Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui8Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui8qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui8qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui16Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui16Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui16qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui16qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui32Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui32Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui32qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui32qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui64Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui64Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui64qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_ui64qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i8Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i8Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i8qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i8qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i16Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i16Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i16qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i16qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i32Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i32Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i32qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i32qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i64Getter = int Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i64Setter = void Function(UnownedRef obj, int newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i64qGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_i64qSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_fGetter = double Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_fSetter = void Function(UnownedRef obj, double newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_fqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_fqSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_dGetter = double Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_dSetter = void Function(UnownedRef obj, double newValue, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_dqGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Primitives_PrimitiveHolder_dqSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
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
typedef _Structs_MemberwiseStructConstructor = CreatedRef Function(
    ConsumedRef immutable,
    ConsumedRef mutable,
    OutCreatedRef exn
);
typedef _Structs_MemberwiseStruct_immutableGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Structs_MemberwiseStruct_immutableSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Structs_MemberwiseStruct_mutableGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Structs_MemberwiseStruct_mutableSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);

final ensureLoaded = (() {
    final libraryPath = path.join(Directory.current.path, 'native', 'libTestAPI-iota.dylib');
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    final arena = ffi.Arena();

    dylib.lookupFunction<ffi.Void Function(), void Function()>('FishyJoes_TestAPI_registerTypes')();

    final TestAPI_AssociatedDataEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_thing>> thing_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_thing>> thing_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_other>> other_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_other>> other_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_bar>> bar_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_bar>> bar_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_noValue>> noValue_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_noValue>> noValue_extractor,
            OutCreatedRef exn
        ),
        void Function(
            ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>> discriminator,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_thing>> thing_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_thing>> thing_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_other>> other_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_other>> other_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_bar>> bar_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_bar>> bar_extractor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_new_noValue>> noValue_constructor,
            ffi.Pointer<ffi.NativeFunction<TestAPI_AssociatedDataEnum_extract_noValue>> noValue_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_AssociatedDataEnum_setup');
    final TestAPI_Bytes_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Bytes_setup');
    final TestAPI_Collections_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Collections_setup');
    final TestAPI_Collections_CollectionHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Collections_CollectionHolder_setup');
    final TestAPI_DefaultArguments_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_DefaultArguments_setup');
    final TestAPI_Deprecations_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Deprecations_setup');
    final TestAPI_EmptyEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_EmptyEnum_setup');
    final TestAPI_Functions_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Functions_setup');
    final TestAPI_Functions_TheError_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Functions_TheError_setup');
    final TestAPI_Primitives_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Primitives_setup');
    final TestAPI_Primitives_PrimitiveHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Primitives_PrimitiveHolder_setup');
    final TestAPI_SimpleEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
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
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Strings_setup');
    final TestAPI_Structs_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Structs_setup');
    final TestAPI_Structs_MemberwiseStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Structs_MemberwiseStruct_setup');
    final TestAPI_Structs_ReferenceStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Structs_ReferenceStruct_setup');
    final TestAPI_Tuples_setup = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef exn
        ),
        void Function(
            OutCreatedRef exn
        )
    >('TestAPI_Tuples_setup');
    TestAPI.AssociatedDataEnum.f__iota_get_AssociatedDataEnum_StaticThing = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_AssociatedDataEnum_StaticThing");
    TestAPI.AssociatedDataEnum.f__iota_get_AssociatedDataEnum_IntValue = dylib.lookupFunction<
        ffi.Int Function(
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_AssociatedDataEnum_IntValue");
    TestAPI.AssociatedDataEnum.f__iota_AssociatedDataEnum_plus = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef _this,
            UnownedRef other,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef _this,
            UnownedRef other,
            OutCreatedRef _exn
        )
    >("__iota_AssociatedDataEnum_plus");
    TestAPI.Bytes.f__iota_Bytes_echoBytes = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef bytes,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef bytes,
            OutCreatedRef _exn
        )
    >("__iota_Bytes_echoBytes");
    TestAPI.Bytes.f__iota_Bytes_echoData = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef data,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef data,
            OutCreatedRef _exn
        )
    >("__iota_Bytes_echoData");
    TestAPI.Bytes.f__iota_get_Bytes_Data = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Bytes_Data");
    TestAPI.Bytes.f__iota_get_Bytes_TheBytes = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Bytes_TheBytes");
    TestAPI.Collections_CollectionHolder.f__iota_get_Collections_CollectionHolder_StaticPropery = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_CollectionHolder_StaticPropery");
    TestAPI.Collections_CollectionHolder.f__iota_get_Collections_CollectionHolder_StaticMutablePropery = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_CollectionHolder_StaticMutablePropery");
    TestAPI.Collections_CollectionHolder.f__iota_set_Collections_CollectionHolder_StaticMutablePropery = dylib.lookupFunction<
        ffi.Void Function(
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        ),
        void Function(
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        )
    >("__iota_set_Collections_CollectionHolder_StaticMutablePropery");
    TestAPI.Collections.f__iota_Collections_collectionMapper = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef collection,
            UnownedRef mapper,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef collection,
            UnownedRef mapper,
            OutCreatedRef _exn
        )
    >("__iota_Collections_collectionMapper");
    TestAPI.Collections.f__iota_Collections_echoArrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef arrayOfInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef arrayOfInt,
            OutCreatedRef _exn
        )
    >("__iota_Collections_echoArrayOfInt");
    TestAPI.Collections.f__iota_Collections_echoSetOfInt = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef setOfInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef setOfInt,
            OutCreatedRef _exn
        )
    >("__iota_Collections_echoSetOfInt");
    TestAPI.Collections.f__iota_Collections_echoDictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef dictionaryOfIntToInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef dictionaryOfIntToInt,
            OutCreatedRef _exn
        )
    >("__iota_Collections_echoDictionaryOfIntToInt");
    TestAPI.Collections.f__iota_get_Collections_MaybeDictionaryOfIntToMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_MaybeDictionaryOfIntToMaybeInt");
    TestAPI.Collections.f__iota_Collections_echoMaybeDictionaryOfIntToMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef maybeDictionaryOfIntToMaybeInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef maybeDictionaryOfIntToMaybeInt,
            OutCreatedRef _exn
        )
    >("__iota_Collections_echoMaybeDictionaryOfIntToMaybeInt");
    TestAPI.Collections.f__iota_get_Collections_MaybeSetOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_MaybeSetOfMaybeInt");
    TestAPI.Collections.f__iota_get_Collections_MaybeSetOfInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_MaybeSetOfInt");
    TestAPI.Collections.f__iota_get_Collections_DefaultCollectionHolder = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_DefaultCollectionHolder");
    TestAPI.Collections.f__iota_Collections_echoMaybeArrayOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef maybeArrayOfMaybeInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef maybeArrayOfMaybeInt,
            OutCreatedRef _exn
        )
    >("__iota_Collections_echoMaybeArrayOfMaybeInt");
    TestAPI.Collections.f__iota_get_Collections_SetOfInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_SetOfInt");
    TestAPI.Collections.f__iota_get_Collections_DictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_DictionaryOfIntToInt");
    TestAPI.Collections.f__iota_get_Collections_MaybeArrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_MaybeArrayOfInt");
    TestAPI.Collections.f__iota_Collections_echoMaybeSetOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef maybeSetOfMaybeInt,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef maybeSetOfMaybeInt,
            OutCreatedRef _exn
        )
    >("__iota_Collections_echoMaybeSetOfMaybeInt");
    TestAPI.Collections.f__iota_get_Collections_MaybeDictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_MaybeDictionaryOfIntToInt");
    TestAPI.Collections.f__iota_get_Collections_MaybeArrayOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_MaybeArrayOfMaybeInt");
    TestAPI.Collections.f__iota_get_Collections_ArrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Collections_ArrayOfInt");
    TestAPI.DefaultArguments.f__iota_DefaultArguments_echoDefaults = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef y,
            UnownedRef x,
            ffi.Double z,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef y,
            UnownedRef x,
            double z,
            OutCreatedRef _exn
        )
    >("__iota_DefaultArguments_echoDefaults");
    TestAPI.Deprecations.f__iota_get_Deprecations_DeprecatedVariable = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Deprecations_DeprecatedVariable");
    TestAPI.Deprecations.f__iota_Deprecations_deprecatedMethod = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_Deprecations_deprecatedMethod");
    TestAPI.EmptyEnum.f__iota_EmptyEnum_notGoingToHappen = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_EmptyEnum_notGoingToHappen");
    TestAPI.Functions.f__iota_Functions_willThrow = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_Functions_willThrow");
    TestAPI.Functions.f__iota_get_Functions_Abs = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Functions_Abs");
    TestAPI.Functions.f__iota_get_Functions_FifthThing = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Functions_FifthThing");
    TestAPI.Functions.f__iota_get_Functions_Add3Things = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Functions_Add3Things");
    TestAPI.Functions.f__iota_Functions_exercise3 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_Functions_exercise3");
    TestAPI.Functions.f__iota_Functions_exercise0 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_Functions_exercise0");
    TestAPI.Functions.f__iota_Functions_exercise5 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_Functions_exercise5");
    TestAPI.Functions.f__iota_get_Functions_Const42 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Functions_Const42");
    TestAPI.Functions.f__iota_Functions_exercise1 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_Functions_exercise1");
    TestAPI.Functions.f__iota_get_Functions_SixthThing = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Functions_SixthThing");
    TestAPI.Functions.f__iota_get_Functions_MakeList = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Functions_MakeList");
    TestAPI.Functions.f__iota_Functions_exercise4 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_Functions_exercise4");
    TestAPI.Functions.f__iota_get_Functions_IntCompose = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Functions_IntCompose");
    TestAPI.Functions.f__iota_Functions_exercise2 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_Functions_exercise2");
    TestAPI.Functions.f__iota_Functions_exercise6 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef fn,
            OutCreatedRef _exn
        )
    >("__iota_Functions_exercise6");
    TestAPI.Structs_MemberwiseStruct.f__iota_Structs_MemberwiseStruct_create = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_Structs_MemberwiseStruct_create");
    TestAPI.Primitives_PrimitiveHolder.f__iota_get_Primitives_PrimitiveHolder_StaticMutablePropery = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_PrimitiveHolder_StaticMutablePropery");
    TestAPI.Primitives_PrimitiveHolder.f__iota_set_Primitives_PrimitiveHolder_StaticMutablePropery = dylib.lookupFunction<
        ffi.Void Function(
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        ),
        void Function(
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        )
    >("__iota_set_Primitives_PrimitiveHolder_StaticMutablePropery");
    TestAPI.Primitives_PrimitiveHolder.f__iota_get_Primitives_PrimitiveHolder_StaticPropery = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_PrimitiveHolder_StaticPropery");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroInt16 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroInt16");
    TestAPI.Primitives.f__iota_get_Primitives_ManyInt16 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyInt16");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeInt32 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroUInt64 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroUInt64");
    TestAPI.Primitives.f__iota_get_Primitives_ManyInt8 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyInt8");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeUInt64");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoDouble = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoDouble");
    TestAPI.Primitives.f__iota_get_Primitives_ManyUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyUInt8");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeUInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeFloat = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeFloat");
    TestAPI.Primitives.f__iota_get_Primitives_MinDouble = dylib.lookupFunction<
        ffi.Double Function(
            OutCreatedRef _exn
        ),
        double Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinDouble");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroUInt32 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroUInt32");
    TestAPI.Primitives.f__iota_get_Primitives_MaxInt16 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxInt16");
    TestAPI.Primitives.f__iota_get_Primitives_MinInt32 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ManyUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyUInt16");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeInt16 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeInt16");
    TestAPI.Primitives.f__iota_Primitives_echoUInt32 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoUInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroUInt16 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroUInt16");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoFloat = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoFloat");
    TestAPI.Primitives.f__iota_get_Primitives_ManyFloat = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyFloat");
    TestAPI.Primitives.f__iota_get_Primitives_ManyInt64 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyInt64");
    TestAPI.Primitives.f__iota_Primitives_echoInt64 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoInt64");
    TestAPI.Primitives.f__iota_get_Primitives_MinInt = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinInt");
    TestAPI.Primitives.f__iota_Primitives_echoInt32 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeUInt8");
    TestAPI.Primitives.f__iota_Primitives_echoFloat = dylib.lookupFunction<
        ffi.Double Function(
            ffi.Double value,
            OutCreatedRef _exn
        ),
        double Function(
            double value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoFloat");
    TestAPI.Primitives.f__iota_get_Primitives_MinUInt64 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinUInt64");
    TestAPI.Primitives.f__iota_get_Primitives_DefaultPrimitiveHolder = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_DefaultPrimitiveHolder");
    TestAPI.Primitives.f__iota_Primitives_echoUInt16 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoUInt16");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoInt16 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoInt16");
    TestAPI.Primitives.f__iota_get_Primitives_ManyDouble = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyDouble");
    TestAPI.Primitives.f__iota_get_Primitives_MaxUInt16 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxUInt16");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeInt64 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeInt64");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeUInt16");
    TestAPI.Primitives.f__iota_get_Primitives_MinInt16 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinInt16");
    TestAPI.Primitives.f__iota_Primitives_echoUInt8 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoUInt8");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroUInt8 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroUInt8");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroInt64 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroInt64");
    TestAPI.Primitives.f__iota_get_Primitives_MaxDouble = dylib.lookupFunction<
        ffi.Double Function(
            OutCreatedRef _exn
        ),
        double Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxDouble");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoUInt16");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoUInt64");
    TestAPI.Primitives.f__iota_get_Primitives_MinUInt8 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinUInt8");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroFloat = dylib.lookupFunction<
        ffi.Double Function(
            OutCreatedRef _exn
        ),
        double Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroFloat");
    TestAPI.Primitives.f__iota_get_Primitives_ManyBool = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyBool");
    TestAPI.Primitives.f__iota_get_Primitives_MinInt64 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinInt64");
    TestAPI.Primitives.f__iota_Primitives_echoDouble = dylib.lookupFunction<
        ffi.Double Function(
            ffi.Double value,
            OutCreatedRef _exn
        ),
        double Function(
            double value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoDouble");
    TestAPI.Primitives.f__iota_get_Primitives_ManyUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyUInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroInt = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroInt");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoUInt32");
    TestAPI.Primitives.f__iota_get_Primitives_MinFloat = dylib.lookupFunction<
        ffi.Double Function(
            OutCreatedRef _exn
        ),
        double Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinFloat");
    TestAPI.Primitives.f__iota_get_Primitives_TrueBool = dylib.lookupFunction<
        ffi.Bool Function(
            OutCreatedRef _exn
        ),
        bool Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_TrueBool");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeInt8 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeInt8");
    TestAPI.Primitives.f__iota_get_Primitives_MinInt8 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinInt8");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeBool = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeBool");
    TestAPI.Primitives.f__iota_Primitives_echoBool = dylib.lookupFunction<
        ffi.Bool Function(
            ffi.Bool value,
            OutCreatedRef _exn
        ),
        bool Function(
            bool value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoBool");
    TestAPI.Primitives.f__iota_Primitives_echoInt16 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoInt16");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroInt32 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ManyInt32 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyInt32");
    TestAPI.Primitives.f__iota_get_Primitives_MaxFloat = dylib.lookupFunction<
        ffi.Double Function(
            OutCreatedRef _exn
        ),
        double Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxFloat");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoUInt8");
    TestAPI.Primitives.f__iota_get_Primitives_MinUInt32 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinUInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ManyUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyUInt64");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoInt8 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoInt8");
    TestAPI.Primitives.f__iota_get_Primitives_MaxInt64 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxInt64");
    TestAPI.Primitives.f__iota_get_Primitives_MaxUInt8 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxUInt8");
    TestAPI.Primitives.f__iota_get_Primitives_MaxInt = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxInt");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoInt32 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroDouble = dylib.lookupFunction<
        ffi.Double Function(
            OutCreatedRef _exn
        ),
        double Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroDouble");
    TestAPI.Primitives.f__iota_Primitives_echoInt8 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoInt8");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoInt64 = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoInt64");
    TestAPI.Primitives.f__iota_Primitives_maybeEchoBool = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_maybeEchoBool");
    TestAPI.Primitives.f__iota_get_Primitives_MaxInt32 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxInt32");
    TestAPI.Primitives.f__iota_get_Primitives_MaxInt8 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxInt8");
    TestAPI.Primitives.f__iota_get_Primitives_MaxUInt32 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxUInt32");
    TestAPI.Primitives.f__iota_get_Primitives_ZeroInt8 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ZeroInt8");
    TestAPI.Primitives.f__iota_get_Primitives_ManyMaybeDouble = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_ManyMaybeDouble");
    TestAPI.Primitives.f__iota_get_Primitives_MaxUInt64 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MaxUInt64");
    TestAPI.Primitives.f__iota_get_Primitives_FalseBool = dylib.lookupFunction<
        ffi.Bool Function(
            OutCreatedRef _exn
        ),
        bool Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_FalseBool");
    TestAPI.Primitives.f__iota_Primitives_echoUInt64 = dylib.lookupFunction<
        ffi.Int Function(
            ffi.Int value,
            OutCreatedRef _exn
        ),
        int Function(
            int value,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_echoUInt64");
    TestAPI.Primitives.f__iota_get_Primitives_MinUInt16 = dylib.lookupFunction<
        ffi.Int Function(
            OutCreatedRef _exn
        ),
        int Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Primitives_MinUInt16");
    TestAPI.Primitives.f__iota_Primitives_valueMapper = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef value,
            UnownedRef mapper,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef value,
            UnownedRef mapper,
            OutCreatedRef _exn
        )
    >("__iota_Primitives_valueMapper");
    TestAPI.SimpleEnum.f__iota_SimpleEnum_resetFavoriteColor = dylib.lookupFunction<
        ffi.Void Function(
            OutCreatedRef _exn
        ),
        void Function(
            OutCreatedRef _exn
        )
    >("__iota_SimpleEnum_resetFavoriteColor");
    TestAPI.SimpleEnum.f__iota_SimpleEnum_hexMethod = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_SimpleEnum_hexMethod");
    TestAPI.SimpleEnum.f__iota_set_SimpleEnum_FavoriteColor = dylib.lookupFunction<
        ffi.Void Function(
            UnownedRef favoriteColor,
            OutCreatedRef _exn
        ),
        void Function(
            UnownedRef favoriteColor,
            OutCreatedRef _exn
        )
    >("__iota_set_SimpleEnum_FavoriteColor");
    TestAPI.SimpleEnum.f__iota_get_SimpleEnum_Hex = dylib.lookupFunction<
        ffi.Int Function(
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_SimpleEnum_Hex");
    TestAPI.SimpleEnum.f__iota_SimpleEnum_pickAColor = dylib.lookupFunction<
        CreatedRef Function(
            ffi.Int rawValue,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            int rawValue,
            OutCreatedRef _exn
        )
    >("__iota_SimpleEnum_pickAColor");
    TestAPI.SimpleEnum.f__iota_get_SimpleEnum_FavoriteColor = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_SimpleEnum_FavoriteColor");
    TestAPI.Strings.f__iota_get_Strings_Accent = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_Accent");
    TestAPI.Strings.f__iota_Strings_echo = dylib.lookupFunction<
        CreatedRef Function(
            UnownedRef string,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            UnownedRef string,
            OutCreatedRef _exn
        )
    >("__iota_Strings_echo");
    TestAPI.Strings.f__iota_get_Strings_ChineseBMP = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_ChineseBMP");
    TestAPI.Strings.f__iota_get_Strings_Script = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_Script");
    TestAPI.Strings.f__iota_get_Strings_EmojiMulti = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_EmojiMulti");
    TestAPI.Strings.f__iota_get_Strings_Simple = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_Simple");
    TestAPI.Strings.f__iota_get_Strings_Emoji = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_Emoji");
    TestAPI.Strings.f__iota_get_Strings_Chinese = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_Chinese");
    TestAPI.Strings.f__iota_get_Strings_ChineseSIP = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Strings_ChineseSIP");
    TestAPI.Tuples.f__iota_get_Tuples_Tuple4 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Tuples_Tuple4");
    TestAPI.Tuples.f__iota_get_Tuples_Tuple6 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Tuples_Tuple6");
    TestAPI.Tuples.f__iota_Tuples_checkTuples = dylib.lookupFunction<
        ffi.Bool Function(
            UnownedRef t2,
            UnownedRef t3,
            UnownedRef t4,
            UnownedRef t5,
            UnownedRef t6,
            OutCreatedRef _exn
        ),
        bool Function(
            UnownedRef t2,
            UnownedRef t3,
            UnownedRef t4,
            UnownedRef t5,
            UnownedRef t6,
            OutCreatedRef _exn
        )
    >("__iota_Tuples_checkTuples");
    TestAPI.Tuples.f__iota_get_Tuples_Tuple2 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Tuples_Tuple2");
    TestAPI.Tuples.f__iota_get_Tuples_Tuple3 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Tuples_Tuple3");
    TestAPI.Tuples.f__iota_get_Tuples_Tuple5 = dylib.lookupFunction<
        CreatedRef Function(
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            OutCreatedRef _exn
        )
    >("__iota_get_Tuples_Tuple5");

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
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<bool>(
                "ArrayConverter<Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Double>", () {
        print("setting up Array<Double>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double>(
                "ArrayConverter<Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Float>", () {
        print("setting up Array<Float>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double>(
                "ArrayConverter<Float>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int16>", () {
        print("setting up Array<Int16>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<Int16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int32>", () {
        print("setting up Array<Int32>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<Int32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int64>", () {
        print("setting up Array<Int64>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<Int64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int8>", () {
        print("setting up Array<Int8>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<Int8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int>", () {
        print("setting up Array<Int>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Bool>>", () {
        print("setting up Array<Optional<Bool>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<bool?>(
                "ArrayConverter<OptionalConverter<Bool>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Double>>", () {
        print("setting up Array<Optional<Double>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double?>(
                "ArrayConverter<OptionalConverter<Double>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Float>>", () {
        print("setting up Array<Optional<Float>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double?>(
                "ArrayConverter<OptionalConverter<Float>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int16>>", () {
        print("setting up Array<Optional<Int16>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<Int16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int32>>", () {
        print("setting up Array<Optional<Int32>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<Int32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int64>>", () {
        print("setting up Array<Optional<Int64>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<Int64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int8>>", () {
        print("setting up Array<Optional<Int8>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<Int8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int>>", () {
        print("setting up Array<Optional<Int>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt16>>", () {
        print("setting up Array<Optional<UInt16>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<UInt16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt32>>", () {
        print("setting up Array<Optional<UInt32>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<UInt32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt64>>", () {
        print("setting up Array<Optional<UInt64>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<UInt64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt8>>", () {
        print("setting up Array<Optional<UInt8>>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                "ArrayConverter<OptionalConverter<UInt8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.String>", () {
        print("setting up Array<String>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<String>(
                "ArrayConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt16>", () {
        print("setting up Array<UInt16>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<UInt16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt32>", () {
        print("setting up Array<UInt32>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<UInt32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt64>", () {
        print("setting up Array<UInt64>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<UInt64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt8>", () {
        print("setting up Array<UInt8>...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                "ArrayConverter<UInt8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_AssociatedDataEnum", () {
        print("setting up AssociatedDataEnum...");
        utils.check<void>((exn) {
            TestAPI_AssociatedDataEnum_setup(
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newThing),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractThing),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newOther),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractOther),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newBar),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractBar),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.newNoValue),
                ffi.Pointer.fromFunction(TestAPI.AssociatedDataEnum.extractNoValue),
                exn
            );
        });
    });

    Loader.shared.once("setup_Bytes", () {
        print("setting up Bytes...");
        utils.check<void>((exn) {
            TestAPI_Bytes_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Collections", () {
        print("setting up Collections...");
        utils.check<void>((exn) {
            TestAPI_Collections_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Collections.CollectionHolder", () {
        print("setting up Collections.CollectionHolder...");
        utils.check<void>((exn) {
            TestAPI_Collections_CollectionHolder_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_DefaultArguments", () {
        print("setting up DefaultArguments...");
        utils.check<void>((exn) {
            TestAPI_DefaultArguments_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Deprecations", () {
        print("setting up Deprecations...");
        utils.check<void>((exn) {
            TestAPI_Deprecations_setup(
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
            TestAPI_EmptyEnum_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Functions", () {
        print("setting up Functions...");
        utils.check<void>((exn) {
            TestAPI_Functions_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Functions.TheError", () {
        print("setting up Functions.TheError...");
        utils.check<void>((exn) {
            TestAPI_Functions_TheError_setup(
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
            TestAPI_Primitives_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Primitives.PrimitiveHolder", () {
        print("setting up Primitives.PrimitiveHolder...");
        utils.check<void>((exn) {
            TestAPI_Primitives_PrimitiveHolder_setup(
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
            TestAPI_SimpleEnum_setup(
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

    Loader.shared.once("setup_Strings", () {
        print("setting up Strings...");
        utils.check<void>((exn) {
            TestAPI_Strings_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs", () {
        print("setting up Structs...");
        utils.check<void>((exn) {
            TestAPI_Structs_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs.MemberwiseStruct", () {
        print("setting up Structs.MemberwiseStruct...");
        utils.check<void>((exn) {
            TestAPI_Structs_MemberwiseStruct_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs.ReferenceStruct", () {
        print("setting up Structs.ReferenceStruct...");
        utils.check<void>((exn) {
            TestAPI_Structs_ReferenceStruct_setup(
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuples", () {
        print("setting up Tuples...");
        utils.check<void>((exn) {
            TestAPI_Tuples_setup(
                exn
            );
        });
    });

    arena.releaseAll();
})();
