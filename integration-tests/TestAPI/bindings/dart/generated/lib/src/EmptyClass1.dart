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

/// <!-- FishyJoes.exportReference(EmptyClass1) -->
class EmptyClass1 extends SwiftReference {
    EmptyClass1(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(EmptyClass1(ref))
    );

    /// <!-- FishyJoes.export(blarg) -->
    String get blarg =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_EmptyClass_blarg(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(wibbledyWobbledyTimeyWhimey) -->
    String get wibbledyWobbledyTimeyWhimey =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_EmptyClass_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(create) -->
    staticTestAPI.EmptyClass1 create(
    ) =>
        consumeCreatedRef<TestAPI.EmptyClass1>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyClass_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(shme) -->
    String shme(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyClass_shme(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(Gorpers) -->
    String Gorpers(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyClass_Gorpers(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    bool operator ==(
        Object other,
    ) =>
        identical(other, this) ||
        (other is TestAPI.EmptyClass1 &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_EmptyClass_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass_Gorpers;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass_create;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass_equals;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass_shme;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyClass_blarg;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyClass_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey;
}
