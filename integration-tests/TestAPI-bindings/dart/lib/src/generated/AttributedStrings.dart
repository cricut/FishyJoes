import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './AttributedStrings.dart' as TestAPI;
import './AttributedStrings.dart';
import './Bytes.dart' as TestAPI;
import './Bytes.dart';
import './ClosedRanges.dart' as TestAPI;
import './ClosedRanges.dart';
import './Collections.dart' as TestAPI;
import './Collections.dart';
import './Collections_CollectionHolder.dart' as TestAPI;
import './Collections_CollectionHolder.dart';
import './DefaultArguments.dart' as TestAPI;
import './DefaultArguments.dart';
import './Deprecations.dart' as TestAPI;
import './Deprecations.dart';
import './EmptyEnum.dart' as TestAPI;
import './EmptyEnum.dart';
import './Functions.dart' as TestAPI;
import './Functions.dart';
import './Functions_TheError.dart' as TestAPI;
import './Functions_TheError.dart';
import './Methods.dart' as TestAPI;
import './Methods.dart';
import './Primitives.dart' as TestAPI;
import './Primitives.dart';
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart';
import './Ranges.dart' as TestAPI;
import './Ranges.dart';
import './SimpleEnum.dart' as TestAPI;
import './SimpleEnum.dart';
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart';
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import './URLs.dart' as TestAPI;
import './URLs.dart';
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(AttributedStrings) -->
class AttributedStrings {
    AttributedStrings._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(simple) -->
    static Cricut.FishyJoesRuntime.AttributedString get simple =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_simple(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(accent) -->
    static Cricut.FishyJoesRuntime.AttributedString get accent =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_accent(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(script) -->
    static Cricut.FishyJoesRuntime.AttributedString get script =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_script(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chinese) -->
    static Cricut.FishyJoesRuntime.AttributedString get chinese =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_chinese(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseBMP) -->
    static Cricut.FishyJoesRuntime.AttributedString get chineseBMP =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_chineseBMP(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseSIP) -->
    static Cricut.FishyJoesRuntime.AttributedString get chineseSIP =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_chineseSIP(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(emoji) -->
    static Cricut.FishyJoesRuntime.AttributedString get emoji =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_emoji(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(emojiMulti) -->
    static Cricut.FishyJoesRuntime.AttributedString get emojiMulti =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_emojiMulti(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(polyglot) -->
    static Cricut.FishyJoesRuntime.AttributedString get polyglot =>
        check((exn) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_polyglot(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echo) -->
    static Cricut.FishyJoesRuntime.AttributedString echo(
        Cricut.FishyJoesRuntime.AttributedString string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_echo(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(firstIndex) -->
    static Cricut.FishyJoesRuntime.AttributedString.Index firstIndex(
        Cricut.FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString.Index>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_firstIndex(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(lastIndex) -->
    static Cricut.FishyJoesRuntime.AttributedString.Index lastIndex(
        Cricut.FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributedString.Index>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_lastIndex(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(fullRange) -->
    static FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> fullRange(
        Cricut.FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_fullRange(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(attributedCharacters) -->
    static List<Cricut.FishyJoesRuntime.AttributedString> attributedCharacters(
        Cricut.FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<List<Cricut.FishyJoesRuntime.AttributedString>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_attributedCharacters(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(attributesPreferringDuplicatesNearerStart) -->
    static Cricut.FishyJoesRuntime.AttributeContainer attributesPreferringDuplicatesNearerStart(
        Cricut.FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<Cricut.FishyJoesRuntime.AttributeContainer>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(emptyAttributeRuns) -->
    static List<Cricut.FishyJoesRuntime.AttributedString.Runs.Run> emptyAttributeRuns(
        Cricut.FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<List<Cricut.FishyJoesRuntime.AttributedString.Runs.Run>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_emptyAttributeRuns(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AttributedStrings_attributedCharacters;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AttributedStrings_echo;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AttributedStrings_emptyAttributeRuns;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AttributedStrings_firstIndex;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AttributedStrings_fullRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AttributedStrings_lastIndex;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_accent;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_chinese;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_chineseBMP;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_chineseSIP;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_emoji;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_emojiMulti;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_polyglot;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_script;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AttributedStrings_simple;
}
