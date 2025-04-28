import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(TestMethodsProtocol) -->
abstract class TestMethodsProtocol {
    void foo(
    );

    bool bar(
    );

    void baz(
        bool qux
    );

    String garply(
        String m_0
    );

    String xyzzy(
        int thud,
        List<double> grault
    );

    tuple.Tuple3<bool, int, String> plugh(
        tuple.Tuple3<bool, double, List<String>> fred
    );
}

extension TestMethodsProtocol_DefaultImplementations on TestMethodsProtocol {
}

extension TestMethodsProtocol_FfiHooks on TestMethodsProtocol {
    static void ffi_foo(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestMethodsProtocol>(obj).foo(
        )
    );

    static bool ffi_bar(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestMethodsProtocol>(obj).bar(
        )
    ) ?? false;

    static void ffi_baz(
        UnownedRef obj,
        bool qux,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestMethodsProtocol>(obj).baz(
            qux
        )
    );

    static CreatedRef ffi_garply(
        UnownedRef obj,
        UnownedRef m_0,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestMethodsProtocol>(obj).garply(
                peekRef(m_0)
            )
        )
    );

    static CreatedRef ffi_xyzzy(
        UnownedRef obj,
        int thud,
        UnownedRef grault,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestMethodsProtocol>(obj).xyzzy(
                thud,
                peekRef(grault)
            )
        )
    );

    static CreatedRef ffi_plugh(
        UnownedRef obj,
        UnownedRef fred,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestMethodsProtocol>(obj).plugh(
                peekRef(fred)
            )
        )
    );
}
