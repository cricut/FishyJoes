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
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
import './ExternalWitness_TestLeadingUnderscoredProp.dart' as TestAPI;
import './ExternalWitness_TestMethodsProtocol.dart' as TestAPI;
import './ExternalWitness_TestOptionalsProtocol.dart' as TestAPI;
import './ExternalWitness_TestPropertiesProtocol.dart' as TestAPI;
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
import './TestAsyncFunctions.dart' as TestAPI;
import './TestAsyncFunctionsStruct.dart' as TestAPI;
import './TestLeadingUnderscoredProp.dart' as TestAPI;
import './TestLeadingUnderscoredPropStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestAsyncFunctionsStruct) -->
class TestAsyncFunctionsStruct {
    final Future<int> Function() const42;
    final Future<int> Function(int) iabs;
    final Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) intCompose;
    final Future<double> Function(double, double, int) add3Things;
    final Future<List<String>> Function(String, String, String, String) makeList;
    final Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fifthThing;

    TestAsyncFunctionsStruct({
        required Future<int> Function() const42,
        required Future<int> Function(int) iabs,
        required Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) intCompose,
        required Future<double> Function(double, double, int) add3Things,
        required Future<List<String>> Function(String, String, String, String) makeList,
        required Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fifthThing
    }):
        this.const42 = const42,
        this.iabs = iabs,
        this.intCompose = intCompose,
        this.add3Things = add3Things,
        this.makeList = makeList,
        this.fifthThing = fifthThing;

    static CreatedRef ffi_constructor(
        ConsumedRef const42,
        ConsumedRef iabs,
        ConsumedRef intCompose,
        ConsumedRef add3Things,
        ConsumedRef makeList,
        ConsumedRef fifthThing,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestAsyncFunctionsStruct(
            const42: consumeRef(const42),
            iabs: consumeRef(iabs),
            intCompose: consumeRef(intCompose),
            add3Things: consumeRef(add3Things),
            makeList: consumeRef(makeList),
            fifthThing: consumeRef(fifthThing),
        ))
    );
    @override
    String toString() => 'TestAsyncFunctionsStruct(const42: $const42, iabs: $iabs, intCompose: $intCompose, add3Things: $add3Things, makeList: $makeList, fifthThing: $fifthThing)';

    static CreatedRef ffi_get_const42(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctionsStruct>(obj).const42
        )
    );

    static CreatedRef ffi_get_iabs(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctionsStruct>(obj).iabs
        )
    );

    static CreatedRef ffi_get_intCompose(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctionsStruct>(obj).intCompose
        )
    );

    static CreatedRef ffi_get_add3Things(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctionsStruct>(obj).add3Things
        )
    );

    static CreatedRef ffi_get_makeList(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctionsStruct>(obj).makeList
        )
    );

    static CreatedRef ffi_get_fifthThing(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctionsStruct>(obj).fifthThing
        )
    );

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestAsyncFunctionsStruct &&
            (
                const DeepCollectionEquality().equals(other.const42, const42) &&
                const DeepCollectionEquality().equals(other.iabs, iabs) &&
                const DeepCollectionEquality().equals(other.intCompose, intCompose) &&
                const DeepCollectionEquality().equals(other.add3Things, add3Things) &&
                const DeepCollectionEquality().equals(other.makeList, makeList) &&
                const DeepCollectionEquality().equals(other.fifthThing, fifthThing)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(const42), 
        const DeepCollectionEquality().hash(iabs), 
        const DeepCollectionEquality().hash(intCompose), 
        const DeepCollectionEquality().hash(add3Things), 
        const DeepCollectionEquality().hash(makeList), 
        const DeepCollectionEquality().hash(fifthThing)
    );

    TestAsyncFunctionsStruct copyWith({
        Future<int> Function()? const42,
        Future<int> Function(int)? iabs,
        Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int))? intCompose,
        Future<double> Function(double, double, int)? add3Things,
        Future<List<String>> Function(String, String, String, String)? makeList,
        Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function())? fifthThing
    }) => TestAsyncFunctionsStruct(
        const42: const42 ?? this.const42,
        iabs: iabs ?? this.iabs,
        intCompose: intCompose ?? this.intCompose,
        add3Things: add3Things ?? this.add3Things,
        makeList: makeList ?? this.makeList,
        fifthThing: fifthThing ?? this.fifthThing
    );
}
