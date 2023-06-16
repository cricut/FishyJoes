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

part 'Primitives_PrimitiveHolder.freezed.dart';

/// <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
@unfreezed
class Primitives_PrimitiveHolder with _$Primitives_PrimitiveHolder {
    factory Primitives_PrimitiveHolder({
        required bool b,
        required bool? bq,
        required int ui8,
        required int? ui8q,
        required int ui16,
        required int? ui16q,
        required int ui32,
        required int? ui32q,
        required int ui64,
        required int? ui64q,
        required int i8,
        required int? i8q,
        required int i16,
        required int? i16q,
        required int i32,
        required int? i32q,
        required int i64,
        required int? i64q,
        required double f,
        required double? fq,
        required double d,
        required double? dq
    }) = _Primitives_PrimitiveHolder;

    /// <!-- FishyJoes.export(staticPropery) -->
    static List<int?> get staticPropery =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__dart_get_Primitives_PrimitiveHolder_staticPropery(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(staticMutablePropery) -->
    static List<int?> get staticMutablePropery =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__dart_get_Primitives_PrimitiveHolder_staticMutablePropery(Loader.shared.env, exn))
        )
    ;
    static void set staticMutablePropery(List<int?> value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__dart_set_Primitives_PrimitiveHolder_staticMutablePropery(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
        ;
    }

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__dart_get_Primitives_PrimitiveHolder_staticMutablePropery;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__dart_get_Primitives_PrimitiveHolder_staticPropery;
    static late void Function(
        Env env,
        UnownedRef staticMutablePropery,
        OutCreatedRef _exn
    ) f__dart_set_Primitives_PrimitiveHolder_staticMutablePropery;
}
