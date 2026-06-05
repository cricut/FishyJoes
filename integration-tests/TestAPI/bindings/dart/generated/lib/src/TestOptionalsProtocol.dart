import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(TestOptionalsProtocol) -->
abstract class TestOptionalsProtocol {
    double? wombat(
        int? zxc
    );

    int spqr(
        TestAPI.AssociatedDataEnum pippo
    );

    /// <!-- FishyJoes.export(flarp) -->
    String? get flarp;
}

extension TestOptionalsProtocol_DefaultImplementations on TestOptionalsProtocol {
}

extension TestOptionalsProtocol_FfiHooks on TestOptionalsProtocol {
    static CreatedRef ffi_get_flarp(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catchingRef(exn, () =>
        createRef(
            peekRef<TestOptionalsProtocol>(obj).flarp
        )
    );

    static CreatedRef ffi_wombat(
        UnownedRef obj,
        UnownedRef zxc,
        OutCreatedRef exn
    ) =>catchingRef(exn, () =>
        createRef(
            peekRef<TestOptionalsProtocol>(obj).wombat(
                peekRef(zxc)
            )
        )
    );

    static int ffi_spqr(
        UnownedRef obj,
        UnownedRef pippo,
        OutCreatedRef exn
    ) =>catching(exn, () =>
        peekRef<TestOptionalsProtocol>(obj).spqr(
            peekRef(pippo)
        )
    ) ?? 0;
}
