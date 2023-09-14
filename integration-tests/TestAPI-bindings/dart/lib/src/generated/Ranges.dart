import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './Bytes.dart' as TestAPI;
import './Bytes.dart';
import './ClosedRanges.dart' as TestAPI;
import './ClosedRanges.dart';
import './Collections.dart' as TestAPI;
import './Collections.dart';
import './Collections_CollectionHolder.dart' as TestAPI;
import './Collections_CollectionHolder.dart';
import './DefaultArguments.dart' as TestAPI;
import './DefaultArguments.dart';
import './Deprecations.dart' as TestAPI;
import './Deprecations.dart';
import './EmptyEnum.dart' as TestAPI;
import './EmptyEnum.dart';
import './Functions.dart' as TestAPI;
import './Functions.dart';
import './Functions_TheError.dart' as TestAPI;
import './Functions_TheError.dart';
import './Methods.dart' as TestAPI;
import './Methods.dart';
import './Primitives.dart' as TestAPI;
import './Primitives.dart';
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart';
import './Ranges.dart' as TestAPI;
import './Ranges.dart';
import './SimpleEnum.dart' as TestAPI;
import './SimpleEnum.dart';
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart';
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(Ranges) -->
class Ranges {
    Ranges._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(uInt8Range) -->
    static FishyJoesRuntime.SwiftRange<int> get uInt8Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_uInt8Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uInt16Range) -->
    static FishyJoesRuntime.SwiftRange<int> get uInt16Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_uInt16Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uInt32Range) -->
    static FishyJoesRuntime.SwiftRange<int> get uInt32Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_uInt32Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uInt64Range) -->
    static FishyJoesRuntime.SwiftRange<int> get uInt64Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_uInt64Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(uIntRange) -->
    static FishyJoesRuntime.SwiftRange<int> get uIntRange =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_uIntRange(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int8Range) -->
    static FishyJoesRuntime.SwiftRange<int> get int8Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_int8Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int16Range) -->
    static FishyJoesRuntime.SwiftRange<int> get int16Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_int16Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int32Range) -->
    static FishyJoesRuntime.SwiftRange<int> get int32Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_int32Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(int64Range) -->
    static FishyJoesRuntime.SwiftRange<int> get int64Range =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_int64Range(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(intRange) -->
    static FishyJoesRuntime.SwiftRange<int> get intRange =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(f__iota_get_TestAPI_Ranges_intRange(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echoUInt8Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoUInt8Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoUInt8Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUInt16Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoUInt16Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoUInt16Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUInt32Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoUInt32Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoUInt32Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUInt64Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoUInt64Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoUInt64Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoUIntRange) -->
    static FishyJoesRuntime.SwiftRange<int> echoUIntRange(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoUIntRange(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt8Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoInt8Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoInt8Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt16Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoInt16Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoInt16Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt32Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoInt32Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoInt32Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoInt64Range) -->
    static FishyJoesRuntime.SwiftRange<int> echoInt64Range(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoInt64Range(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoIntRange) -->
    static FishyJoesRuntime.SwiftRange<int> echoIntRange(
        FishyJoesRuntime.SwiftRange<int> range,
    ) =>
        GCRef.using(range, (_rangeHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Ranges_echoIntRange(Loader.shared.env, _rangeHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoInt16Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoInt32Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoInt64Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoInt8Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoIntRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoUInt16Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoUInt32Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoUInt64Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoUInt8Range;
    static late CreatedRef Function(
        Env env,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Ranges_echoUIntRange;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_int16Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_int32Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_int64Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_int8Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_intRange;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_uInt16Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_uInt32Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_uInt64Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_uInt8Range;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Ranges_uIntRange;
}
