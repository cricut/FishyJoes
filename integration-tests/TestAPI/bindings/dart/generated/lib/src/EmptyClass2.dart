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

/// <!-- FishyJoes.exportReference(EmptyClass2) -->
class EmptyClass2 extends SwiftReference {
    EmptyClass2(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(EmptyClass2(ref))
    );

    /// <!-- FishyJoes.export(blorg) -->
    String get blorg =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_EmptyClass2_blorg(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(wibble) -->
    String get wibble =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_EmptyClass2_wibble(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_EmptyClass2_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(make) -->
    staticTestAPI.EmptyClass2 make(
    ) =>
        consumeCreatedRef<TestAPI.EmptyClass2>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyClass2_make(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(shmee) -->
    String shmee(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyClass2_shmee(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(gorp) -->
    String gorp(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyClass2_gorp(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    bool operator ==(
        Object other,
    ) =>
        identical(other, this) ||
        (other is TestAPI.EmptyClass2 &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_EmptyClass2_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
    ;

    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass2_equals;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass2_gorp;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass2_make;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyClass2_shmee;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyClass2_blorg;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyClass2_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyClass2_wibble;
}
