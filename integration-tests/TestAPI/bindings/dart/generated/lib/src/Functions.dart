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

/// <!-- FishyJoes.export(Functions) -->
class Functions {
    Functions._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(add3Things) -->
    static double Function(double, double, int) get add3Things =>
        check((exn) =>
            consumeCreatedRef<double Function(double, double, int)>(f__iota_get_TestAPI_Functions_add3Things(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(const42) -->
    static int Function() get const42 =>
        check((exn) =>
            consumeCreatedRef<int Function()>(f__iota_get_TestAPI_Functions_const42(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(fifthThing) -->
    static int Function() Function(String, int, double, String, int Function()) get fifthThing =>
        check((exn) =>
            consumeCreatedRef<int Function() Function(String, int, double, String, int Function())>(f__iota_get_TestAPI_Functions_fifthThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(abs) -->
    static int Function(int) get abs =>
        check((exn) =>
            consumeCreatedRef<int Function(int)>(f__iota_get_TestAPI_Functions_abs(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(intCompose) -->
    static int Function(int) Function(int Function(int), int Function(int)) get intCompose =>
        check((exn) =>
            consumeCreatedRef<int Function(int) Function(int Function(int), int Function(int))>(f__iota_get_TestAPI_Functions_intCompose(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(makeList) -->
    static List<String> Function(String, String, String, String) get makeList =>
        check((exn) =>
            consumeCreatedRef<List<String> Function(String, String, String, String)>(f__iota_get_TestAPI_Functions_makeList(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(sixthThing) -->
    static int Function(String, int, double, String, int Function(), int) get sixthThing =>
        check((exn) =>
            consumeCreatedRef<int Function(String, int, double, String, int Function(), int)>(f__iota_get_TestAPI_Functions_sixthThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(exercise0) -->
    staticString exercise0(
        int Function() fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise0(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise1) -->
    staticString exercise1(
        int Function(int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise1(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise2) -->
    staticString exercise2(
        int Function(int) Function(int Function(int), int Function(int)) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise2(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise3) -->
    staticString exercise3(
        double Function(double, double, int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise3(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise4) -->
    staticString exercise4(
        List<String> Function(String, String, String, String) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise4(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise5) -->
    staticString exercise5(
        int Function() Function(String, int, double, String, int Function()) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise5(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise6) -->
    staticString exercise6(
        int Function(String, int, double, String, int Function(), int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise6(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(willThrow) -->
    staticString willThrow(
    ) =>
        consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_willThrow(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    staticvoid Function() thunkTwiceMaker(
        void Function() thunk,
    ) =>
        GCRef.using(thunk, (_thunkHandle) =>
            consumeCreatedRef<void Function()>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_thunkTwiceMaker(Loader.shared.env, _thunkHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_exercise0;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_exercise1;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_exercise2;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_exercise3;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_exercise4;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_exercise5;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_exercise6;
    static late CreatedRef Function(
        Env env,
        UnownedRef thunk,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_thunkTwiceMaker;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Functions_willThrow;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Functions_abs;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Functions_add3Things;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Functions_const42;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Functions_fifthThing;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Functions_intCompose;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Functions_makeList;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Functions_sixthThing;
}
