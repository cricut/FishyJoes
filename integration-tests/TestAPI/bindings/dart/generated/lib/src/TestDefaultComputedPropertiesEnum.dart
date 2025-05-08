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

/// <!-- FishyJoes.export(TestDefaultComputedPropertiesEnum) -->
sealed class TestDefaultComputedPropertiesEnum implements TestAPI.TestDefaultComputedProperties {
    const factory TestDefaultComputedPropertiesEnum.qux(
    ) = TestDefaultComputedPropertiesEnum_Qux;

    const TestDefaultComputedPropertiesEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<TestDefaultComputedPropertiesEnum>(obj);
        if (peekedObj is TestDefaultComputedPropertiesEnum_Qux) { return 0; }
        else { throw UnsupportedError('Unknown TestDefaultComputedPropertiesEnum subclass'); }
    });

    static CreatedRef newQux(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestDefaultComputedPropertiesEnum_Qux(
        ))
    );

    static void extractQux(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<TestDefaultComputedPropertiesEnum_Qux>(obj);
        });
    }

    /// <!-- FishyJoes.export(noot) -->
    int get noot =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(spam) -->
    bool get spam =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot;
    static late bool Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam;
}

class TestDefaultComputedPropertiesEnum_Qux extends TestDefaultComputedPropertiesEnum {
    const TestDefaultComputedPropertiesEnum_Qux();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is TestDefaultComputedPropertiesEnum_Qux
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'TestDefaultComputedPropertiesEnum.qux()';

    TestDefaultComputedPropertiesEnum_Qux copyWith() => TestDefaultComputedPropertiesEnum_Qux();
}
