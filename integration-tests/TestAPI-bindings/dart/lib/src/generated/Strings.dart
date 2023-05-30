import './AssociatedDataEnum.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:dart_runtime/runtime.dart';
import 'package:dart_runtime/utilities.dart' as utils;
import 'package:ffi/ffi.dart' as ffi;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(Strings) -->
class Strings {
    Strings._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(simple) -->
    static String get simple =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_Simple(exn))
        )
    ;
    /// <!-- FishyJoes.export(accent) -->
    static String get accent =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_Accent(exn))
        )
    ;
    /// <!-- FishyJoes.export(script) -->
    static String get script =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_Script(exn))
        )
    ;
    /// <!-- FishyJoes.export(chinese) -->
    static String get chinese =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_Chinese(exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseBMP) -->
    static String get chineseBMP =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_ChineseBMP(exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseSIP) -->
    static String get chineseSIP =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_ChineseSIP(exn))
        )
    ;
    /// <!-- FishyJoes.export(emoji) -->
    static String get emoji =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_Emoji(exn))
        )
    ;
    /// <!-- FishyJoes.export(emojiMulti) -->
    static String get emojiMulti =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_Strings_EmojiMulti(exn))
        )
    ;
    /// <!-- FishyJoes.export(echo) -->
    static String echo(
        String string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_Strings_echo(_stringHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_Simple;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_Accent;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_ChineseSIP;
    static late CreatedRef Function(
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_Strings_echo;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_Script;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_Emoji;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_Chinese;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_EmojiMulti;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Strings_ChineseBMP;
}
