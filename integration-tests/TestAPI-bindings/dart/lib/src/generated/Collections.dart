import './AProtocol.dart' as TestAPI;
import './AProtocolImplementation.dart' as TestAPI;
import './Actors.dart' as TestAPI;
import './Actors_TemperatureLogger.dart' as TestAPI;
import './AssociatedDataEnum.dart' as TestAPI;
import './AsyncFunctions.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedStrings.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './ClosedRanges.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './ExternalWitness_AProtocol.dart' as TestAPI;
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
import './ExternalWitness_TestLeadingUnderscoredProp.dart' as TestAPI;
import './ExternalWitness_TestMethodsProtocol.dart' as TestAPI;
import './ExternalWitness_TestOptionalsProtocol.dart' as TestAPI;
import './ExternalWitness_TestPropertiesProtocol.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestAsyncForeignSideFunctionsStruct.dart' as TestAPI;
import './TestAsyncFunctions.dart' as TestAPI;
import './TestLeadingUnderscoredProp.dart' as TestAPI;
import './TestLeadingUnderscoredPropStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
import './TestOptionalsProtocol.dart' as TestAPI;
import './TestPropertiesProtocol.dart' as TestAPI;
import './TestProtocolClass.dart' as TestAPI;
import './TestProtocolEnum.dart' as TestAPI;
import './TestProtocolStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import './URLs.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.export(Collections) -->
class Collections {
    Collections._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(arrayOfInt) -->
    static List<int> get arrayOfInt =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Collections_arrayOfInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(setOfInt) -->
    static Set<int> get setOfInt =>
        check((exn) =>
            consumeCreatedRef<Set<int>>(f__iota_get_TestAPI_Collections_setOfInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(dictionaryOfIntToInt) -->
    static Map<int, int> get dictionaryOfIntToInt =>
        check((exn) =>
            consumeCreatedRef<Map<int, int>>(f__iota_get_TestAPI_Collections_dictionaryOfIntToInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(arrayOfBigTuples) -->
    static List<tuple.Tuple4<int, int, int, int>> get arrayOfBigTuples =>
        check((exn) =>
            consumeCreatedRef<List<tuple.Tuple4<int, int, int, int>>>(f__iota_get_TestAPI_Collections_arrayOfBigTuples(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(maybeArrayOfInt) -->
    static List<int>? get maybeArrayOfInt =>
        check((exn) =>
            consumeCreatedRef<List<int>?>(f__iota_get_TestAPI_Collections_maybeArrayOfInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(maybeSetOfInt) -->
    static Set<int>? get maybeSetOfInt =>
        check((exn) =>
            consumeCreatedRef<Set<int>?>(f__iota_get_TestAPI_Collections_maybeSetOfInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
    static Map<int, int>? get maybeDictionaryOfIntToInt =>
        check((exn) =>
            consumeCreatedRef<Map<int, int>?>(f__iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
    static List<int?>? get maybeArrayOfMaybeInt =>
        check((exn) =>
            consumeCreatedRef<List<int?>?>(f__iota_get_TestAPI_Collections_maybeArrayOfMaybeInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
    static Set<int?>? get maybeSetOfMaybeInt =>
        check((exn) =>
            consumeCreatedRef<Set<int?>?>(f__iota_get_TestAPI_Collections_maybeSetOfMaybeInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
    static Map<int, int?>? get maybeDictionaryOfIntToMaybeInt =>
        check((exn) =>
            consumeCreatedRef<Map<int, int?>?>(f__iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(defaultCollectionHolder) -->
    static TestAPI.Collections_CollectionHolder get defaultCollectionHolder =>
        check((exn) =>
            consumeCreatedRef<TestAPI.Collections_CollectionHolder>(f__iota_get_TestAPI_Collections_defaultCollectionHolder(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echoArrayOfInt) -->
    static List<int> echoArrayOfInt(
        List<int> arrayOfInt,
    ) =>
        GCRef.using(arrayOfInt, (_arrayOfIntHandle) =>
            consumeCreatedRef<List<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Collections_echoArrayOfInt(Loader.shared.env, _arrayOfIntHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoSetOfInt) -->
    static Set<int> echoSetOfInt(
        Set<int> setOfInt,
    ) =>
        GCRef.using(setOfInt, (_setOfIntHandle) =>
            consumeCreatedRef<Set<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Collections_echoSetOfInt(Loader.shared.env, _setOfIntHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
    static Map<int, int> echoDictionaryOfIntToInt(
        Map<int, int> dictionaryOfIntToInt,
    ) =>
        GCRef.using(dictionaryOfIntToInt, (_dictionaryOfIntToIntHandle) =>
            consumeCreatedRef<Map<int, int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Collections_echoDictionaryOfIntToInt(Loader.shared.env, _dictionaryOfIntToIntHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
    static List<int?>? echoMaybeArrayOfMaybeInt(
        List<int?>? maybeArrayOfMaybeInt,
    ) =>
        GCRef.using(maybeArrayOfMaybeInt, (_maybeArrayOfMaybeIntHandle) =>
            consumeCreatedRef<List<int?>?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt(Loader.shared.env, _maybeArrayOfMaybeIntHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
    static Set<int?>? echoMaybeSetOfMaybeInt(
        Set<int?>? maybeSetOfMaybeInt,
    ) =>
        GCRef.using(maybeSetOfMaybeInt, (_maybeSetOfMaybeIntHandle) =>
            consumeCreatedRef<Set<int?>?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Collections_echoMaybeSetOfMaybeInt(Loader.shared.env, _maybeSetOfMaybeIntHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
    static Map<int, int?>? echoMaybeDictionaryOfIntToMaybeInt(
        Map<int, int?>? maybeDictionaryOfIntToMaybeInt,
    ) =>
        GCRef.using(maybeDictionaryOfIntToMaybeInt, (_maybeDictionaryOfIntToMaybeIntHandle) =>
            consumeCreatedRef<Map<int, int?>?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt(Loader.shared.env, _maybeDictionaryOfIntToMaybeIntHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(collectionMapper) -->
    static List<int?>? collectionMapper(
        List<int?>? collection,
        List<int?>? Function(List<int?>?) mapper,
    ) =>
        GCRef.using(collection, (_collectionHandle) =>
            GCRef.using(mapper, (_mapperHandle) =>
                consumeCreatedRef<List<int?>?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Collections_collectionMapper(Loader.shared.env, _collectionHandle.ptr, _mapperHandle.ptr, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef collection,
        UnownedRef mapper,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Collections_collectionMapper;
    static late CreatedRef Function(
        Env env,
        UnownedRef arrayOfInt,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Collections_echoArrayOfInt;
    static late CreatedRef Function(
        Env env,
        UnownedRef dictionaryOfIntToInt,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Collections_echoDictionaryOfIntToInt;
    static late CreatedRef Function(
        Env env,
        UnownedRef maybeArrayOfMaybeInt,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt;
    static late CreatedRef Function(
        Env env,
        UnownedRef maybeDictionaryOfIntToMaybeInt,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt;
    static late CreatedRef Function(
        Env env,
        UnownedRef maybeSetOfMaybeInt,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Collections_echoMaybeSetOfMaybeInt;
    static late CreatedRef Function(
        Env env,
        UnownedRef setOfInt,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Collections_echoSetOfInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_arrayOfBigTuples;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_arrayOfInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_defaultCollectionHolder;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_dictionaryOfIntToInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_maybeArrayOfInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_maybeArrayOfMaybeInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_maybeSetOfInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_maybeSetOfMaybeInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_setOfInt;
}
