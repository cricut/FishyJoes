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

/// <!-- FishyJoes.export(Strings) -->
class Strings {
    Strings._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(accent) -->
    static String get accent =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_accent(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chinese) -->
    static String get chinese =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_chinese(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseBMP) -->
    static String get chineseBMP =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_chineseBMP(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseSIP) -->
    static String get chineseSIP =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_chineseSIP(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(emoji) -->
    static String get emoji =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_emoji(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(emojiMulti) -->
    static String get emojiMulti =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_emojiMulti(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(script) -->
    static String get script =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_script(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(simple) -->
    static String get simple =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_Strings_simple(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echo) -->
    static String echo(
        String string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Strings_echo(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(split) -->
    static List<String> split(
        String string,
        String by,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            GCRef.using(by, (_byHandle) =>
                consumeCreatedRef<List<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Strings_split(Loader.shared.env, _stringHandle.ptr, _byHandle.ptr, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Strings_echo;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        UnownedRef by,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Strings_split;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_accent;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_chinese;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_chineseBMP;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_chineseSIP;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_emoji;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_emojiMulti;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_script;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Strings_simple;
}
