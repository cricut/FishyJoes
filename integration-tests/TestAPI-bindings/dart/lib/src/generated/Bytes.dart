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

/// <!-- FishyJoes.export(Bytes) -->
class Bytes {
    Bytes._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
    static List<int> get bytes =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_Bytes_TheBytes(exn))
        )
    ;
    /// <!-- FishyJoes.export(data) -->
    static typed_data.Uint8List get data =>
        check((exn) =>
            consumeCreatedRef<typed_data.Uint8List>(f__iota_get_Bytes_Data(exn))
        )
    ;
    /// <!-- FishyJoes.export(echoBytes) -->
    static List<int> echoBytes(
        List<int> bytes,
    ) =>
        GCRef.using(bytes, (_bytesHandle) =>
            consumeCreatedRef<List<int>>(check((OutCreatedRef _exn) => f__iota_Bytes_echoBytes(_bytesHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(echoData) -->
    static typed_data.Uint8List echoData(
        typed_data.Uint8List data,
    ) =>
        GCRef.using(data, (_dataHandle) =>
            consumeCreatedRef<typed_data.Uint8List>(check((OutCreatedRef _exn) => f__iota_Bytes_echoData(_dataHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        UnownedRef bytes,
        OutCreatedRef _exn
    ) f__iota_Bytes_echoBytes;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Bytes_TheBytes;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Bytes_Data;
    static late CreatedRef Function(
        UnownedRef data,
        OutCreatedRef _exn
    ) f__iota_Bytes_echoData;
}
