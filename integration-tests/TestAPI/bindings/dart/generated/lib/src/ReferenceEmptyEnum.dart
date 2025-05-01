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

/// <!-- FishyJoes.export(ReferenceEmptyEnum) -->
class ReferenceEmptyEnum {
    ReferenceEmptyEnum._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(aStaticProperty) -->
    static int get aStaticProperty =>
        check((exn) =>
            f__iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
    static TestAPI.ReferenceEmptyEnum notGoingToHappen(
    ) =>
        consumeCreatedRef<TestAPI.ReferenceEmptyEnum>(check((OutCreatedRef _exn) => f__iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(aStaticMethod) -->
    static int aStaticMethod(
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_ReferenceEmptyEnum_aStaticMethod(Loader.shared.env, _exn))
    ;

    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ReferenceEmptyEnum_aStaticMethod;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty;
}
