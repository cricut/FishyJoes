import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(AProtocol) -->
abstract class AProtocol {
    TestAPI.AProtocol bar(
        int x,
        int y
    );

    String hasADefaultImplementation(
        int x,
        double y
    );

    String hasADefaultImplementation2(
        String a,
        bool b,
        String c
    );

    /// <!-- FishyJoes.export(baz) -->
    bool get baz;

    /// <!-- FishyJoes.export(foo) -->
    String get foo;
}

extension AProtocol_DefaultImplementations on AProtocol {
}

extension AProtocol_FfiHooks on AProtocol {
    static bool ffi_get_baz(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<AProtocol>(obj).baz
    ) ?? false;

    static CreatedRef ffi_get_foo(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<AProtocol>(obj).foo
        )
    );

    static CreatedRef ffi_bar(
        UnownedRef obj,
        int x,
        int y,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<AProtocol>(obj).bar(
                x,
                y
            )
        )
    );

    static CreatedRef ffi_hasADefaultImplementation(
        UnownedRef obj,
        int x,
        double y,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<AProtocol>(obj).hasADefaultImplementation(
                x,
                y
            )
        )
    );

    static CreatedRef ffi_hasADefaultImplementation2(
        UnownedRef obj,
        UnownedRef a,
        bool b,
        UnownedRef c,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<AProtocol>(obj).hasADefaultImplementation2(
                peekRef(a),
                b,
                peekRef(c)
            )
        )
    );
}
