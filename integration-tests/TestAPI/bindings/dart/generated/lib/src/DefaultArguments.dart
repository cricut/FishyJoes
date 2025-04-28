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

    static late CreatedRef Function(
        Env env,
        UnownedRef y,
        UnownedRef x,
        double z,
        OutCreatedRef _exn
    ) f__iota_TestAPI_DefaultArguments_echoDefaults;
}
