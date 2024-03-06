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

/// <!-- FishyJoes.export(Collections.CollectionHolder) -->
class Collections_CollectionHolder {
    List<bool> boolArray;
    Set<bool> boolSet;
    Map<bool, bool> boolDictionary;
    List<int> integerArray;
    Set<int> integerSet;
    Map<int, int> integerDictionary;
    List<String> stringArray;
    Set<String> stringSet;
    Map<String, String> stringDictionary;

    Collections_CollectionHolder({
        required List<bool> boolArray,
        required Set<bool> boolSet,
        required Map<bool, bool> boolDictionary,
        required List<int> integerArray,
        required Set<int> integerSet,
        required Map<int, int> integerDictionary,
        required List<String> stringArray,
        required Set<String> stringSet,
        required Map<String, String> stringDictionary
    }):
        this.boolArray = boolArray,
        this.boolSet = boolSet,
        this.boolDictionary = boolDictionary,
        this.integerArray = integerArray,
        this.integerSet = integerSet,
        this.integerDictionary = integerDictionary,
        this.stringArray = stringArray,
        this.stringSet = stringSet,
        this.stringDictionary = stringDictionary;

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

    static CreatedRef ffi_get_staticProperty(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Collections_CollectionHolder.staticProperty
        )
    );

    static CreatedRef ffi_get_staticMutableProperty(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Collections_CollectionHolder.staticMutableProperty
        )
    );
    static void ffi_set_staticMutableProperty(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        Collections_CollectionHolder.staticMutableProperty = consumeRef<List<int?>>(newValue);
    });

    @override
    String toString() => 'Collections_CollectionHolder(staticProperty: $staticProperty, staticMutableProperty: $staticMutableProperty)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Collections_CollectionHolder &&
            (
                const DeepCollectionEquality().equals(other.boolArray, boolArray) &&
                const DeepCollectionEquality().equals(other.boolSet, boolSet) &&
                const DeepCollectionEquality().equals(other.boolDictionary, boolDictionary) &&
                const DeepCollectionEquality().equals(other.integerArray, integerArray) &&
                const DeepCollectionEquality().equals(other.integerSet, integerSet) &&
                const DeepCollectionEquality().equals(other.integerDictionary, integerDictionary) &&
                const DeepCollectionEquality().equals(other.stringArray, stringArray) &&
                const DeepCollectionEquality().equals(other.stringSet, stringSet) &&
                const DeepCollectionEquality().equals(other.stringDictionary, stringDictionary)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(boolArray), 
        const DeepCollectionEquality().hash(boolSet), 
        const DeepCollectionEquality().hash(boolDictionary), 
        const DeepCollectionEquality().hash(integerArray), 
        const DeepCollectionEquality().hash(integerSet), 
        const DeepCollectionEquality().hash(integerDictionary), 
        const DeepCollectionEquality().hash(stringArray), 
        const DeepCollectionEquality().hash(stringSet), 
        const DeepCollectionEquality().hash(stringDictionary)
    );

    Collections_CollectionHolder copyWith({
        List<bool>? boolArray,
        Set<bool>? boolSet,
        Map<bool, bool>? boolDictionary,
        List<int>? integerArray,
        Set<int>? integerSet,
        Map<int, int>? integerDictionary,
        List<String>? stringArray,
        Set<String>? stringSet,
        Map<String, String>? stringDictionary
    }) => Collections_CollectionHolder(
        boolArray: boolArray ?? this.boolArray,
        boolSet: boolSet ?? this.boolSet,
        boolDictionary: boolDictionary ?? this.boolDictionary,
        integerArray: integerArray ?? this.integerArray,
        integerSet: integerSet ?? this.integerSet,
        integerDictionary: integerDictionary ?? this.integerDictionary,
        stringArray: stringArray ?? this.stringArray,
        stringSet: stringSet ?? this.stringSet,
        stringDictionary: stringDictionary ?? this.stringDictionary
    );
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
