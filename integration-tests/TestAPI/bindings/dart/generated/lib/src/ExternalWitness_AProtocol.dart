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

/// <!-- FishyJoes.export(AProtocol) -->
class ExternalWitness_AProtocol extends SwiftReference implements TestAPI.AProtocol {
    ExternalWitness_AProtocol(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(ExternalWitness_AProtocol(ref))
    );

    /// <!-- FishyJoes.export(baz) -->
    bool get baz =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_AProtocol_baz(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(foo) -->
    String get foo =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_AProtocol_foo(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(bar) -->
    TestAPI.AProtocol bar(
        int x,
        int y,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<TestAPI.AProtocol>(check((OutCreatedRef _exn) => f__iota_TestAPI_AProtocol_bar(Loader.shared.env, _thisHandle.ptr, x, y, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    String hasADefaultImplementation(
        int x,
        double y,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_AProtocol_hasADefaultImplementation(Loader.shared.env, _thisHandle.ptr, x, y, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
    String hasADefaultImplementation2(
        String a,
        bool b,
        String c,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(a, (_aHandle) =>
                GCRef.using(c, (_cHandle) =>
                    consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_AProtocol_hasADefaultImplementation2(Loader.shared.env, _thisHandle.ptr, _aHandle.ptr, b, _cHandle.ptr, _exn)))
                )
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int x,
        int y,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AProtocol_bar;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int x,
        double y,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AProtocol_hasADefaultImplementation;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef a,
        bool b,
        UnownedRef c,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AProtocol_hasADefaultImplementation2;
    static late bool Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AProtocol_baz;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AProtocol_foo;
}
