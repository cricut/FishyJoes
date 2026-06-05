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

/// <!-- FishyJoes.export(Structs.MutableStruct) -->
class Structs_MutableStruct {
    int i;

    Structs_MutableStruct({
        required int i
    }):
        this.i = i;

    static CreatedRef ffi_constructor(
        int i,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Structs_MutableStruct(
            i: i,
        ))
    );
    @override
    String toString() => 'TestAPI.Structs_MutableStruct(i: $i)';

    static int ffi_get_i(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catching(exn, () =>
        peekRef<Structs_MutableStruct>(obj).i
    ) ?? 0;
    static void ffi_set_i(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_MutableStruct>(obj).i =newValue;
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Structs_MutableStruct &&
            (
                const DeepCollectionEquality().equals(other.i, i)
            )
        );
    }

    @override
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(i)
    );

    Structs_MutableStruct copyWith({
        int? i
    }) => Structs_MutableStruct(
        i: i ?? this.i
    );

    /// <!-- FishyJoes.export(create) -->
    staticTestAPI.Structs_MutableStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_MutableStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MutableStruct_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(increment) -->
    void increment(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MutableStruct_increment(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    /// <!-- FishyJoes.export(incrementAsync) -->
    Future<void> incrementAsync(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MutableStruct_incrementAsync(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(asyncGetI) -->
    Future<int> asyncGetI(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MutableStruct_asyncGetI(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MutableStruct_asyncGetI;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MutableStruct_create;
    static late void Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MutableStruct_increment;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MutableStruct_incrementAsync;
}
