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
typedef _Structs_MemberwiseStructConstructor = CreatedRef Function(
    ConsumedRef immutable,
    ConsumedRef mutable,
    OutCreatedRef exn
);
typedef _Structs_MemberwiseStruct_immutableGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Structs_MemberwiseStruct_immutableSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
typedef _Structs_MemberwiseStruct_mutableGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _Structs_MemberwiseStruct_mutableSetter = void Function(UnownedRef obj, ConsumedRef newValue, OutCreatedRef exn);
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

final ensureLoaded = (() {
    final libraryPath = path.join(Directory.current.path, 'native', 'libTestAPI-dart.dylib');
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    final arena = ffi.Arena();

    dylib.lookupFunction<ffi.Void Function(), void Function()>('FishyJoes_TestAPI_registerTypes')();

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
            OutCreatedRef exn
        )
    >('TestAPI_AssociatedDataEnum_setup');
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
    final TestAPI_Collections_CollectionHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Collections_CollectionHolder_setup');
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
    final TestAPI_Structs_MemberwiseStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_MemberwiseStruct_setup');
    final TestAPI_Primitives_PrimitiveHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Primitives_PrimitiveHolder_setup');
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
    final TestAPI_Structs_ReferenceStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_ReferenceStruct_setup');
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
    final TestAPI_Functions_TheError_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Functions_TheError_setup');
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
    TestAPI.AssociatedDataEnum.f__dart_AssociatedDataEnum_plus = dylib.lookupFunction<
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
    >("__dart_AssociatedDataEnum_plus");
    TestAPI.Bytes.f__dart_Bytes_echoBytes = dylib.lookupFunction<
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
    >("__dart_Bytes_echoBytes");
    TestAPI.Bytes.f__dart_Bytes_echoData = dylib.lookupFunction<
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
    >("__dart_Bytes_echoData");
    TestAPI.Collections.f__dart_Collections_collectionMapper = dylib.lookupFunction<
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
    >("__dart_Collections_collectionMapper");
    TestAPI.Collections.f__dart_Collections_echoArrayOfInt = dylib.lookupFunction<
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
    >("__dart_Collections_echoArrayOfInt");
    TestAPI.Collections.f__dart_Collections_echoDictionaryOfIntToInt = dylib.lookupFunction<
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
    >("__dart_Collections_echoDictionaryOfIntToInt");
    TestAPI.Collections.f__dart_Collections_echoMaybeArrayOfMaybeInt = dylib.lookupFunction<
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
    >("__dart_Collections_echoMaybeArrayOfMaybeInt");
    TestAPI.Collections.f__dart_Collections_echoMaybeDictionaryOfIntToMaybeInt = dylib.lookupFunction<
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
    >("__dart_Collections_echoMaybeDictionaryOfIntToMaybeInt");
    TestAPI.Collections.f__dart_Collections_echoMaybeSetOfMaybeInt = dylib.lookupFunction<
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
    >("__dart_Collections_echoMaybeSetOfMaybeInt");
    TestAPI.Collections.f__dart_Collections_echoSetOfInt = dylib.lookupFunction<
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
    >("__dart_Collections_echoSetOfInt");
    TestAPI.DefaultArguments.f__dart_DefaultArguments_echoDefaults = dylib.lookupFunction<
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
    >("__dart_DefaultArguments_echoDefaults");
    TestAPI.Deprecations.f__dart_Deprecations_deprecatedMethod = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_Deprecations_deprecatedMethod");
    TestAPI.EmptyEnum.f__dart_EmptyEnum_notGoingToHappen = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_EmptyEnum_notGoingToHappen");
    TestAPI.Functions.f__dart_Functions_exercise0 = dylib.lookupFunction<
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
    >("__dart_Functions_exercise0");
    TestAPI.Functions.f__dart_Functions_exercise1 = dylib.lookupFunction<
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
    >("__dart_Functions_exercise1");
    TestAPI.Functions.f__dart_Functions_exercise2 = dylib.lookupFunction<
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
    >("__dart_Functions_exercise2");
    TestAPI.Functions.f__dart_Functions_exercise3 = dylib.lookupFunction<
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
    >("__dart_Functions_exercise3");
    TestAPI.Functions.f__dart_Functions_exercise4 = dylib.lookupFunction<
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
    >("__dart_Functions_exercise4");
    TestAPI.Functions.f__dart_Functions_exercise5 = dylib.lookupFunction<
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
    >("__dart_Functions_exercise5");
    TestAPI.Functions.f__dart_Functions_exercise6 = dylib.lookupFunction<
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
    >("__dart_Functions_exercise6");
    TestAPI.Functions.f__dart_Functions_willThrow = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_Functions_willThrow");
    TestAPI.Primitives.f__dart_Primitives_echoBool = dylib.lookupFunction<
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
    >("__dart_Primitives_echoBool");
    TestAPI.Primitives.f__dart_Primitives_echoDouble = dylib.lookupFunction<
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
    >("__dart_Primitives_echoDouble");
    TestAPI.Primitives.f__dart_Primitives_echoFloat = dylib.lookupFunction<
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
    >("__dart_Primitives_echoFloat");
    TestAPI.Primitives.f__dart_Primitives_echoInt16 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoInt16");
    TestAPI.Primitives.f__dart_Primitives_echoInt32 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoInt32");
    TestAPI.Primitives.f__dart_Primitives_echoInt64 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoInt64");
    TestAPI.Primitives.f__dart_Primitives_echoInt8 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoInt8");
    TestAPI.Primitives.f__dart_Primitives_echoUInt16 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoUInt16");
    TestAPI.Primitives.f__dart_Primitives_echoUInt32 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoUInt32");
    TestAPI.Primitives.f__dart_Primitives_echoUInt64 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoUInt64");
    TestAPI.Primitives.f__dart_Primitives_echoUInt8 = dylib.lookupFunction<
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
    >("__dart_Primitives_echoUInt8");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoBool = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoBool");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoDouble = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoDouble");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoFloat = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoFloat");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoInt16 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoInt16");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoInt32 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoInt32");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoInt64 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoInt64");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoInt8 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoInt8");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoUInt16 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoUInt16");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoUInt32 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoUInt32");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoUInt64 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoUInt64");
    TestAPI.Primitives.f__dart_Primitives_maybeEchoUInt8 = dylib.lookupFunction<
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
    >("__dart_Primitives_maybeEchoUInt8");
    TestAPI.Primitives.f__dart_Primitives_valueMapper = dylib.lookupFunction<
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
    >("__dart_Primitives_valueMapper");
    TestAPI.SimpleEnum.f__dart_SimpleEnum_hexMethod = dylib.lookupFunction<
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
    >("__dart_SimpleEnum_hexMethod");
    TestAPI.SimpleEnum.f__dart_SimpleEnum_pickAColor = dylib.lookupFunction<
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
    >("__dart_SimpleEnum_pickAColor");
    TestAPI.SimpleEnum.f__dart_SimpleEnum_resetFavoriteColor = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_SimpleEnum_resetFavoriteColor");
    TestAPI.Strings.f__dart_Strings_echo = dylib.lookupFunction<
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
    >("__dart_Strings_echo");
    TestAPI.Structs_MemberwiseStruct.f__dart_Structs_MemberwiseStruct_create = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_Structs_MemberwiseStruct_create");
    TestAPI.Tuples.f__dart_Tuples_checkTuples = dylib.lookupFunction<
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
    >("__dart_Tuples_checkTuples");
    TestAPI.AssociatedDataEnum.f__dart_get_AssociatedDataEnum_intValue = dylib.lookupFunction<
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
    >("__dart_get_AssociatedDataEnum_intValue");
    TestAPI.AssociatedDataEnum.f__dart_get_AssociatedDataEnum_staticThing = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_AssociatedDataEnum_staticThing");
    TestAPI.Bytes.f__dart_get_Bytes_bytes = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Bytes_bytes");
    TestAPI.Bytes.f__dart_get_Bytes_data = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Bytes_data");
    TestAPI.Collections_CollectionHolder.f__dart_get_Collections_CollectionHolder_staticMutablePropery = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_CollectionHolder_staticMutablePropery");
    TestAPI.Collections_CollectionHolder.f__dart_get_Collections_CollectionHolder_staticPropery = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_CollectionHolder_staticPropery");
    TestAPI.Collections.f__dart_get_Collections_arrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_arrayOfInt");
    TestAPI.Collections.f__dart_get_Collections_defaultCollectionHolder = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_defaultCollectionHolder");
    TestAPI.Collections.f__dart_get_Collections_dictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_dictionaryOfIntToInt");
    TestAPI.Collections.f__dart_get_Collections_maybeArrayOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_maybeArrayOfInt");
    TestAPI.Collections.f__dart_get_Collections_maybeArrayOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_maybeArrayOfMaybeInt");
    TestAPI.Collections.f__dart_get_Collections_maybeDictionaryOfIntToInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_maybeDictionaryOfIntToInt");
    TestAPI.Collections.f__dart_get_Collections_maybeDictionaryOfIntToMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_maybeDictionaryOfIntToMaybeInt");
    TestAPI.Collections.f__dart_get_Collections_maybeSetOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_maybeSetOfInt");
    TestAPI.Collections.f__dart_get_Collections_maybeSetOfMaybeInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_maybeSetOfMaybeInt");
    TestAPI.Collections.f__dart_get_Collections_setOfInt = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Collections_setOfInt");
    TestAPI.Deprecations.f__dart_get_Deprecations_deprecatedVariable = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Deprecations_deprecatedVariable");
    TestAPI.Functions.f__dart_get_Functions_abs = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Functions_abs");
    TestAPI.Functions.f__dart_get_Functions_add3Things = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Functions_add3Things");
    TestAPI.Functions.f__dart_get_Functions_const42 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Functions_const42");
    TestAPI.Functions.f__dart_get_Functions_fifthThing = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Functions_fifthThing");
    TestAPI.Functions.f__dart_get_Functions_intCompose = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Functions_intCompose");
    TestAPI.Functions.f__dart_get_Functions_makeList = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Functions_makeList");
    TestAPI.Functions.f__dart_get_Functions_sixthThing = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Functions_sixthThing");
    TestAPI.Primitives_PrimitiveHolder.f__dart_get_Primitives_PrimitiveHolder_staticMutablePropery = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_PrimitiveHolder_staticMutablePropery");
    TestAPI.Primitives_PrimitiveHolder.f__dart_get_Primitives_PrimitiveHolder_staticPropery = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_PrimitiveHolder_staticPropery");
    TestAPI.Primitives.f__dart_get_Primitives_defaultPrimitiveHolder = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_defaultPrimitiveHolder");
    TestAPI.Primitives.f__dart_get_Primitives_falseBool = dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_falseBool");
    TestAPI.Primitives.f__dart_get_Primitives_manyBool = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyBool");
    TestAPI.Primitives.f__dart_get_Primitives_manyDouble = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyDouble");
    TestAPI.Primitives.f__dart_get_Primitives_manyFloat = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyFloat");
    TestAPI.Primitives.f__dart_get_Primitives_manyInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyInt16");
    TestAPI.Primitives.f__dart_get_Primitives_manyInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyInt32");
    TestAPI.Primitives.f__dart_get_Primitives_manyInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyInt64");
    TestAPI.Primitives.f__dart_get_Primitives_manyInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyInt8");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeBool = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeBool");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeDouble = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeDouble");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeFloat = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeFloat");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeInt16");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeInt32");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeInt64");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeInt8");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeUInt16");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeUInt32");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeUInt64");
    TestAPI.Primitives.f__dart_get_Primitives_manyMaybeUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyMaybeUInt8");
    TestAPI.Primitives.f__dart_get_Primitives_manyUInt16 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyUInt16");
    TestAPI.Primitives.f__dart_get_Primitives_manyUInt32 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyUInt32");
    TestAPI.Primitives.f__dart_get_Primitives_manyUInt64 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyUInt64");
    TestAPI.Primitives.f__dart_get_Primitives_manyUInt8 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_manyUInt8");
    TestAPI.Primitives.f__dart_get_Primitives_maxDouble = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxDouble");
    TestAPI.Primitives.f__dart_get_Primitives_maxFloat = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxFloat");
    TestAPI.Primitives.f__dart_get_Primitives_maxInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxInt");
    TestAPI.Primitives.f__dart_get_Primitives_maxInt16 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxInt16");
    TestAPI.Primitives.f__dart_get_Primitives_maxInt32 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxInt32");
    TestAPI.Primitives.f__dart_get_Primitives_maxInt64 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxInt64");
    TestAPI.Primitives.f__dart_get_Primitives_maxInt8 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxInt8");
    TestAPI.Primitives.f__dart_get_Primitives_maxUInt16 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxUInt16");
    TestAPI.Primitives.f__dart_get_Primitives_maxUInt32 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxUInt32");
    TestAPI.Primitives.f__dart_get_Primitives_maxUInt64 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxUInt64");
    TestAPI.Primitives.f__dart_get_Primitives_maxUInt8 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_maxUInt8");
    TestAPI.Primitives.f__dart_get_Primitives_minDouble = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minDouble");
    TestAPI.Primitives.f__dart_get_Primitives_minFloat = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minFloat");
    TestAPI.Primitives.f__dart_get_Primitives_minInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minInt");
    TestAPI.Primitives.f__dart_get_Primitives_minInt16 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minInt16");
    TestAPI.Primitives.f__dart_get_Primitives_minInt32 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minInt32");
    TestAPI.Primitives.f__dart_get_Primitives_minInt64 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minInt64");
    TestAPI.Primitives.f__dart_get_Primitives_minInt8 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minInt8");
    TestAPI.Primitives.f__dart_get_Primitives_minUInt16 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minUInt16");
    TestAPI.Primitives.f__dart_get_Primitives_minUInt32 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minUInt32");
    TestAPI.Primitives.f__dart_get_Primitives_minUInt64 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minUInt64");
    TestAPI.Primitives.f__dart_get_Primitives_minUInt8 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_minUInt8");
    TestAPI.Primitives.f__dart_get_Primitives_trueBool = dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_trueBool");
    TestAPI.Primitives.f__dart_get_Primitives_zeroDouble = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroDouble");
    TestAPI.Primitives.f__dart_get_Primitives_zeroFloat = dylib.lookupFunction<
        ffi.Double Function(
            Env env,
            OutCreatedRef _exn
        ),
        double Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroFloat");
    TestAPI.Primitives.f__dart_get_Primitives_zeroInt = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroInt");
    TestAPI.Primitives.f__dart_get_Primitives_zeroInt16 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroInt16");
    TestAPI.Primitives.f__dart_get_Primitives_zeroInt32 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroInt32");
    TestAPI.Primitives.f__dart_get_Primitives_zeroInt64 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroInt64");
    TestAPI.Primitives.f__dart_get_Primitives_zeroInt8 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroInt8");
    TestAPI.Primitives.f__dart_get_Primitives_zeroUInt16 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroUInt16");
    TestAPI.Primitives.f__dart_get_Primitives_zeroUInt32 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroUInt32");
    TestAPI.Primitives.f__dart_get_Primitives_zeroUInt64 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroUInt64");
    TestAPI.Primitives.f__dart_get_Primitives_zeroUInt8 = dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Primitives_zeroUInt8");
    TestAPI.SimpleEnum.f__dart_get_SimpleEnum_favoriteColor = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_SimpleEnum_favoriteColor");
    TestAPI.SimpleEnum.f__dart_get_SimpleEnum_hex = dylib.lookupFunction<
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
    >("__dart_get_SimpleEnum_hex");
    TestAPI.Strings.f__dart_get_Strings_accent = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_accent");
    TestAPI.Strings.f__dart_get_Strings_chinese = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_chinese");
    TestAPI.Strings.f__dart_get_Strings_chineseBMP = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_chineseBMP");
    TestAPI.Strings.f__dart_get_Strings_chineseSIP = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_chineseSIP");
    TestAPI.Strings.f__dart_get_Strings_emoji = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_emoji");
    TestAPI.Strings.f__dart_get_Strings_emojiMulti = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_emojiMulti");
    TestAPI.Strings.f__dart_get_Strings_script = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_script");
    TestAPI.Strings.f__dart_get_Strings_simple = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Strings_simple");
    TestAPI.Tuples.f__dart_get_Tuples_tuple2 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Tuples_tuple2");
    TestAPI.Tuples.f__dart_get_Tuples_tuple3 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Tuples_tuple3");
    TestAPI.Tuples.f__dart_get_Tuples_tuple4 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Tuples_tuple4");
    TestAPI.Tuples.f__dart_get_Tuples_tuple5 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Tuples_tuple5");
    TestAPI.Tuples.f__dart_get_Tuples_tuple6 = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__dart_get_Tuples_tuple6");
    TestAPI.Collections_CollectionHolder.f__dart_set_Collections_CollectionHolder_staticMutablePropery = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        )
    >("__dart_set_Collections_CollectionHolder_staticMutablePropery");
    TestAPI.Primitives_PrimitiveHolder.f__dart_set_Primitives_PrimitiveHolder_staticMutablePropery = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef staticMutablePropery,
            OutCreatedRef _exn
        )
    >("__dart_set_Primitives_PrimitiveHolder_staticMutablePropery");
    TestAPI.SimpleEnum.f__dart_set_SimpleEnum_favoriteColor = dylib.lookupFunction<
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
    >("__dart_set_SimpleEnum_favoriteColor");

    Loader.shared.once("setup_Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>", () {
        print("setting up ((Int) -> Int, (Int) -> Int) -> (Int) -> Int (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function2Converter_setup(
                Loader.shared.env,
                "Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>", () {
        print("setting up (Optional<Array<Optional<Int>>>) -> Optional<Array<Optional<Int>>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function1Converter_setup(
                Loader.shared.env,
                "Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>", () {
        print("setting up (Optional<UInt8>) -> Optional<UInt8> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function1Converter_setup(
                Loader.shared.env,
                "Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function3Converter<Float, Double, Int, Double>", () {
        print("setting up (Float, Double, Int) -> Double (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function3Converter_setup(
                Loader.shared.env,
                "Function3Converter<Float, Double, Int, Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<Int, Int>", () {
        print("setting up (Int) -> Int (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function1Converter_setup(
                Loader.shared.env,
                "Function1Converter<Int, Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>", () {
        print("setting up (String, Int, Double, String, () -> Int, Int) -> Int (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function6Converter_setup(
                Loader.shared.env,
                "Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>", () {
        print("setting up (String, Int, Double, String, () -> Int) -> () -> Int (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function5Converter_setup(
                Loader.shared.env,
                "Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () {
        print("setting up (String, String, String, String) -> Array<String> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function4Converter_setup(
                Loader.shared.env,
                "Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<Int>", () {
        print("setting up () -> Int (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Function0Converter_setup(
                Loader.shared.env,
                "Function0Converter<Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Bool>>", () {
        print("setting up Array<Optional<Bool>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<bool?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Bool>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Double>>", () {
        print("setting up Array<Optional<Double>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Double>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Float>>", () {
        print("setting up Array<Optional<Float>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Float>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int>>", () {
        print("setting up Array<Optional<Int>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int16>>", () {
        print("setting up Array<Optional<Int16>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Int16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int32>>", () {
        print("setting up Array<Optional<Int32>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Int32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int64>>", () {
        print("setting up Array<Optional<Int64>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Int64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Int8>>", () {
        print("setting up Array<Optional<Int8>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<Int8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt16>>", () {
        print("setting up Array<Optional<UInt16>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<UInt16>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt32>>", () {
        print("setting up Array<Optional<UInt32>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<UInt32>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt64>>", () {
        print("setting up Array<Optional<UInt64>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<UInt64>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<UInt8>>", () {
        print("setting up Array<Optional<UInt8>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int?>(
                Loader.shared.env,
                "ArrayConverter<OptionalConverter<UInt8>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Bool>", () {
        print("setting up Array<Bool> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<bool>(
                Loader.shared.env,
                "ArrayConverter<Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Double>", () {
        print("setting up Array<Double> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double>(
                Loader.shared.env,
                "ArrayConverter<Double>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Float>", () {
        print("setting up Array<Float> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<double>(
                Loader.shared.env,
                "ArrayConverter<Float>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int>", () {
        print("setting up Array<Int> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int16>", () {
        print("setting up Array<Int16> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Int16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int32>", () {
        print("setting up Array<Int32> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Int32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int64>", () {
        print("setting up Array<Int64> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Int64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Int8>", () {
        print("setting up Array<Int8> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<Int8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.String>", () {
        print("setting up Array<String> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<String>(
                Loader.shared.env,
                "ArrayConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt16>", () {
        print("setting up Array<UInt16> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<UInt16>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt32>", () {
        print("setting up Array<UInt32> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<UInt32>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt64>", () {
        print("setting up Array<UInt64> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<UInt64>",
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<UInt8>", () {
        print("setting up Array<UInt8> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_ArrayConverter_setup<int>(
                Loader.shared.env,
                "ArrayConverter<UInt8>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Bool, Bool>", () {
        print("setting up Dictionary<Bool, Bool> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                "DictionaryConverter<Bool, Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Int, OptionalConverter<Int>>", () {
        print("setting up Dictionary<Int, Optional<Int>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                "DictionaryConverter<Int, OptionalConverter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Int, Int>", () {
        print("setting up Dictionary<Int, Int> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                "DictionaryConverter<Int, Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.String, Swift.String>", () {
        print("setting up Dictionary<String, String> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                "DictionaryConverter<Swift.String, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<OptionalConverter<Int>>>", () {
        print("setting up Optional<Array<Optional<Int>>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<Int>>", () {
        print("setting up Optional<Array<Int>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Int, OptionalConverter<Int>>>", () {
        print("setting up Optional<Dictionary<Int, Optional<Int>>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Int, Int>>", () {
        print("setting up Optional<Dictionary<Int, Int>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<OptionalConverter<Int>>>", () {
        print("setting up Optional<Set<Optional<Int>>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<Int>>", () {
        print("setting up Optional<Set<Int>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Bool>", () {
        print("setting up Optional<Bool> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Double>", () {
        print("setting up Optional<Double> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Float>", () {
        print("setting up Optional<Float> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int>", () {
        print("setting up Optional<Int> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int16>", () {
        print("setting up Optional<Int16> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int32>", () {
        print("setting up Optional<Int32> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int64>", () {
        print("setting up Optional<Int64> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Int8>", () {
        print("setting up Optional<Int8> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SimpleEnum>", () {
        print("setting up Optional<SimpleEnum> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt16>", () {
        print("setting up Optional<UInt16> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt32>", () {
        print("setting up Optional<UInt32> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt64>", () {
        print("setting up Optional<UInt64> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<UInt8>", () {
        print("setting up Optional<UInt8> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<OptionalConverter<Int>>", () {
        print("setting up Set<Optional<Int>> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                Loader.shared.env,
                "SetConverter<OptionalConverter<Int>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Bool>", () {
        print("setting up Set<Bool> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                Loader.shared.env,
                "SetConverter<Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Int>", () {
        print("setting up Set<Int> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                Loader.shared.env,
                "SetConverter<Int>",
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.String>", () {
        print("setting up Set<String> (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_SetConverter_setup(
                Loader.shared.env,
                "SetConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_AssociatedDataEnum", () {
        print("setting up AssociatedDataEnum (env=${Loader.shared.env.address})...");
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
                exn
            );
        });
    });

    Loader.shared.once("setup_Bytes", () {
        print("setting up Bytes (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Bytes_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Collections.CollectionHolder", () {
        print("setting up Collections.CollectionHolder (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Collections_CollectionHolder_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Collections", () {
        print("setting up Collections (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Collections_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_DefaultArguments", () {
        print("setting up DefaultArguments (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_DefaultArguments_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Deprecations", () {
        print("setting up Deprecations (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Deprecations_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_EmptyEnum", () {
        print("setting up EmptyEnum (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_EmptyEnum_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Functions", () {
        print("setting up Functions (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Functions_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs.MemberwiseStruct", () {
        print("setting up Structs.MemberwiseStruct (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Structs_MemberwiseStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Primitives.PrimitiveHolder", () {
        print("setting up Primitives.PrimitiveHolder (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Primitives_PrimitiveHolder_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Primitives", () {
        print("setting up Primitives (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Primitives_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs.ReferenceStruct", () {
        print("setting up Structs.ReferenceStruct (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Structs_ReferenceStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_SimpleEnum", () {
        print("setting up SimpleEnum (env=${Loader.shared.env.address})...");
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

    Loader.shared.once("setup_Strings", () {
        print("setting up Strings (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Strings_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Structs", () {
        print("setting up Structs (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Structs_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Functions.TheError", () {
        print("setting up Functions.TheError (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Functions_TheError_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuples", () {
        print("setting up Tuples (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            TestAPI_Tuples_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple2Converter<Int, Swift.String>", () {
        print("setting up (Int, String) (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple2Converter_setup(
                Loader.shared.env,
                "Tuple2Converter<Int, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple3Converter<Swift.String, Double, Swift.String>", () {
        print("setting up (String, Double, String) (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple3Converter_setup(
                Loader.shared.env,
                "Tuple3Converter<Swift.String, Double, Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>", () {
        print("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool) (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple6Converter_setup(
                Loader.shared.env,
                "Tuple6Converter<Swift.String, Int, Double, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>, Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>", () {
        print("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)) (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple5Converter_setup(
                Loader.shared.env,
                "Tuple5Converter<Swift.String, UInt8, Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>, Tuple3Converter<Swift.String, Double, Swift.String>, Tuple2Converter<Int, Swift.String>>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>", () {
        print("setting up ((Int, String), (String, Double, String), String, Bool) (env=${Loader.shared.env.address})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesRuntime_Tuple4Converter_setup(
                Loader.shared.env,
                "Tuple4Converter<Tuple2Converter<Int, Swift.String>, Tuple3Converter<Swift.String, Double, Swift.String>, Swift.String, Bool>",
                exn
            );
        });
    });

    arena.releaseAll();
})();
