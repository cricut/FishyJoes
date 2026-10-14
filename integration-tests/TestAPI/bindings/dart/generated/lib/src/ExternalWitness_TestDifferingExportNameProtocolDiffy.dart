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

/// <!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->
class ExternalWitness_TestDifferingExportNameProtocolDiffy extends SwiftReference implements TestAPI.TestDifferingExportNameProtocolDiffy {
    ExternalWitness_TestDifferingExportNameProtocolDiffy(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(ExternalWitness_TestDifferingExportNameProtocolDiffy(ref))
    );

    /// <!-- FishyJoes.export(tata) -->
    int get tata =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestDifferingExportNameProtocol_tata(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestDifferingExportNameProtocol_tata;
}
