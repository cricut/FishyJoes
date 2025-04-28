import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(TestDefaultComputedProperties) -->
abstract class TestDefaultComputedProperties {
}

extension TestDefaultComputedProperties_DefaultImplementations on TestDefaultComputedProperties {

    /// <!-- FishyJoes.export(noot) -->
    /// <!-- FishyJoes.export(noot) -->
    int get noot =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota__default_TestAPI_TestDefaultComputedProperties_noot(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;

    /// <!-- FishyJoes.export(plutonic) -->
    /// <!-- FishyJoes.export(plutonic) -->
    String get plutonic =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota__default_TestAPI_TestDefaultComputedProperties_plutonic(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota__default_TestAPI_TestDefaultComputedProperties_noot;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota__default_TestAPI_TestDefaultComputedProperties_plutonic;
}

extension TestDefaultComputedProperties_FfiHooks on TestDefaultComputedProperties {
    static int ffi_get_noot(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestDefaultComputedProperties>(obj).noot
    ) ?? 0;

    static CreatedRef ffi_get_plutonic(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestDefaultComputedProperties>(obj).plutonic
        )
    );
}
