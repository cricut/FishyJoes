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

/// <!-- FishyJoes.export(Deprecations) -->
class Deprecations {
    Deprecations._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(deprecatedVariable) -->
    @Deprecated("replace with `deprecatedMethod` (This is the swift name of the replacement function, due to technical limitations)")
    static int get deprecatedVariable =>
        check((exn) =>
            f__iota_get_TestAPI_Deprecations_deprecatedVariable(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(deprecatedMethod) -->
    @Deprecated("don't use this")
    static String deprecatedMethod(
    ) =>
        consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Deprecations_deprecatedMethod(Loader.shared.env, _exn)))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Deprecations_deprecatedMethod;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Deprecations_deprecatedVariable;
}
