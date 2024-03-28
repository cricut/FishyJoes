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
import './TestAsyncForeignSideFunctionsStruct.dart' as TestAPI;
import './TestAsyncFunctions.dart' as TestAPI;
import './TestAsyncSwiftSideFunctionsClass.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestAsyncFunctions) -->
abstract class TestAsyncFunctions {
    Future<String> exercise0(
        Future<int> Function() fn
    );

    Future<String> exercise1(
        Future<int> Function(int) fn
    );

    Future<String> exercise2(
        Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) fn
    );

    Future<String> exercise3(
        Future<double> Function(double, double, int) fn
    );

    Future<String> exercise4(
        Future<List<String>> Function(String, String, String, String) fn
    );

    Future<String> exercise5(
        Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fn
    );

    Future<String> exercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn
    );

    Future<void> Function() thunkTwiceMaker(
        Future<void> Function() thunk
    );

    /// <!-- FishyJoes.export(const42) -->
    Future<int> Function() get const42;

    /// <!-- FishyJoes.export(iabs) -->
    Future<int> Function(int) get iabs;

    /// <!-- FishyJoes.export(intCompose) -->
    Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) get intCompose;

    /// <!-- FishyJoes.export(add3Things) -->
    Future<double> Function(double, double, int) get add3Things;

    /// <!-- FishyJoes.export(makeList) -->
    Future<List<String>> Function(String, String, String, String) get makeList;

    /// <!-- FishyJoes.export(fifthThing) -->
    Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) get fifthThing;

    /// <!-- FishyJoes.export(six) -->
    Future<int> Function(String, int, double, String, Future<int> Function(), int) get six;

    /// <!-- FishyJoes.export(willThrow) -->
    Future<int> Function() get willThrow;
}

extension TestAsyncFunctions_DefaultImplementations on TestAsyncFunctions {
}

extension TestAsyncFunctions_FfiHooks on TestAsyncFunctions {
    static CreatedRef ffi_get_const42(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).const42
        )
    );

    static CreatedRef ffi_get_iabs(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).iabs
        )
    );

    static CreatedRef ffi_get_intCompose(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).intCompose
        )
    );

    static CreatedRef ffi_get_add3Things(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).add3Things
        )
    );

    static CreatedRef ffi_get_makeList(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).makeList
        )
    );

    static CreatedRef ffi_get_fifthThing(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).fifthThing
        )
    );

    static CreatedRef ffi_get_six(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).six
        )
    );

    static CreatedRef ffi_get_willThrow(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).willThrow
        )
    );

    static CreatedRef ffi_exercise0(
        UnownedRef obj,
        ConsumedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise0(
                consumeRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise1(
        UnownedRef obj,
        ConsumedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise1(
                consumeRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise2(
        UnownedRef obj,
        ConsumedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise2(
                consumeRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise3(
        UnownedRef obj,
        ConsumedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise3(
                consumeRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise4(
        UnownedRef obj,
        ConsumedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise4(
                consumeRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise5(
        UnownedRef obj,
        ConsumedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise5(
                consumeRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise6(
        UnownedRef obj,
        ConsumedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise6(
                consumeRef(fn)
            )
        )
    );

    static CreatedRef ffi_thunkTwiceMaker(
        UnownedRef obj,
        ConsumedRef thunk,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).thunkTwiceMaker(
                consumeRef(thunk)
            )
        )
    );
}
