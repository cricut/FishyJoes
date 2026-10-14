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

/// <!-- FishyJoes.export(TestOptionalsProtocol) -->
class ExternalWitness_TestOptionalsProtocol extends SwiftReference implements TestAPI.TestOptionalsProtocol {
    ExternalWitness_TestOptionalsProtocol(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(ExternalWitness_TestOptionalsProtocol(ref))
    );

    /// <!-- FishyJoes.export(flarp) -->
    String? get flarp =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String?>(f__iota_get_TestAPI_TestOptionalsProtocol_flarp(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(wombat) -->
    double? wombat(
        int? zxc,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(zxc, (_zxcHandle) =>
                consumeCreatedRef<double?>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestOptionalsProtocol_wombat(Loader.shared.env, _thisHandle.ptr, _zxcHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(spqr) -->
    int spqr(
        TestAPI.AssociatedDataEnum pippo,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(pippo, (_pippoHandle) =>
                check((OutCreatedRef _exn) => f__iota_TestAPI_TestOptionalsProtocol_spqr(Loader.shared.env, _thisHandle.ptr, _pippoHandle.ptr, _exn))
            )
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        UnownedRef pippo,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestOptionalsProtocol_spqr;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef zxc,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestOptionalsProtocol_wombat;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestOptionalsProtocol_flarp;
}
