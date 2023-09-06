import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './Bytes.dart' as TestAPI;
import './Bytes.dart';
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
import './SimpleEnum.dart' as TestAPI;
import './SimpleEnum.dart';
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(Bytes) -->
class Bytes {
    Bytes._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
    static List<int> get bytes =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Bytes_bytes(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(data) -->
    static typed_data.Uint8List get data =>
        check((exn) =>
            consumeCreatedRef<typed_data.Uint8List>(f__iota_get_Bytes_data(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echoBytes) -->
    static List<int> echoBytes(
        List<int> bytes,
    ) =>
        GCRef.using(bytes, (_bytesHandle) =>
            consumeCreatedRef<List<int>>(check((OutCreatedRef _exn) => f__iota_Bytes_echoBytes(Loader.shared.env, _bytesHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoData) -->
    static typed_data.Uint8List echoData(
        typed_data.Uint8List data,
    ) =>
        GCRef.using(data, (_dataHandle) =>
            consumeCreatedRef<typed_data.Uint8List>(check((OutCreatedRef _exn) => f__iota_Bytes_echoData(Loader.shared.env, _dataHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef bytes,
        OutCreatedRef _exn
    ) f__iota_Bytes_echoBytes;
    static late CreatedRef Function(
        Env env,
        UnownedRef data,
        OutCreatedRef _exn
    ) f__iota_Bytes_echoData;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_Bytes_bytes;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_Bytes_data;
}
