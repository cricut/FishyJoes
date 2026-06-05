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

/// <!-- FishyJoes.export(EmptyStruct) -->
class EmptyStruct {

    EmptyStruct(
    );

    static CreatedRef ffi_constructor(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(EmptyStruct(
        ))
    );
    @override
    String toString() => 'TestAPI.EmptyStruct()';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is EmptyStruct
        );
    }

    @override
    int get hashCode =>runtimeType.hashCode;

    EmptyStruct copyWith() => EmptyStruct();

    /// <!-- FishyJoes.export(tatiana) -->
    String get tatiana =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_EmptyStruct_tatiana(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(tutu) -->
    int get tutu =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_EmptyStruct_tutu(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(create) -->
    staticTestAPI.EmptyStruct create(
    ) =>
        consumeCreatedRef<TestAPI.EmptyStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyStruct_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(aap) -->
    String aap(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyStruct_aap(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(zxccxz) -->
    String zxccxz(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_EmptyStruct_zxccxz(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyStruct_aap;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyStruct_create;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_EmptyStruct_zxccxz;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyStruct_tatiana;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_EmptyStruct_tutu;
}
