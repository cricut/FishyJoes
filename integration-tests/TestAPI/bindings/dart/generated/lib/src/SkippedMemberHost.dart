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

/// <!-- FishyJoes.export(SkippedMemberHost) -->
class SkippedMemberHost {
    SkippedMemberHost._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// A sibling member referencing only exported types — must still generate.
    /// <!-- FishyJoes.export(echoInt) -->
    static int echoInt(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_SkippedMemberHost_echoInt(Loader.shared.env, value, _exn))
    ;

    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_SkippedMemberHost_echoInt;
}
