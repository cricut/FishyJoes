import './_exports.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass) -->
class TestAsyncSwiftSideFunctionsClass extends SwiftReference implements TestAPI.TestAsyncFunctions {
    TestAsyncSwiftSideFunctionsClass(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(TestAsyncSwiftSideFunctionsClass(ref))
    );

    /// <!-- FishyJoes.export(add3Things) -->
    Future<double> Function(double, double, int) get add3Things =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<double> Function(double, double, int)>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(const42) -->
    Future<int> Function() get const42 =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function()>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(fifthThing) -->
    Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) get fifthThing =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function())>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(iabs) -->
    Future<int> Function(int) get iabs =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function(int)>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(intCompose) -->
    Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) get intCompose =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int))>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(makeList) -->
    Future<List<String>> Function(String, String, String, String) get makeList =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<List<String>> Function(String, String, String, String)>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(six) -->
    Future<int> Function(String, int, double, String, Future<int> Function(), int) get six =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function(String, int, double, String, Future<int> Function(), int)>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(willThrow) -->
    Future<int> Function() get willThrow =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function()>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(exercise0) -->
    Future<String> exercise0(
        Future<int> Function() fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise1) -->
    Future<String> exercise1(
        Future<int> Function(int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise2) -->
    Future<String> exercise2(
        Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise3) -->
    Future<String> exercise3(
        Future<double> Function(double, double, int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise4) -->
    Future<String> exercise4(
        Future<List<String>> Function(String, String, String, String) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise5) -->
    Future<String> exercise5(
        Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(exercise6) -->
    Future<String> exercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    Future<void> Function() thunkTwiceMaker(
        Future<void> Function() thunk,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(thunk, (_thunkHandle) =>
                consumeCreatedRef<Future<void> Function()>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker(Loader.shared.env, _thisHandle.ptr, _thunkHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(witness) -->
    TestAPI.TestAsyncFunctions witness(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<TestAPI.TestAsyncFunctions>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(init) -->
    staticTestAPI.TestAsyncSwiftSideFunctionsClass init(
    ) =>
        consumeCreatedRef<TestAPI.TestAsyncSwiftSideFunctionsClass>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(defaultExercise6) -->
    Future<String> defaultExercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fn, (_fnHandle) =>
                consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_defaultExercise6(Loader.shared.env, _thisHandle.ptr, _fnHandle.ptr, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_defaultExercise6;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef thunk,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow;
}
