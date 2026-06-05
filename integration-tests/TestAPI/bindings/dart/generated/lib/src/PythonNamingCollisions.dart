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

/// <!-- FishyJoes.export(PythonNamingCollisions) -->
class PythonNamingCollisions {
    PythonNamingCollisions._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(class) -->
    static int get m_class =>
        check((exn) =>
            f__iota_get_TestAPI_PythonNamingCollisions_class(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(__dunder__) -->
    static int get m__dunder__ =>
        check((exn) =>
            f__iota_get_TestAPI_PythonNamingCollisions___dunder__(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(isNaN) -->
    static bool get isNaN =>
        check((exn) =>
            f__iota_get_TestAPI_PythonNamingCollisions_isNaN(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(_leadingUnderscore) -->
    static int get m_leadingUnderscore =>
        check((exn) =>
            f__iota_get_TestAPI_PythonNamingCollisions__leadingUnderscore(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(list) -->
    static int get list =>
        check((exn) =>
            f__iota_get_TestAPI_PythonNamingCollisions_list(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(Url) -->
    static String get Url =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_PythonNamingCollisions_Url(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(URL) -->
    static String get URL =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_PythonNamingCollisions_URL(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(from) -->
    staticString from(
    ) =>
        consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_PythonNamingCollisions_from(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(keywordArgs) -->
    staticint keywordArgs(
        int m_class,
        int list,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_PythonNamingCollisions_keywordArgs(Loader.shared.env, m_class, list, _exn))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_PythonNamingCollisions_from;
    static late int Function(
        Env env,
        int m_class,
        int list,
        OutCreatedRef _exn
    ) f__iota_TestAPI_PythonNamingCollisions_keywordArgs;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_PythonNamingCollisions_URL;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_PythonNamingCollisions_Url;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_PythonNamingCollisions___dunder__;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_PythonNamingCollisions__leadingUnderscore;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_PythonNamingCollisions_class;
    static late bool Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_PythonNamingCollisions_isNaN;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_PythonNamingCollisions_list;
}
