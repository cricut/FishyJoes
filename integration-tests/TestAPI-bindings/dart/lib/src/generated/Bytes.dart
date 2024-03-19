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
import './ExternalWitness_TestMethodsProtocol.dart' as TestAPI;
import './ExternalWitness_TestMutatingCounterProtocol.dart' as TestAPI;
import './ExternalWitness_TestOptionalsProtocol.dart' as TestAPI;
import './ExternalWitness_TestPropertiesProtocol.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './MutatingCounter.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
import './TestMutatingCounterProtocol.dart' as TestAPI;
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

/// <!-- FishyJoes.export(Bytes) -->
class Bytes {
    Bytes._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
    static List<int> get bytes =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Bytes_bytes(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(data) -->
    static typed_data.Uint8List get data =>
        check((exn) =>
            consumeCreatedRef<typed_data.Uint8List>(f__iota_get_TestAPI_Bytes_data(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echoBytes) -->
    static List<int> echoBytes(
        List<int> bytes,
    ) =>
        GCRef.using(bytes, (_bytesHandle) =>
            consumeCreatedRef<List<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Bytes_echoBytes(Loader.shared.env, _bytesHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoData) -->
    static typed_data.Uint8List echoData(
        typed_data.Uint8List data,
    ) =>
        GCRef.using(data, (_dataHandle) =>
            consumeCreatedRef<typed_data.Uint8List>(check((OutCreatedRef _exn) => f__iota_TestAPI_Bytes_echoData(Loader.shared.env, _dataHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef bytes,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Bytes_echoBytes;
    static late CreatedRef Function(
        Env env,
        UnownedRef data,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Bytes_echoData;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Bytes_bytes;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Bytes_data;
}
