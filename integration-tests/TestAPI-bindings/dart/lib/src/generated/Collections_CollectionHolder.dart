import './AProtocolImplementation.dart' as TestAPI;
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
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
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

/// <!-- FishyJoes.export(Collections.CollectionHolder) -->
class Collections_CollectionHolder {
    List<bool> boolArray;
    Map<bool, bool> boolDictionary;
    Set<bool> boolSet;
    List<int> integerArray;
    Map<int, int> integerDictionary;
    Set<int> integerSet;
    List<String> stringArray;
    Map<String, String> stringDictionary;
    Set<String> stringSet;

    Collections_CollectionHolder({
        required List<bool> boolArray,
        required Map<bool, bool> boolDictionary,
        required Set<bool> boolSet,
        required List<int> integerArray,
        required Map<int, int> integerDictionary,
        required Set<int> integerSet,
        required List<String> stringArray,
        required Map<String, String> stringDictionary,
        required Set<String> stringSet
    }):
        this.boolArray = boolArray,
        this.boolDictionary = boolDictionary,
        this.boolSet = boolSet,
        this.integerArray = integerArray,
        this.integerDictionary = integerDictionary,
        this.integerSet = integerSet,
        this.stringArray = stringArray,
        this.stringDictionary = stringDictionary,
        this.stringSet = stringSet;

    static CreatedRef ffi_constructor(
        ConsumedRef boolArray,
        ConsumedRef boolDictionary,
        ConsumedRef boolSet,
        ConsumedRef integerArray,
        ConsumedRef integerDictionary,
        ConsumedRef integerSet,
        ConsumedRef stringArray,
        ConsumedRef stringDictionary,
        ConsumedRef stringSet,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Collections_CollectionHolder(
            boolArray: consumeRef(boolArray),
            boolDictionary: consumeRef(boolDictionary),
            boolSet: consumeRef(boolSet),
            integerArray: consumeRef(integerArray),
            integerDictionary: consumeRef(integerDictionary),
            integerSet: consumeRef(integerSet),
            stringArray: consumeRef(stringArray),
            stringDictionary: consumeRef(stringDictionary),
            stringSet: consumeRef(stringSet),
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

    @override
    String toString() => 'Collections_CollectionHolder(boolArray: $boolArray, boolDictionary: $boolDictionary, boolSet: $boolSet, integerArray: $integerArray, integerDictionary: $integerDictionary, integerSet: $integerSet, stringArray: $stringArray, stringDictionary: $stringDictionary, stringSet: $stringSet)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Collections_CollectionHolder &&
            (
                const DeepCollectionEquality().equals(other.boolArray, boolArray) &&
                const DeepCollectionEquality().equals(other.boolDictionary, boolDictionary) &&
                const DeepCollectionEquality().equals(other.boolSet, boolSet) &&
                const DeepCollectionEquality().equals(other.integerArray, integerArray) &&
                const DeepCollectionEquality().equals(other.integerDictionary, integerDictionary) &&
                const DeepCollectionEquality().equals(other.integerSet, integerSet) &&
                const DeepCollectionEquality().equals(other.stringArray, stringArray) &&
                const DeepCollectionEquality().equals(other.stringDictionary, stringDictionary) &&
                const DeepCollectionEquality().equals(other.stringSet, stringSet)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(boolArray), 
        const DeepCollectionEquality().hash(boolDictionary), 
        const DeepCollectionEquality().hash(boolSet), 
        const DeepCollectionEquality().hash(integerArray), 
        const DeepCollectionEquality().hash(integerDictionary), 
        const DeepCollectionEquality().hash(integerSet), 
        const DeepCollectionEquality().hash(stringArray), 
        const DeepCollectionEquality().hash(stringDictionary), 
        const DeepCollectionEquality().hash(stringSet)
    );

    Collections_CollectionHolder copyWith({
        List<bool>? boolArray,
        Map<bool, bool>? boolDictionary,
        Set<bool>? boolSet,
        List<int>? integerArray,
        Map<int, int>? integerDictionary,
        Set<int>? integerSet,
        List<String>? stringArray,
        Map<String, String>? stringDictionary,
        Set<String>? stringSet
    }) => Collections_CollectionHolder(
        boolArray: boolArray ?? this.boolArray,
        boolDictionary: boolDictionary ?? this.boolDictionary,
        boolSet: boolSet ?? this.boolSet,
        integerArray: integerArray ?? this.integerArray,
        integerDictionary: integerDictionary ?? this.integerDictionary,
        integerSet: integerSet ?? this.integerSet,
        stringArray: stringArray ?? this.stringArray,
        stringDictionary: stringDictionary ?? this.stringDictionary,
        stringSet: stringSet ?? this.stringSet
    );

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
    /// <!-- FishyJoes.export(staticProperty) -->
    static List<int?> get staticProperty =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Collections_CollectionHolder_staticProperty(Loader.shared.env, exn))
        )
    ;

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
