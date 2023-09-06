import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
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

part 'Collections_CollectionHolder.freezed.dart';

/// <!-- FishyJoes.export(Collections.CollectionHolder) -->
@Freezed(addImplicitFinal: false, makeCollectionsUnmodifiable: false)
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

    Collections_CollectionHolder._();
    static CreatedRef ffi_constructor(
        ConsumedRef boolArray,
        ConsumedRef boolSet,
        ConsumedRef boolDictionary,
        ConsumedRef integerArray,
        ConsumedRef integerSet,
        ConsumedRef integerDictionary,
        ConsumedRef stringArray,
        ConsumedRef stringSet,
        ConsumedRef stringDictionary,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Collections_CollectionHolder(
            boolArray: consumeRef(boolArray),
            boolSet: consumeRef(boolSet),
            boolDictionary: consumeRef(boolDictionary),
            integerArray: consumeRef(integerArray),
            integerSet: consumeRef(integerSet),
            integerDictionary: consumeRef(integerDictionary),
            stringArray: consumeRef(stringArray),
            stringSet: consumeRef(stringSet),
            stringDictionary: consumeRef(stringDictionary),
        ))
    );

    static CreatedRef ffi_get_boolArray(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).boolArray
        )
    );
    static void ffi_set_boolArray(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).boolArray = consumeRef<List<bool>>(newValue);
    });

    static CreatedRef ffi_get_boolSet(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).boolSet
        )
    );
    static void ffi_set_boolSet(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).boolSet = consumeRef<Set<bool>>(newValue);
    });

    static CreatedRef ffi_get_boolDictionary(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).boolDictionary
        )
    );
    static void ffi_set_boolDictionary(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).boolDictionary = consumeRef<Map<bool, bool>>(newValue);
    });

    static CreatedRef ffi_get_integerArray(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).integerArray
        )
    );
    static void ffi_set_integerArray(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).integerArray = consumeRef<List<int>>(newValue);
    });

    static CreatedRef ffi_get_integerSet(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).integerSet
        )
    );
    static void ffi_set_integerSet(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).integerSet = consumeRef<Set<int>>(newValue);
    });

    static CreatedRef ffi_get_integerDictionary(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).integerDictionary
        )
    );
    static void ffi_set_integerDictionary(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).integerDictionary = consumeRef<Map<int, int>>(newValue);
    });

    static CreatedRef ffi_get_stringArray(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).stringArray
        )
    );
    static void ffi_set_stringArray(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).stringArray = consumeRef<List<String>>(newValue);
    });

    static CreatedRef ffi_get_stringSet(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).stringSet
        )
    );
    static void ffi_set_stringSet(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).stringSet = consumeRef<Set<String>>(newValue);
    });

    static CreatedRef ffi_get_stringDictionary(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Collections_CollectionHolder>(obj).stringDictionary
        )
    );
    static void ffi_set_stringDictionary(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Collections_CollectionHolder>(obj).stringDictionary = consumeRef<Map<String, String>>(newValue);
    });

    /// <!-- FishyJoes.export(staticProperty) -->
    static List<int?> get staticProperty =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Collections_CollectionHolder_staticProperty(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(staticMutableProperty) -->
    static List<int?> get staticMutableProperty =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty(Loader.shared.env, exn))
        )
    ;
    static void set staticMutableProperty(List<int?> value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
        ;
    }

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Collections_CollectionHolder_staticProperty;
    static late void Function(
        Env env,
        UnownedRef staticMutableProperty,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty;
}
