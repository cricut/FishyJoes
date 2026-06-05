import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->
abstract class TestDifferingExportNameProtocolDiffy {

    /// <!-- FishyJoes.export(tata) -->
    int get tata;
}

extension TestDifferingExportNameProtocolDiffy_DefaultImplementations on TestDifferingExportNameProtocolDiffy {
}

extension TestDifferingExportNameProtocolDiffy_FfiHooks on TestDifferingExportNameProtocolDiffy {
    static int ffi_get_tata(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catching(exn, () =>
        peekRef<TestDifferingExportNameProtocolDiffy>(obj).tata
    ) ?? 0;
}
