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
import './ExternalWitness_TestDefaultComputedProperties.dart' as TestAPI;
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
import './Structs_EmptyStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestAsyncForeignSideFunctionsStruct.dart' as TestAPI;
import './TestAsyncFunctions.dart' as TestAPI;
import './TestAsyncSwiftSideFunctionsClass.dart' as TestAPI;
import './TestDefaultComputedProperties.dart' as TestAPI;
import './TestDefaultComputedPropertiesEnum.dart' as TestAPI;
import './TestDefaultComputedPropertiesReference.dart' as TestAPI;
import './TestDefaultComputedPropertiesStruct.dart' as TestAPI;
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

/// <!-- FishyJoes.export(ClosedRanges) -->
class ClosedRanges {
    ClosedRanges._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(doubleRange) -->
    static FishyJoesRuntime.SwiftClosedRange<double> get doubleRange =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<double>>(f__iota_get_TestAPI_ClosedRanges_doubleRange(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(floatRange) -->
    static FishyJoesRuntime.SwiftClosedRange<double> get floatRange =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<double>>(f__iota_get_TestAPI_ClosedRanges_floatRange(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int16Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get int16Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_int16Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int32Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get int32Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_int32Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int64Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get int64Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_int64Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int8Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get int8Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_int8Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(intRange) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get intRange =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_intRange(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(stringRange) -->
    static FishyJoesRuntime.SwiftClosedRange<String> get stringRange =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<String>>(f__iota_get_TestAPI_ClosedRanges_stringRange(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uInt16Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get uInt16Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_uInt16Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uInt32Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get uInt32Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_uInt32Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uInt64Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get uInt64Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_uInt64Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uInt8Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get uInt8Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_uInt8Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uIntRange) -->
    static FishyJoesRuntime.SwiftClosedRange<int> get uIntRange =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(f__iota_get_TestAPI_ClosedRanges_uIntRange(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echoUInt8Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoUInt8Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoUInt8Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUInt16Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoUInt16Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoUInt16Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUInt32Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoUInt32Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoUInt32Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUInt64Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoUInt64Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoUInt64Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUIntRange) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoUIntRange(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoUIntRange(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt8Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoInt8Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoInt8Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt16Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoInt16Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoInt16Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt32Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoInt32Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoInt32Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt64Range) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoInt64Range(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoInt64Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoIntRange) -->
    static FishyJoesRuntime.SwiftClosedRange<int> echoIntRange(
        FishyJoesRuntime.SwiftClosedRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoIntRange(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoFloatRange) -->
    static FishyJoesRuntime.SwiftClosedRange<double> echoFloatRange(
        FishyJoesRuntime.SwiftClosedRange<double> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<double>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoFloatRange(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoDoubleRange) -->
    static FishyJoesRuntime.SwiftClosedRange<double> echoDoubleRange(
        FishyJoesRuntime.SwiftClosedRange<double> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<double>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoDoubleRange(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoStringRange) -->
    static FishyJoesRuntime.SwiftClosedRange<String> echoStringRange(
        FishyJoesRuntime.SwiftClosedRange<String> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftClosedRange<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_ClosedRanges_echoStringRange(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoDoubleRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoFloatRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoInt16Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoInt32Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoInt64Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoInt8Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoIntRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoStringRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoUInt16Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoUInt32Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoUInt64Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoUInt8Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ClosedRanges_echoUIntRange;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_doubleRange;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_floatRange;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_int16Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_int32Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_int64Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_int8Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_intRange;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_stringRange;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_uInt16Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_uInt32Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_uInt64Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_uInt8Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ClosedRanges_uIntRange;
}
