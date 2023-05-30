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

part 'Structs_MemberwiseStruct.freezed.dart';

/// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
@unfreezed
class Structs_MemberwiseStruct with _$Structs_MemberwiseStruct {
    factory Structs_MemberwiseStruct({
        required String immutable,
        required String mutable
    }) = _Structs_MemberwiseStruct;

    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_MemberwiseStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_MemberwiseStruct>(check((OutCreatedRef _exn) => f__iota_Structs_MemberwiseStruct_create(_exn)))
    ;

    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_Structs_MemberwiseStruct_create;
}
