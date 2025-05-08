import './_exports.dart' as TestAPI;
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

    Future<String> defaultExercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn
    );

    TestAPI.TestAsyncFunctions witness(
    );

    /// <!-- FishyJoes.export(add3Things) -->
    Future<double> Function(double, double, int) get add3Things;

    /// <!-- FishyJoes.export(const42) -->
    Future<int> Function() get const42;

    /// <!-- FishyJoes.export(fifthThing) -->
    Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) get fifthThing;

    /// <!-- FishyJoes.export(iabs) -->
    Future<int> Function(int) get iabs;

    /// <!-- FishyJoes.export(intCompose) -->
    Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) get intCompose;

    /// <!-- FishyJoes.export(makeList) -->
    Future<List<String>> Function(String, String, String, String) get makeList;

    /// <!-- FishyJoes.export(six) -->
    Future<int> Function(String, int, double, String, Future<int> Function(), int) get six;

    /// <!-- FishyJoes.export(willThrow) -->
    Future<int> Function() get willThrow;
}

extension TestAsyncFunctions_DefaultImplementations on TestAsyncFunctions {
}

extension TestAsyncFunctions_FfiHooks on TestAsyncFunctions {
    static CreatedRef ffi_get_add3Things(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).add3Things
        )
    );

    static CreatedRef ffi_get_const42(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).const42
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

    static CreatedRef ffi_get_makeList(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).makeList
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
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise0(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise1(
        UnownedRef obj,
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise1(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise2(
        UnownedRef obj,
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise2(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise3(
        UnownedRef obj,
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise3(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise4(
        UnownedRef obj,
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise4(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise5(
        UnownedRef obj,
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise5(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_exercise6(
        UnownedRef obj,
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).exercise6(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_thunkTwiceMaker(
        UnownedRef obj,
        UnownedRef thunk,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).thunkTwiceMaker(
                peekRef(thunk)
            )
        )
    );

    static CreatedRef ffi_defaultExercise6(
        UnownedRef obj,
        UnownedRef fn,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).defaultExercise6(
                peekRef(fn)
            )
        )
    );

    static CreatedRef ffi_witness(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestAsyncFunctions>(obj).witness(
            )
        )
    );
}
