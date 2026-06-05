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

/// <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->
class TestDefaultComputedPropertiesStruct implements TestAPI.TestDefaultComputedProperties {
    bool spam;
    int noot;

    TestDefaultComputedPropertiesStruct({
        required bool spam,
        required int noot
    }):
        this.spam = spam,
        this.noot = noot;

    static CreatedRef ffi_constructor(
        bool spam,
        int noot,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestDefaultComputedPropertiesStruct(
            spam: spam,
            noot: noot,
        ))
    );
    @override
    String toString() => 'TestAPI.TestDefaultComputedPropertiesStruct(spam: $spam, noot: $noot)';

    static bool ffi_get_spam(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catching(exn, () =>
        peekRef<TestDefaultComputedPropertiesStruct>(obj).spam
    ) ?? false;
    static void ffi_set_spam(
        UnownedRef obj,
        bool newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<TestDefaultComputedPropertiesStruct>(obj).spam =newValue;
    });

    static int ffi_get_noot(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catching(exn, () =>
        peekRef<TestDefaultComputedPropertiesStruct>(obj).noot
    ) ?? 0;
    static void ffi_set_noot(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<TestDefaultComputedPropertiesStruct>(obj).noot =newValue;
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestDefaultComputedPropertiesStruct &&
            (
                const DeepCollectionEquality().equals(other.spam, spam) &&
                const DeepCollectionEquality().equals(other.noot, noot)
            )
        );
    }

    @override
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(spam),
        const DeepCollectionEquality().hash(noot)
    );

    TestDefaultComputedPropertiesStruct copyWith({
        bool? spam,
        int? noot
    }) => TestDefaultComputedPropertiesStruct(
        spam: spam ?? this.spam,
        noot: noot ?? this.noot
    );

    /// <!-- FishyJoes.export(plutonic) -->
    String get plutonic =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic;
}
