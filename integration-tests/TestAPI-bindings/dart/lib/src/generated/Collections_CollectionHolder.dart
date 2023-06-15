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

part 'Collections_CollectionHolder.freezed.dart';

/// <!-- FishyJoes.export(Collections.CollectionHolder) -->
@unfreezed
class Collections_CollectionHolder with _$Collections_CollectionHolder {
    factory Collections_CollectionHolder({
        required List<bool> boolArray,
        required Set<bool> boolSet,
        required Map<bool, bool> boolDictionary,
        required List<int> integerArray,
        required Set<int> integerSet,
        required Map<int, int> integerDictionary,
        required List<String> stringArray,
        required Set<String> stringSet,
        required Map<String, String> stringDictionary
    }) = _Collections_CollectionHolder;

    /// <!-- FishyJoes.export(staticPropery) -->
    static List<int?> get staticPropery =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Collections_CollectionHolder_staticPropery(exn))
        )
    ;
    /// <!-- FishyJoes.export(staticMutablePropery) -->
    static List<int?> get staticMutablePropery =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_Collections_CollectionHolder_staticMutablePropery(exn))
        )
    ;
    static void set staticMutablePropery(List<int?> value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_Collections_CollectionHolder_staticMutablePropery(_valueHandle.ptr, exn)
            )
        )
        ;
    }

    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Collections_CollectionHolder_staticMutablePropery;
    static late CreatedRef Function(
        OutCreatedRef _exn
    ) f__iota_get_Collections_CollectionHolder_staticPropery;
    static late void Function(
        UnownedRef staticMutablePropery,
        OutCreatedRef _exn
    ) f__iota_set_Collections_CollectionHolder_staticMutablePropery;
}
