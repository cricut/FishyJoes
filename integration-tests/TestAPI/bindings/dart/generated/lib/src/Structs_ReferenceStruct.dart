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

/// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
class Structs_ReferenceStruct extends SwiftReference {
    Structs_ReferenceStruct(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Structs_ReferenceStruct(ref))
    );

    /// <!-- FishyJoes.export(immutable) -->
    String get immutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Structs_ReferenceStruct_immutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(mutable) -->
    String get mutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    void set mutable(String value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
        ;
    }
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Structs_ReferenceStruct_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_ReferenceStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_ReferenceStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_ReferenceStruct_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(asyncGetMutable) -->
    Future<String> asyncGetMutable(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    bool operator ==(
        Object other,
    ) =>
        other is TestAPI.Structs_ReferenceStruct &&
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other, (otherHandle) =>
                check((exn) => f__iota_TestAPI_Structs_ReferenceStruct_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_ReferenceStruct_create;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_ReferenceStruct_equals;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Structs_ReferenceStruct_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Structs_ReferenceStruct_immutable;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Structs_ReferenceStruct_mutable;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef mutable,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Structs_ReferenceStruct_mutable;
}
