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

/// <!-- FishyJoes.export(AsyncFunctions) -->
class AsyncFunctions {
    AsyncFunctions._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(const42) -->
    static Future<int> Function() get const42 =>
        check((exn) =>
            consumeCreatedRef<Future<int> Function()>(f__iota_get_TestAPI_AsyncFunctions_const42(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(abs) -->
    static Future<int> Function(int) get abs =>
        check((exn) =>
            consumeCreatedRef<Future<int> Function(int)>(f__iota_get_TestAPI_AsyncFunctions_abs(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(intCompose) -->
    static Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) get intCompose =>
        check((exn) =>
            consumeCreatedRef<Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int))>(f__iota_get_TestAPI_AsyncFunctions_intCompose(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(add3Things) -->
    static Future<double> Function(double, double, int) get add3Things =>
        check((exn) =>
            consumeCreatedRef<Future<double> Function(double, double, int)>(f__iota_get_TestAPI_AsyncFunctions_add3Things(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(makeList) -->
    static Future<List<String>> Function(String, String, String, String) get makeList =>
        check((exn) =>
            consumeCreatedRef<Future<List<String>> Function(String, String, String, String)>(f__iota_get_TestAPI_AsyncFunctions_makeList(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(fifthThing) -->
    static Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) get fifthThing =>
        check((exn) =>
            consumeCreatedRef<Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function())>(f__iota_get_TestAPI_AsyncFunctions_fifthThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(sixthThing) -->
    static Future<int> Function(String, int, double, String, Future<int> Function(), int) get sixthThing =>
        check((exn) =>
            consumeCreatedRef<Future<int> Function(String, int, double, String, Future<int> Function(), int)>(f__iota_get_TestAPI_AsyncFunctions_sixthThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(willThrow) -->
    static Future<int> Function() get willThrow =>
        check((exn) =>
            consumeCreatedRef<Future<int> Function()>(f__iota_get_TestAPI_AsyncFunctions_willThrow(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(exercise0) -->
    static Future<String> exercise0(
        Future<int> Function() fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AsyncFunctions_exercise0(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise1) -->
    static Future<String> exercise1(
        Future<int> Function(int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AsyncFunctions_exercise1(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise2) -->
    static Future<String> exercise2(
        Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AsyncFunctions_exercise2(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise3) -->
    static Future<String> exercise3(
        Future<double> Function(double, double, int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AsyncFunctions_exercise3(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise4) -->
    static Future<String> exercise4(
        Future<List<String>> Function(String, String, String, String) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AsyncFunctions_exercise4(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise5) -->
    static Future<String> exercise5(
        Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AsyncFunctions_exercise5(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise6) -->
    static Future<String> exercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_AsyncFunctions_exercise6(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AsyncFunctions_exercise0;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AsyncFunctions_exercise1;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AsyncFunctions_exercise2;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AsyncFunctions_exercise3;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AsyncFunctions_exercise4;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AsyncFunctions_exercise5;
    static late CreatedRef Function(
        Env env,
        UnownedRef fn,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AsyncFunctions_exercise6;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_abs;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_add3Things;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_const42;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_fifthThing;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_intCompose;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_makeList;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_sixthThing;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_willThrow;
}
