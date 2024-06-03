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
import './EmptyStruct.dart' as TestAPI;
import './ExternalWitness_AProtocol.dart' as TestAPI;
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
import './ExternalWitness_TestDefaultComputedProperties.dart' as TestAPI;
import './ExternalWitness_TestDifferingExportNameProtocolDiffy.dart' as TestAPI;
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
import './TestAsyncForeignSideFunctionsStruct.dart' as TestAPI;
import './TestAsyncFunctions.dart' as TestAPI;
import './TestAsyncSwiftSideFunctionsClass.dart' as TestAPI;
import './TestDefaultComputedProperties.dart' as TestAPI;
import './TestDefaultComputedPropertiesEnum.dart' as TestAPI;
import './TestDefaultComputedPropertiesReference.dart' as TestAPI;
import './TestDefaultComputedPropertiesStruct.dart' as TestAPI;
import './TestDifferingExportNameProtocolDiffy.dart' as TestAPI;
import './TestDifferingExportNameStruct.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct) -->
class TestAsyncForeignSideFunctionsStruct implements TestAPI.TestAsyncFunctions {
    final Future<int> Function() const42;
    final Future<int> Function(int) iabs;
    final Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) intCompose;
    final Future<double> Function(double, double, int) add3Things;
    final Future<List<String>> Function(String, String, String, String) makeList;
    final Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fifthThing;
    final Future<int> Function(String, int, double, String, Future<int> Function(), int) six;
    final Future<int> Function() willThrow;
    final Future<String> Function(Future<int> Function()) exercise0Fun;
    final Future<String> Function(Future<int> Function(int)) exercise1Fun;
    final Future<String> Function(Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int))) exercise2Fun;
    final Future<String> Function(Future<double> Function(double, double, int)) exercise3Fun;
    final Future<String> Function(Future<List<String>> Function(String, String, String, String)) exercise4Fun;
    final Future<String> Function(Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function())) exercise5Fun;
    final Future<String> Function(Future<int> Function(String, int, double, String, Future<int> Function(), int)) exercise6Fun;
    final Future<void> Function() Function(Future<void> Function()) thunkTwiceMakerFun;

    TestAsyncForeignSideFunctionsStruct({
        required Future<int> Function() const42,
        required Future<int> Function(int) iabs,
        required Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) intCompose,
        required Future<double> Function(double, double, int) add3Things,
        required Future<List<String>> Function(String, String, String, String) makeList,
        required Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fifthThing,
        required Future<int> Function(String, int, double, String, Future<int> Function(), int) six,
        required Future<int> Function() willThrow,
        required Future<String> Function(Future<int> Function()) exercise0Fun,
        required Future<String> Function(Future<int> Function(int)) exercise1Fun,
        required Future<String> Function(Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int))) exercise2Fun,
        required Future<String> Function(Future<double> Function(double, double, int)) exercise3Fun,
        required Future<String> Function(Future<List<String>> Function(String, String, String, String)) exercise4Fun,
        required Future<String> Function(Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function())) exercise5Fun,
        required Future<String> Function(Future<int> Function(String, int, double, String, Future<int> Function(), int)) exercise6Fun,
        required Future<void> Function() Function(Future<void> Function()) thunkTwiceMakerFun
    }):
        this.const42 = const42,
        this.iabs = iabs,
        this.intCompose = intCompose,
        this.add3Things = add3Things,
        this.makeList = makeList,
        this.fifthThing = fifthThing,
        this.six = six,
        this.willThrow = willThrow,
        this.exercise0Fun = exercise0Fun,
        this.exercise1Fun = exercise1Fun,
        this.exercise2Fun = exercise2Fun,
        this.exercise3Fun = exercise3Fun,
        this.exercise4Fun = exercise4Fun,
        this.exercise5Fun = exercise5Fun,
        this.exercise6Fun = exercise6Fun,
        this.thunkTwiceMakerFun = thunkTwiceMakerFun;

    static CreatedRef ffi_constructor(
        ConsumedRef const42,
        ConsumedRef iabs,
        ConsumedRef intCompose,
        ConsumedRef add3Things,
        ConsumedRef makeList,
        ConsumedRef fifthThing,
        ConsumedRef six,
        ConsumedRef willThrow,
        ConsumedRef exercise0Fun,
        ConsumedRef exercise1Fun,
        ConsumedRef exercise2Fun,
        ConsumedRef exercise3Fun,
        ConsumedRef exercise4Fun,
        ConsumedRef exercise5Fun,
        ConsumedRef exercise6Fun,
        ConsumedRef thunkTwiceMakerFun,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestAsyncForeignSideFunctionsStruct(
            const42: consumeRef(const42),
            iabs: consumeRef(iabs),
            intCompose: consumeRef(intCompose),
            add3Things: consumeRef(add3Things),
            makeList: consumeRef(makeList),
            fifthThing: consumeRef(fifthThing),
            six: consumeRef(six),
            willThrow: consumeRef(willThrow),
            exercise0Fun: consumeRef(exercise0Fun),
            exercise1Fun: consumeRef(exercise1Fun),
            exercise2Fun: consumeRef(exercise2Fun),
            exercise3Fun: consumeRef(exercise3Fun),
            exercise4Fun: consumeRef(exercise4Fun),
            exercise5Fun: consumeRef(exercise5Fun),
            exercise6Fun: consumeRef(exercise6Fun),
            thunkTwiceMakerFun: consumeRef(thunkTwiceMakerFun),
        ))
    );
    @override
    String toString() => 'TestAsyncForeignSideFunctionsStruct(const42: $const42, iabs: $iabs, intCompose: $intCompose, add3Things: $add3Things, makeList: $makeList, fifthThing: $fifthThing, six: $six, willThrow: $willThrow, exercise0Fun: $exercise0Fun, exercise1Fun: $exercise1Fun, exercise2Fun: $exercise2Fun, exercise3Fun: $exercise3Fun, exercise4Fun: $exercise4Fun, exercise5Fun: $exercise5Fun, exercise6Fun: $exercise6Fun, thunkTwiceMakerFun: $thunkTwiceMakerFun)';

    static CreatedRef ffi_get_const42(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).const42
        )
    );

    static CreatedRef ffi_get_iabs(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).iabs
        )
    );

    static CreatedRef ffi_get_intCompose(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).intCompose
        )
    );

    static CreatedRef ffi_get_add3Things(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).add3Things
        )
    );

    static CreatedRef ffi_get_makeList(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).makeList
        )
    );

    static CreatedRef ffi_get_fifthThing(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).fifthThing
        )
    );

    static CreatedRef ffi_get_six(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).six
        )
    );

    static CreatedRef ffi_get_willThrow(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).willThrow
        )
    );

    static CreatedRef ffi_get_exercise0Fun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).exercise0Fun
        )
    );

    static CreatedRef ffi_get_exercise1Fun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).exercise1Fun
        )
    );

    static CreatedRef ffi_get_exercise2Fun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).exercise2Fun
        )
    );

    static CreatedRef ffi_get_exercise3Fun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).exercise3Fun
        )
    );

    static CreatedRef ffi_get_exercise4Fun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).exercise4Fun
        )
    );

    static CreatedRef ffi_get_exercise5Fun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).exercise5Fun
        )
    );

    static CreatedRef ffi_get_exercise6Fun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).exercise6Fun
        )
    );

    static CreatedRef ffi_get_thunkTwiceMakerFun(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncForeignSideFunctionsStruct>(obj).thunkTwiceMakerFun
        )
    );

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestAsyncForeignSideFunctionsStruct &&
            (
                const DeepCollectionEquality().equals(other.const42, const42) &&
                const DeepCollectionEquality().equals(other.iabs, iabs) &&
                const DeepCollectionEquality().equals(other.intCompose, intCompose) &&
                const DeepCollectionEquality().equals(other.add3Things, add3Things) &&
                const DeepCollectionEquality().equals(other.makeList, makeList) &&
                const DeepCollectionEquality().equals(other.fifthThing, fifthThing) &&
                const DeepCollectionEquality().equals(other.six, six) &&
                const DeepCollectionEquality().equals(other.willThrow, willThrow) &&
                const DeepCollectionEquality().equals(other.exercise0Fun, exercise0Fun) &&
                const DeepCollectionEquality().equals(other.exercise1Fun, exercise1Fun) &&
                const DeepCollectionEquality().equals(other.exercise2Fun, exercise2Fun) &&
                const DeepCollectionEquality().equals(other.exercise3Fun, exercise3Fun) &&
                const DeepCollectionEquality().equals(other.exercise4Fun, exercise4Fun) &&
                const DeepCollectionEquality().equals(other.exercise5Fun, exercise5Fun) &&
                const DeepCollectionEquality().equals(other.exercise6Fun, exercise6Fun) &&
                const DeepCollectionEquality().equals(other.thunkTwiceMakerFun, thunkTwiceMakerFun)
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
        const DeepCollectionEquality().hash(fifthThing), 
        const DeepCollectionEquality().hash(six), 
        const DeepCollectionEquality().hash(willThrow), 
        const DeepCollectionEquality().hash(exercise0Fun), 
        const DeepCollectionEquality().hash(exercise1Fun), 
        const DeepCollectionEquality().hash(exercise2Fun), 
        const DeepCollectionEquality().hash(exercise3Fun), 
        const DeepCollectionEquality().hash(exercise4Fun), 
        const DeepCollectionEquality().hash(exercise5Fun), 
        const DeepCollectionEquality().hash(exercise6Fun), 
        const DeepCollectionEquality().hash(thunkTwiceMakerFun)
    );

    TestAsyncForeignSideFunctionsStruct copyWith({
        Future<int> Function()? const42,
        Future<int> Function(int)? iabs,
        Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int))? intCompose,
        Future<double> Function(double, double, int)? add3Things,
        Future<List<String>> Function(String, String, String, String)? makeList,
        Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function())? fifthThing,
        Future<int> Function(String, int, double, String, Future<int> Function(), int)? six,
        Future<int> Function()? willThrow,
        Future<String> Function(Future<int> Function())? exercise0Fun,
        Future<String> Function(Future<int> Function(int))? exercise1Fun,
        Future<String> Function(Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)))? exercise2Fun,
        Future<String> Function(Future<double> Function(double, double, int))? exercise3Fun,
        Future<String> Function(Future<List<String>> Function(String, String, String, String))? exercise4Fun,
        Future<String> Function(Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()))? exercise5Fun,
        Future<String> Function(Future<int> Function(String, int, double, String, Future<int> Function(), int))? exercise6Fun,
        Future<void> Function() Function(Future<void> Function())? thunkTwiceMakerFun
    }) => TestAsyncForeignSideFunctionsStruct(
        const42: const42 ?? this.const42,
        iabs: iabs ?? this.iabs,
        intCompose: intCompose ?? this.intCompose,
        add3Things: add3Things ?? this.add3Things,
        makeList: makeList ?? this.makeList,
        fifthThing: fifthThing ?? this.fifthThing,
        six: six ?? this.six,
        willThrow: willThrow ?? this.willThrow,
        exercise0Fun: exercise0Fun ?? this.exercise0Fun,
        exercise1Fun: exercise1Fun ?? this.exercise1Fun,
        exercise2Fun: exercise2Fun ?? this.exercise2Fun,
        exercise3Fun: exercise3Fun ?? this.exercise3Fun,
        exercise4Fun: exercise4Fun ?? this.exercise4Fun,
        exercise5Fun: exercise5Fun ?? this.exercise5Fun,
        exercise6Fun: exercise6Fun ?? this.exercise6Fun,
        thunkTwiceMakerFun: thunkTwiceMakerFun ?? this.thunkTwiceMakerFun
    );

    /// <!-- FishyJoes.export(exercise0) -->
    Future<String> exercise0(
        Future<int> Function() fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise1) -->
    Future<String> exercise1(
        Future<int> Function(int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise2) -->
    Future<String> exercise2(
        Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise3) -->
    Future<String> exercise3(
        Future<double> Function(double, double, int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise4) -->
    Future<String> exercise4(
        Future<List<String>> Function(String, String, String, String) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise5) -->
    Future<String> exercise5(
        Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise6) -->
    Future<String> exercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    Future<void> Function() thunkTwiceMaker(
        Future<void> Function() thunk,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(thunk, (_thunkHandle) =>
                consumeCreatedRef<Future<void> Function()>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker(Loader.shared.env, _thisHandle.ptr, _thunkHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(witness) -->
    TestAPI.TestAsyncFunctions witness(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<TestAPI.TestAsyncFunctions>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(defaultExercise6) -->
    Future<String> defaultExercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef thunk,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness;
}
