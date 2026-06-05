import './_exports.dart' as TestAPI;
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

/// <!-- FishyJoes.export(DefaultArguments) -->
class DefaultArguments {
    DefaultArguments._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
    static String echoDefaults(
        int? x,
        {
            int? y = null,
            double /* theLabelForZ */ z = 3.14,
        }
    ) =>
        GCRef.using(y, (_yHandle) =>
            GCRef.using(x, (_xHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_DefaultArguments_echoDefaults(Loader.shared.env, _yHandle.ptr, _xHandle.ptr, z, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(describeEnumDefault) -->
    static String describeEnumDefault(
        int value,
        TestAPI.SimpleEnum color,
    ) =>
        GCRef.using(color, (_colorHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_DefaultArguments_describeEnumDefault(Loader.shared.env, value, _colorHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoDefaultTolerance) -->
    static double echoDefaultTolerance(
        {
            double tolerance = 1.4901161193847656E-8,
        }
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_DefaultArguments_echoDefaultTolerance(Loader.shared.env, tolerance, _exn))
    ;

    /// <!-- FishyJoes.export(echoDefaultIntLimits) -->
    static String echoDefaultIntLimits(
        int minValue,
        int maxValue,
    ) =>
        consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_DefaultArguments_echoDefaultIntLimits(Loader.shared.env, minValue, maxValue, _exn)))
    ;

    static late CreatedRef Function(
        Env env,
        int value,
        UnownedRef color,
        OutCreatedRef _exn
    ) f__iota_TestAPI_DefaultArguments_describeEnumDefault;
    static late CreatedRef Function(
        Env env,
        int minValue,
        int maxValue,
        OutCreatedRef _exn
    ) f__iota_TestAPI_DefaultArguments_echoDefaultIntLimits;
    static late double Function(
        Env env,
        double tolerance,
        OutCreatedRef _exn
    ) f__iota_TestAPI_DefaultArguments_echoDefaultTolerance;
    static late CreatedRef Function(
        Env env,
        UnownedRef y,
        UnownedRef x,
        double z,
        OutCreatedRef _exn
    ) f__iota_TestAPI_DefaultArguments_echoDefaults;
}
