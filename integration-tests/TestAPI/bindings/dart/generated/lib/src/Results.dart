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

/// <!-- FishyJoes.export(Results) -->
class Results {
    Results._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(aFailure) -->
    static Result<int, TestAPI.Results_Error> get aFailure =>
        check((exn) =>
            consumeCreatedRef<Result<int, TestAPI.Results_Error>>(f__iota_get_TestAPI_Results_aFailure(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(aSuccess) -->
    static Result<int, TestAPI.Results_Error> get aSuccess =>
        check((exn) =>
            consumeCreatedRef<Result<int, TestAPI.Results_Error>>(f__iota_get_TestAPI_Results_aSuccess(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(processResult) -->
    static String processResult(
        Result<String, TestAPI.Results_Error> result,
    ) =>
        GCRef.using(result, (_resultHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Results_processResult(Loader.shared.env, _resultHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef result,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Results_processResult;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Results_aFailure;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Results_aSuccess;
}
