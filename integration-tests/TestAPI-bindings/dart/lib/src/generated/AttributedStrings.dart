import './AProtocol.dart' as TestAPI;
import './AProtocolImplementation.dart' as TestAPI;
import './Actors.dart' as TestAPI;
import './Actors_TemperatureLogger.dart' as TestAPI;
import './AssociatedDataEnum.dart' as TestAPI;
import './AsyncFunctions.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedStrings.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './ClosedRanges.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './ExternalWitness_AProtocol.dart' as TestAPI;
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
import './ExternalWitness_TestDefaultComputedProperties.dart' as TestAPI;
import './ExternalWitness_TestLeadingUnderscoredProp.dart' as TestAPI;
import './ExternalWitness_TestMethodsProtocol.dart' as TestAPI;
import './ExternalWitness_TestOptionalsProtocol.dart' as TestAPI;
import './ExternalWitness_TestPropertiesProtocol.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_EmptyStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestAsyncForeignSideFunctionsStruct.dart' as TestAPI;
import './TestAsyncFunctions.dart' as TestAPI;
import './TestAsyncSwiftSideFunctionsClass.dart' as TestAPI;
import './TestDefaultComputedProperties.dart' as TestAPI;
import './TestDefaultComputedPropertiesEnum.dart' as TestAPI;
import './TestDefaultComputedPropertiesReference.dart' as TestAPI;
import './TestDefaultComputedPropertiesStruct.dart' as TestAPI;
import './TestLeadingUnderscoredProp.dart' as TestAPI;
import './TestLeadingUnderscoredPropStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
import './TestOptionalsProtocol.dart' as TestAPI;
import './TestPropertiesProtocol.dart' as TestAPI;
import './TestProtocolClass.dart' as TestAPI;
import './TestProtocolEnum.dart' as TestAPI;
import './TestProtocolStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import './URLs.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
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

/// <!-- FishyJoes.export(AttributedStrings) -->
class AttributedStrings {
    AttributedStrings._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(accent) -->
    static FishyJoesRuntime.AttributedString get accent =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_accent(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chinese) -->
    static FishyJoesRuntime.AttributedString get chinese =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_chinese(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseBMP) -->
    static FishyJoesRuntime.AttributedString get chineseBMP =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_chineseBMP(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(chineseSIP) -->
    static FishyJoesRuntime.AttributedString get chineseSIP =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_chineseSIP(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(emoji) -->
    static FishyJoesRuntime.AttributedString get emoji =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_emoji(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(emojiMulti) -->
    static FishyJoesRuntime.AttributedString get emojiMulti =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_emojiMulti(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(polyglot) -->
    static FishyJoesRuntime.AttributedString get polyglot =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_polyglot(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(script) -->
    static FishyJoesRuntime.AttributedString get script =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_script(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(simple) -->
    static FishyJoesRuntime.AttributedString get simple =>
        check((exn) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(f__iota_get_TestAPI_AttributedStrings_simple(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echo) -->
    static FishyJoesRuntime.AttributedString echo(
        FishyJoesRuntime.AttributedString string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_echo(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(firstIndex) -->
    static FishyJoesRuntime.AttributedString_Index firstIndex(
        FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString_Index>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_firstIndex(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(lastIndex) -->
    static FishyJoesRuntime.AttributedString_Index lastIndex(
        FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<FishyJoesRuntime.AttributedString_Index>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_lastIndex(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(fullRange) -->
    static FishyJoesRuntime.SwiftRange<FishyJoesRuntime.AttributedString_Index> fullRange(
        FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<FishyJoesRuntime.SwiftRange<FishyJoesRuntime.AttributedString_Index>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_fullRange(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(attributedCharacters) -->
    static List<FishyJoesRuntime.AttributedSubstring> attributedCharacters(
        FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<List<FishyJoesRuntime.AttributedSubstring>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_attributedCharacters(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(attributesPreferringDuplicatesNearerStart) -->
    static FishyJoesRuntime.AttributeContainer attributesPreferringDuplicatesNearerStart(
        FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<FishyJoesRuntime.AttributeContainer>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart(Loader.shared.env, _stringHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(emptyAttributeRuns) -->
    static List<FishyJoesRuntime.AttributedString_Runs_Run> emptyAttributeRuns(
        FishyJoesRuntime.AttributedString /* of */ string,
    ) =>
        GCRef.using(string, (_stringHandle) =>
            consumeCreatedRef<List<FishyJoesRuntime.AttributedString_Runs_Run>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AttributedStrings_emptyAttributeRuns(Loader.shared.env, _stringHandle.ptr, _exn)))
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
