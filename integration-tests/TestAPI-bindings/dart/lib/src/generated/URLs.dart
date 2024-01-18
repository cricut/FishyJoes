import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart';
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

/// <!-- FishyJoes.export(URLs) -->
class URLs {
    URLs._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(simple) -->
    static Uri get simple =>
        check((exn) =>
            consumeCreatedRef<Uri>(f__iota_get_TestAPI_URLs_simple(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(remoteFile) -->
    static Uri get remoteFile =>
        check((exn) =>
            consumeCreatedRef<Uri>(f__iota_get_TestAPI_URLs_remoteFile(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(localFile) -->
    static Uri get localFile =>
        check((exn) =>
            consumeCreatedRef<Uri>(f__iota_get_TestAPI_URLs_localFile(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echo) -->
    static Uri echo(
        Uri url,
    ) =>
        GCRef.using(url, (_urlHandle) =>
            consumeCreatedRef<Uri>(check((OutCreatedRef _exn) => f__iota_TestAPI_URLs_echo(Loader.shared.env, _urlHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef url,
        OutCreatedRef _exn
    ) f__iota_TestAPI_URLs_echo;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_URLs_localFile;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_URLs_remoteFile;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_URLs_simple;
}
