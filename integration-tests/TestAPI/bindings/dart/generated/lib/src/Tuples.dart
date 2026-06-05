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

/// <!-- FishyJoes.export(Tuples) -->
class Tuples {
    Tuples._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(tuple2) -->
    static tuple.Tuple2<int, String> get tuple2 =>
        check((exn) =>
            consumeCreatedRef<tuple.Tuple2<int, String>>(f__iota_get_TestAPI_Tuples_tuple2(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(tuple3) -->
    static tuple.Tuple3<String, double, String> get tuple3 =>
        check((exn) =>
            consumeCreatedRef<tuple.Tuple3<String, double, String>>(f__iota_get_TestAPI_Tuples_tuple3(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(tuple4) -->
    static tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool> get tuple4 =>
        check((exn) =>
            consumeCreatedRef<tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>>(f__iota_get_TestAPI_Tuples_tuple4(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(tuple5) -->
    static tuple.Tuple5<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>> get tuple5 =>
        check((exn) =>
            consumeCreatedRef<tuple.Tuple5<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>>>(f__iota_get_TestAPI_Tuples_tuple5(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(tuple6) -->
    static tuple.Tuple6<String, int, double, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple5<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>>, bool> get tuple6 =>
        check((exn) =>
            consumeCreatedRef<tuple.Tuple6<String, int, double, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple5<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>>, bool>>(f__iota_get_TestAPI_Tuples_tuple6(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(checkTuples) -->
    staticbool checkTuples(
        tuple.Tuple2<int, String> t2,
        tuple.Tuple3<String, double, String> t3,
        tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool> t4,
        tuple.Tuple5<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>> t5,
        tuple.Tuple6<String, int, double, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple5<String, int, tuple.Tuple4<tuple.Tuple2<int, String>, tuple.Tuple3<String, double, String>, String, bool>, tuple.Tuple3<String, double, String>, tuple.Tuple2<int, String>>, bool> t6,
    ) =>
        GCRef.using(t2, (_t2Handle) =>
            GCRef.using(t3, (_t3Handle) =>
                GCRef.using(t4, (_t4Handle) =>
                    GCRef.using(t5, (_t5Handle) =>
                        GCRef.using(t6, (_t6Handle) =>
                            check((OutCreatedRef _exn) => f__iota_TestAPI_Tuples_checkTuples(Loader.shared.env, _t2Handle.ptr, _t3Handle.ptr, _t4Handle.ptr, _t5Handle.ptr, _t6Handle.ptr, _exn))
                        )
                    )
                )
            )
        )
    ;

    static late bool Function(
        Env env,
        UnownedRef t2,
        UnownedRef t3,
        UnownedRef t4,
        UnownedRef t5,
        UnownedRef t6,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Tuples_checkTuples;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Tuples_tuple2;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Tuples_tuple3;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Tuples_tuple4;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Tuples_tuple5;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Tuples_tuple6;
}
