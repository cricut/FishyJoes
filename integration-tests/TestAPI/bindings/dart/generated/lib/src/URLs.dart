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

/// <!-- FishyJoes.export(URLs) -->
class URLs {
    URLs._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(localFile) -->
    static Uri get localFile =>
        check((exn) =>
            consumeCreatedRef<Uri>(f__iota_get_TestAPI_URLs_localFile(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(remoteFile) -->
    static Uri get remoteFile =>
        check((exn) =>
            consumeCreatedRef<Uri>(f__iota_get_TestAPI_URLs_remoteFile(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(simple) -->
    static Uri get simple =>
        check((exn) =>
            consumeCreatedRef<Uri>(f__iota_get_TestAPI_URLs_simple(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echo) -->
    static Uri echo(
        Uri url,
    ) =>
        GCRef.using(url, (_urlHandle) =>
            consumeCreatedRef<Uri>(check((OutCreatedRef _exn) => f__iota_TestAPI_URLs_echo(Loader.shared.env, _urlHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef url,
        OutCreatedRef _exn
    ) f__iota_TestAPI_URLs_echo;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_URLs_localFile;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_URLs_remoteFile;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_URLs_simple;
}
