import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(TestPropertiesProtocol) -->
abstract class TestPropertiesProtocol {

    /// <!-- FishyJoes.export(corge) -->
    String get corge;

    /// <!-- FishyJoes.export(frobby) -->
    List<int> get frobby;
}

extension TestPropertiesProtocol_DefaultImplementations on TestPropertiesProtocol {
}

extension TestPropertiesProtocol_FfiHooks on TestPropertiesProtocol {
    static CreatedRef ffi_get_corge(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catchingRef(exn, () =>
        createRef(
            peekRef<TestPropertiesProtocol>(obj).corge
        )
    );

    static CreatedRef ffi_get_frobby(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catchingRef(exn, () =>
        createRef(
            peekRef<TestPropertiesProtocol>(obj).frobby
        )
    );
}
