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

/// <!-- FishyJoes.export(TestDifferingExportNameStruct) -->
class TestDifferingExportNameStruct implements TestAPI.TestDifferingExportNameProtocolDiffy {
    int tata;

    TestDifferingExportNameStruct({
        required int tata
    }):
        this.tata = tata;

    static CreatedRef ffi_constructor(
        int tata,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestDifferingExportNameStruct(
            tata: tata,
        ))
    );
    @override
    String toString() => 'TestAPI.TestDifferingExportNameStruct(tata: $tata)';

    static int ffi_get_tata(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestDifferingExportNameStruct>(obj).tata
    ) ?? 0;
    static void ffi_set_tata(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<TestDifferingExportNameStruct>(obj).tata = newValue;
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestDifferingExportNameStruct &&
            (
                const DeepCollectionEquality().equals(other.tata, tata)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(tata)
    );

    TestDifferingExportNameStruct copyWith({
        int? tata
    }) => TestDifferingExportNameStruct(
        tata: tata ?? this.tata
    );
}
