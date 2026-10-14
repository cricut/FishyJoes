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

/// <!-- FishyJoes.export(TestNonExportedProtocolEnum) -->
sealed class TestNonExportedProtocolEnum {
    const factory TestNonExportedProtocolEnum.hogehoge(
    ) = TestNonExportedProtocolEnum_Hogehoge;

    const TestNonExportedProtocolEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<TestNonExportedProtocolEnum>(obj);
        if (peekedObj is TestNonExportedProtocolEnum_Hogehoge) { return 0; }
        else { throw UnsupportedError('Unknown TestNonExportedProtocolEnum subclass'); }
    });

    static CreatedRef newHogehoge(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestNonExportedProtocolEnum_Hogehoge(
        ))
    );

    static void extractHogehoge(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<TestNonExportedProtocolEnum_Hogehoge>(obj);
        });
    }

    /// <!-- FishyJoes.export(fuga) -->
    double get fuga =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestNonExportedProtocolEnum_fuga(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(hoge) -->
    double hoge(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestNonExportedProtocolEnum_hoge(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    static late double Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestNonExportedProtocolEnum_hoge;
    static late double Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestNonExportedProtocolEnum_fuga;
}

class TestNonExportedProtocolEnum_Hogehoge extends TestNonExportedProtocolEnum {
    const TestNonExportedProtocolEnum_Hogehoge();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is TestNonExportedProtocolEnum_Hogehoge
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'TestNonExportedProtocolEnum.hogehoge()';

    TestNonExportedProtocolEnum_Hogehoge copyWith() => TestNonExportedProtocolEnum_Hogehoge();
}
