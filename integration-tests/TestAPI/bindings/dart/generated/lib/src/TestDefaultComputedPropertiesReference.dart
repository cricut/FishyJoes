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

/// <!-- FishyJoes.exportReference(TestDefaultComputedPropertiesReference) -->
class TestDefaultComputedPropertiesReference extends SwiftReference implements TestAPI.TestDefaultComputedProperties {
    TestDefaultComputedPropertiesReference(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(TestDefaultComputedPropertiesReference(ref))
    );

    /// <!-- FishyJoes.export(noot) -->
    int get noot =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    void set noot(int value) {
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot(Loader.shared.env, _thisHandle.ptr, value, exn)
            )
        )
        ;
    }
    /// <!-- FishyJoes.export(plutonic) -->
    String get plutonic =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(spam) -->
    bool get spam =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    void set spam(bool value) {
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam(Loader.shared.env, _thisHandle.ptr, value, exn)
            )
        )
        ;
    }
    /// <!-- FishyJoes.export(init) -->
    static TestAPI.TestDefaultComputedPropertiesReference init(
        bool spam,
        int noot,
    ) =>
        consumeCreatedRef<TestAPI.TestDefaultComputedPropertiesReference>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestDefaultComputedPropertiesClass_init(Loader.shared.env, spam, noot, _exn)))
    ;

    static late CreatedRef Function(
        Env env,
        bool spam,
        int noot,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestDefaultComputedPropertiesClass_init;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot;
    static late bool Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam;
    static late void Function(
        Env env,
        UnownedRef _this,
        int noot,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot;
    static late void Function(
        Env env,
        UnownedRef _this,
        bool spam,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam;
}
