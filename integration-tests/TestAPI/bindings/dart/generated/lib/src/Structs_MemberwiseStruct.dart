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

/// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
class Structs_MemberwiseStruct {
    String _immutable;
    String get immutable => _immutable;
    String mutable;

    Structs_MemberwiseStruct({
        required String immutable,
        required String mutable
    }):
        this._immutable = immutable,
        this.mutable = mutable;

    static CreatedRef ffi_constructor(
        ConsumedRef immutable,
        ConsumedRef mutable,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Structs_MemberwiseStruct(
            immutable: consumeRef(immutable),
            mutable: consumeRef(mutable),
        ))
    );
    @override
    String toString() => 'TestAPI.Structs_MemberwiseStruct(immutable: $immutable, mutable: $mutable)';

    static CreatedRef ffi_get_immutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catchingRef(exn, () =>
        createRef(
            peekRef<Structs_MemberwiseStruct>(obj).immutable
        )
    );
    static void ffi_set_immutable(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_MemberwiseStruct>(obj)._immutable =consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_mutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catchingRef(exn, () =>
        createRef(
            peekRef<Structs_MemberwiseStruct>(obj).mutable
        )
    );
    static void ffi_set_mutable(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_MemberwiseStruct>(obj).mutable =consumeRef<String>(newValue);
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Structs_MemberwiseStruct &&
            (
                const DeepCollectionEquality().equals(other.immutable, immutable) &&
                const DeepCollectionEquality().equals(other.mutable, mutable)
            )
        );
    }

    @override
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(immutable),
        const DeepCollectionEquality().hash(mutable)
    );

    Structs_MemberwiseStruct copyWith({
        String? immutable,
        String? mutable
    }) => Structs_MemberwiseStruct(
        immutable: immutable ?? this.immutable,
        mutable: mutable ?? this.mutable
    );

    /// <!-- FishyJoes.export(create) -->
    staticTestAPI.Structs_MemberwiseStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_MemberwiseStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MemberwiseStruct_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(asyncGetMutable) -->
    Future<String> asyncGetMutable(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MemberwiseStruct_create;
}
