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

/// <!-- FishyJoes.export(Bytes) -->
class Bytes {
    Bytes._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
    static List<int> get bytes =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Bytes_bytes(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(data) -->
    static typed_data.Uint8List get data =>
        check((exn) =>
            consumeCreatedRef<typed_data.Uint8List>(f__iota_get_TestAPI_Bytes_data(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echoBytes) -->
    static List<int> echoBytes(
        List<int> bytes,
    ) =>
        GCRef.using(bytes, (_bytesHandle) =>
            consumeCreatedRef<List<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Bytes_echoBytes(Loader.shared.env, _bytesHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoData) -->
    static typed_data.Uint8List echoData(
        typed_data.Uint8List data,
    ) =>
        GCRef.using(data, (_dataHandle) =>
            consumeCreatedRef<typed_data.Uint8List>(check((OutCreatedRef _exn) => f__iota_TestAPI_Bytes_echoData(Loader.shared.env, _dataHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef bytes,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Bytes_echoBytes;
    static late CreatedRef Function(
        Env env,
        UnownedRef data,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Bytes_echoData;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Bytes_bytes;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Bytes_data;
}
