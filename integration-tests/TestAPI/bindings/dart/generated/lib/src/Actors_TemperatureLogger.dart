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

/// <!-- FishyJoes.export(Actors.TemperatureLogger) -->
class Actors_TemperatureLogger extends SwiftReference {
    Actors_TemperatureLogger(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Actors_TemperatureLogger(ref))
    );

    /// <!-- FishyJoes.export(backwardsLabel) -->
    String get backwardsLabel =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(extensionNonisolatedVarLabel) -->
    String get extensionNonisolatedVarLabel =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(label) -->
    String get label =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Actors_TemperatureLogger_label(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(create) -->
    staticTestAPI.Actors_TemperatureLogger create(
        String label,
        int measurement,
    ) =>
        GCRef.using(label, (_labelHandle) =>
            consumeCreatedRef<TestAPI.Actors_TemperatureLogger>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_create(Loader.shared.env, _labelHandle.ptr, measurement, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(update) -->
    Future<void> update(
        int /* with */ measurement,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_update(Loader.shared.env, _thisHandle.ptr, measurement, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(min) -->
    Future<int> min(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_min(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(extensionIsolatedGetLabel) -->
    Future<String> extensionIsolatedGetLabel(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(extensionNonisolatedGetLabel) -->
    String extensionNonisolatedGetLabel(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef label,
        int measurement,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_create;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_min;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int measurement,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_update;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Actors_TemperatureLogger_label;
}
