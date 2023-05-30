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
import 'dart:typed_data' as typed_data;
import 'package:dart_runtime/runtime.dart';
import 'package:dart_runtime/utilities.dart' as utils;
import 'package:ffi/ffi.dart' as ffi;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(Primitives) -->
class Primitives {
    Primitives._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(falseBool) -->
    static bool get falseBool =>
        check((exn) =>
            f__iota_get_Primitives_FalseBool(exn)
        )
    ;
    /// <!-- FishyJoes.export(trueBool) -->
    static bool get trueBool =>
        check((exn) =>
            f__iota_get_Primitives_TrueBool(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt8) -->
    static int get zeroUInt8 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroUInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt8) -->
    static int get minUInt8 =>
        check((exn) =>
            f__iota_get_Primitives_MinUInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt8) -->
    static int get maxUInt8 =>
        check((exn) =>
            f__iota_get_Primitives_MaxUInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt16) -->
    static int get zeroUInt16 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroUInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt16) -->
    static int get minUInt16 =>
        check((exn) =>
            f__iota_get_Primitives_MinUInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt16) -->
    static int get maxUInt16 =>
        check((exn) =>
            f__iota_get_Primitives_MaxUInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt32) -->
    static int get zeroUInt32 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroUInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt32) -->
    static int get minUInt32 =>
        check((exn) =>
            f__iota_get_Primitives_MinUInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt32) -->
    static int get maxUInt32 =>
        check((exn) =>
            f__iota_get_Primitives_MaxUInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt64) -->
    static int get zeroUInt64 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroUInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt64) -->
    static int get minUInt64 =>
        check((exn) =>
            f__iota_get_Primitives_MinUInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt64) -->
    static int get maxUInt64 =>
        check((exn) =>
            f__iota_get_Primitives_MaxUInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt8) -->
    static int get zeroInt8 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt8) -->
    static int get minInt8 =>
        check((exn) =>
            f__iota_get_Primitives_MinInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt8) -->
    static int get maxInt8 =>
        check((exn) =>
            f__iota_get_Primitives_MaxInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt16) -->
    static int get zeroInt16 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt16) -->
    static int get minInt16 =>
        check((exn) =>
            f__iota_get_Primitives_MinInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt16) -->
    static int get maxInt16 =>
        check((exn) =>
            f__iota_get_Primitives_MaxInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt32) -->
    static int get zeroInt32 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt32) -->
    static int get minInt32 =>
        check((exn) =>
            f__iota_get_Primitives_MinInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt32) -->
    static int get maxInt32 =>
        check((exn) =>
            f__iota_get_Primitives_MaxInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt64) -->
    static int get zeroInt64 =>
        check((exn) =>
            f__iota_get_Primitives_ZeroInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt64) -->
    static int get minInt64 =>
        check((exn) =>
            f__iota_get_Primitives_MinInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt64) -->
    static int get maxInt64 =>
        check((exn) =>
            f__iota_get_Primitives_MaxInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt) -->
    static int get zeroInt =>
        check((exn) =>
            f__iota_get_Primitives_ZeroInt(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt) -->
    static int get minInt =>
        check((exn) =>
            f__iota_get_Primitives_MinInt(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt) -->
    static int get maxInt =>
        check((exn) =>
            f__iota_get_Primitives_MaxInt(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroFloat) -->
    static double get zeroFloat =>
        check((exn) =>
            f__iota_get_Primitives_ZeroFloat(exn)
        )
    ;
    /// <!-- FishyJoes.export(minFloat) -->
    static double get minFloat =>
        check((exn) =>
            f__iota_get_Primitives_MinFloat(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxFloat) -->
    static double get maxFloat =>
        check((exn) =>
            f__iota_get_Primitives_MaxFloat(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroDouble) -->
    static double get zeroDouble =>
        check((exn) =>
            f__iota_get_Primitives_ZeroDouble(exn)
        )
    ;
    /// <!-- FishyJoes.export(minDouble) -->
    static double get minDouble =>
        check((exn) =>
            f__iota_get_Primitives_MinDouble(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxDouble) -->
    static double get maxDouble =>
        check((exn) =>
            f__iota_get_Primitives_MaxDouble(exn)
        )
    ;
    /// <!-- FishyJoes.export(manyBool) -->
    static List<bool> get manyBool =>
        check((exn) =>
            consumeCreatedRef<List<bool>>(f__iota_get_Primitives_ManyBool(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt8) -->
    static List<int> get manyUInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyUInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt16) -->
    static List<int> get manyUInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyUInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt32) -->
    static List<int> get manyUInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyUInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt64) -->
    static List<int> get manyUInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyUInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt8) -->
    static List<int> get manyInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt16) -->
    static List<int> get manyInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt32) -->
    static List<int> get manyInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt64) -->
    static List<int> get manyInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_ManyInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyFloat) -->
    static List<double> get manyFloat =>
        check((exn) =>
            consumeCreatedRef<List<double>>(f__iota_get_Primitives_ManyFloat(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyDouble) -->
    static List<double> get manyDouble =>
        check((exn) =>
            consumeCreatedRef<List<double>>(f__iota_get_Primitives_ManyDouble(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeBool) -->
    static List<bool?> get manyMaybeBool =>
        check((exn) =>
            consumeCreatedRef<List<bool?>>(f__iota_get_Primitives_ManyMaybeBool(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt8) -->
    static List<int?> get manyMaybeUInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeUInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt16) -->
    static List<int?> get manyMaybeUInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeUInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt32) -->
    static List<int?> get manyMaybeUInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeUInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt64) -->
    static List<int?> get manyMaybeUInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeUInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt8) -->
    static List<int?> get manyMaybeInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt16) -->
    static List<int?> get manyMaybeInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt32) -->
    static List<int?> get manyMaybeInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt64) -->
    static List<int?> get manyMaybeInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_ManyMaybeInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeFloat) -->
    static List<double?> get manyMaybeFloat =>
        check((exn) =>
            consumeCreatedRef<List<double?>>(f__iota_get_Primitives_ManyMaybeFloat(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeDouble) -->
    static List<double?> get manyMaybeDouble =>
        check((exn) =>
            consumeCreatedRef<List<double?>>(f__iota_get_Primitives_ManyMaybeDouble(exn))
        )
    ;
    /// <!-- FishyJoes.export(defaultPrimitiveHolder) -->
    static TestAPI.Primitives_PrimitiveHolder get defaultPrimitiveHolder =>
        check((exn) =>
            consumeCreatedRef<TestAPI.Primitives_PrimitiveHolder>(f__iota_get_Primitives_DefaultPrimitiveHolder(exn))
        )
    ;
    /// <!-- FishyJoes.export(echoBool) -->
    static bool echoBool(
        bool value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoBool(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt8) -->
    static int echoUInt8(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoUInt8(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt16) -->
    static int echoUInt16(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoUInt16(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt32) -->
    static int echoUInt32(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoUInt32(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt64) -->
    static int echoUInt64(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoUInt64(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt8) -->
    static int echoInt8(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoInt8(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt16) -->
    static int echoInt16(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoInt16(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt32) -->
    static int echoInt32(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoInt32(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt64) -->
    static int echoInt64(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoInt64(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoFloat) -->
    static double echoFloat(
        double value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoFloat(value, _exn))
    ;

    /// <!-- FishyJoes.export(echoDouble) -->
    static double echoDouble(
        double value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_Primitives_echoDouble(value, _exn))
    ;

    /// <!-- FishyJoes.export(maybeEchoBool) -->
    static bool? maybeEchoBool(
        bool? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<bool?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoBool(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt8) -->
    static int? maybeEchoUInt8(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoUInt8(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt16) -->
    static int? maybeEchoUInt16(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoUInt16(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt32) -->
    static int? maybeEchoUInt32(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoUInt32(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt64) -->
    static int? maybeEchoUInt64(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoUInt64(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt8) -->
    static int? maybeEchoInt8(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoInt8(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt16) -->
    static int? maybeEchoInt16(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoInt16(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt32) -->
    static int? maybeEchoInt32(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoInt32(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt64) -->
    static int? maybeEchoInt64(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoInt64(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoFloat) -->
    static double? maybeEchoFloat(
        double? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<double?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoFloat(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoDouble) -->
    static double? maybeEchoDouble(
        double? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<double?>(check((OutCreatedRef _exn) => f__iota_Primitives_maybeEchoDouble(_valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(valueMapper) -->
    static int? valueMapper(
        int? value,
        int? Function(int?) mapper,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            GCRef.using(mapper, (_mapperHandle) =>
                consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_Primitives_valueMapper(_valueHandle.ptr, _mapperHandle.ptr, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeInt64;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt16;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinDouble;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyBool;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxUInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeUInt8;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroDouble;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeUInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinInt32;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeInt8;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt32;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinUInt32;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt32;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt8;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt16;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt64;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinFloat;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyUInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxInt64;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroFloat;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxFloat;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyInt64;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxInt32;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeBool;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyUInt32;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt32;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt8;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt64;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinInt16;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyDouble;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxDouble;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinInt;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroUInt64;
    static late bool Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_FalseBool;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoFloat;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyFloat;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyInt16;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyInt32;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoDouble;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyUInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinUInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeUInt64;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt64;
    static late bool Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_TrueBool;
    static late CreatedRef Function(
        UnownedRef value,
        UnownedRef mapper,
        OutCreatedRef _exn
    ) f__iota_Primitives_valueMapper;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_DefaultPrimitiveHolder;
    static late double Function(
        double value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoFloat;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroInt;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxUInt32;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxInt;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroUInt32;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeUInt32;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroUInt16;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinUInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeDouble;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxUInt16;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeFloat;
    static late bool Function(
        bool value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoBool;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MaxUInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyMaybeInt32;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroInt32;
    static late double Function(
        double value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoDouble;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoBool;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt16;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt32;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt16;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ManyUInt64;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_MinUInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_ZeroUInt8;
}
