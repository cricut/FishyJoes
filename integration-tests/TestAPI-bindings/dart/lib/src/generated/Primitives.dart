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
            f__iota_get_Primitives_falseBool(exn)
        )
    ;
    /// <!-- FishyJoes.export(trueBool) -->
    static bool get trueBool =>
        check((exn) =>
            f__iota_get_Primitives_trueBool(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt8) -->
    static int get zeroUInt8 =>
        check((exn) =>
            f__iota_get_Primitives_zeroUInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt8) -->
    static int get minUInt8 =>
        check((exn) =>
            f__iota_get_Primitives_minUInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt8) -->
    static int get maxUInt8 =>
        check((exn) =>
            f__iota_get_Primitives_maxUInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt16) -->
    static int get zeroUInt16 =>
        check((exn) =>
            f__iota_get_Primitives_zeroUInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt16) -->
    static int get minUInt16 =>
        check((exn) =>
            f__iota_get_Primitives_minUInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt16) -->
    static int get maxUInt16 =>
        check((exn) =>
            f__iota_get_Primitives_maxUInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt32) -->
    static int get zeroUInt32 =>
        check((exn) =>
            f__iota_get_Primitives_zeroUInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt32) -->
    static int get minUInt32 =>
        check((exn) =>
            f__iota_get_Primitives_minUInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt32) -->
    static int get maxUInt32 =>
        check((exn) =>
            f__iota_get_Primitives_maxUInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt64) -->
    static int get zeroUInt64 =>
        check((exn) =>
            f__iota_get_Primitives_zeroUInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt64) -->
    static int get minUInt64 =>
        check((exn) =>
            f__iota_get_Primitives_minUInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt64) -->
    static int get maxUInt64 =>
        check((exn) =>
            f__iota_get_Primitives_maxUInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt8) -->
    static int get zeroInt8 =>
        check((exn) =>
            f__iota_get_Primitives_zeroInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt8) -->
    static int get minInt8 =>
        check((exn) =>
            f__iota_get_Primitives_minInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt8) -->
    static int get maxInt8 =>
        check((exn) =>
            f__iota_get_Primitives_maxInt8(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt16) -->
    static int get zeroInt16 =>
        check((exn) =>
            f__iota_get_Primitives_zeroInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt16) -->
    static int get minInt16 =>
        check((exn) =>
            f__iota_get_Primitives_minInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt16) -->
    static int get maxInt16 =>
        check((exn) =>
            f__iota_get_Primitives_maxInt16(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt32) -->
    static int get zeroInt32 =>
        check((exn) =>
            f__iota_get_Primitives_zeroInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt32) -->
    static int get minInt32 =>
        check((exn) =>
            f__iota_get_Primitives_minInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt32) -->
    static int get maxInt32 =>
        check((exn) =>
            f__iota_get_Primitives_maxInt32(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt64) -->
    static int get zeroInt64 =>
        check((exn) =>
            f__iota_get_Primitives_zeroInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt64) -->
    static int get minInt64 =>
        check((exn) =>
            f__iota_get_Primitives_minInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt64) -->
    static int get maxInt64 =>
        check((exn) =>
            f__iota_get_Primitives_maxInt64(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt) -->
    static int get zeroInt =>
        check((exn) =>
            f__iota_get_Primitives_zeroInt(exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt) -->
    static int get minInt =>
        check((exn) =>
            f__iota_get_Primitives_minInt(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt) -->
    static int get maxInt =>
        check((exn) =>
            f__iota_get_Primitives_maxInt(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroFloat) -->
    static double get zeroFloat =>
        check((exn) =>
            f__iota_get_Primitives_zeroFloat(exn)
        )
    ;
    /// <!-- FishyJoes.export(minFloat) -->
    static double get minFloat =>
        check((exn) =>
            f__iota_get_Primitives_minFloat(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxFloat) -->
    static double get maxFloat =>
        check((exn) =>
            f__iota_get_Primitives_maxFloat(exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroDouble) -->
    static double get zeroDouble =>
        check((exn) =>
            f__iota_get_Primitives_zeroDouble(exn)
        )
    ;
    /// <!-- FishyJoes.export(minDouble) -->
    static double get minDouble =>
        check((exn) =>
            f__iota_get_Primitives_minDouble(exn)
        )
    ;
    /// <!-- FishyJoes.export(maxDouble) -->
    static double get maxDouble =>
        check((exn) =>
            f__iota_get_Primitives_maxDouble(exn)
        )
    ;
    /// <!-- FishyJoes.export(manyBool) -->
    static List<bool> get manyBool =>
        check((exn) =>
            consumeCreatedRef<List<bool>>(f__iota_get_Primitives_manyBool(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt8) -->
    static List<int> get manyUInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyUInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt16) -->
    static List<int> get manyUInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyUInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt32) -->
    static List<int> get manyUInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyUInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt64) -->
    static List<int> get manyUInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyUInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt8) -->
    static List<int> get manyInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt16) -->
    static List<int> get manyInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt32) -->
    static List<int> get manyInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt64) -->
    static List<int> get manyInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Primitives_manyInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyFloat) -->
    static List<double> get manyFloat =>
        check((exn) =>
            consumeCreatedRef<List<double>>(f__iota_get_Primitives_manyFloat(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyDouble) -->
    static List<double> get manyDouble =>
        check((exn) =>
            consumeCreatedRef<List<double>>(f__iota_get_Primitives_manyDouble(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeBool) -->
    static List<bool?> get manyMaybeBool =>
        check((exn) =>
            consumeCreatedRef<List<bool?>>(f__iota_get_Primitives_manyMaybeBool(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt8) -->
    static List<int?> get manyMaybeUInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeUInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt16) -->
    static List<int?> get manyMaybeUInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeUInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt32) -->
    static List<int?> get manyMaybeUInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeUInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt64) -->
    static List<int?> get manyMaybeUInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeUInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt8) -->
    static List<int?> get manyMaybeInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeInt8(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt16) -->
    static List<int?> get manyMaybeInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeInt16(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt32) -->
    static List<int?> get manyMaybeInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeInt32(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt64) -->
    static List<int?> get manyMaybeInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Primitives_manyMaybeInt64(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeFloat) -->
    static List<double?> get manyMaybeFloat =>
        check((exn) =>
            consumeCreatedRef<List<double?>>(f__iota_get_Primitives_manyMaybeFloat(exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeDouble) -->
    static List<double?> get manyMaybeDouble =>
        check((exn) =>
            consumeCreatedRef<List<double?>>(f__iota_get_Primitives_manyMaybeDouble(exn))
        )
    ;
    /// <!-- FishyJoes.export(defaultPrimitiveHolder) -->
    static TestAPI.Primitives_PrimitiveHolder get defaultPrimitiveHolder =>
        check((exn) =>
            consumeCreatedRef<TestAPI.Primitives_PrimitiveHolder>(f__iota_get_Primitives_defaultPrimitiveHolder(exn))
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
    ) f__iota_get_Primitives_manyInt32;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeDouble;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt32;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxUInt16;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroDouble;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeUInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_defaultPrimitiveHolder;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minInt8;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoFloat;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxUInt32;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroUInt16;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeFloat;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroUInt32;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyUInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroInt64;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxInt16;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoDouble;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxInt;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyUInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minInt;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minInt16;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minDouble;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minInt32;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroInt8;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxDouble;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyUInt32;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeInt16;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt8;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyBool;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroUInt64;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxUInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyInt64;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxFloat;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxInt64;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxUInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeInt64;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyDouble;
    static late CreatedRef Function(
        UnownedRef value,
        UnownedRef mapper,
        OutCreatedRef _exn
    ) f__iota_Primitives_valueMapper;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeInt32;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minUInt32;
    static late double Function(
        double value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoDouble;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeUInt16;
    static late bool Function(
        bool value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoBool;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minUInt16;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minFloat;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minUInt8;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt32;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt64;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroInt32;
    static late double Function(
        double value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoFloat;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoInt16;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeBool;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroInt;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minUInt64;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxInt32;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyUInt64;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt32;
    static late bool Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_trueBool;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt16;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroUInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeUInt32;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoInt64;
    static late int Function(
        int value,
        OutCreatedRef _exn
    ) f__iota_Primitives_echoUInt32;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_minInt64;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoBool;
    static late double Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroFloat;
    static late CreatedRef Function(
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_Primitives_maybeEchoUInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_zeroInt16;
    static late bool Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_falseBool;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyMaybeUInt8;
    static late int Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_maxInt8;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Primitives_manyFloat;
}
