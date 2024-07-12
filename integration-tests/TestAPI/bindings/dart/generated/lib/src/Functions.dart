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
    static String exercise0(
        int Function() fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise0(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise1) -->
    static String exercise1(
        int Function(int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise1(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise2) -->
    static String exercise2(
        int Function(int) Function(int Function(int), int Function(int)) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise2(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise3) -->
    static String exercise3(
        double Function(double, double, int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise3(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise4) -->
    static String exercise4(
        List<String> Function(String, String, String, String) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise4(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise5) -->
    static String exercise5(
        int Function() Function(String, int, double, String, int Function()) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise5(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(exercise6) -->
    static String exercise6(
        int Function(String, int, double, String, int Function(), int) fn,
    ) =>
        GCRef.using(fn, (_fnHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_exercise6(Loader.shared.env, _fnHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(willThrow) -->
    static String willThrow(
    ) =>
        consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Functions_willThrow(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    static void Function() thunkTwiceMaker(
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
import './EmptyClass1.dart' as TestAPI;
import './EmptyClass2.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './EmptyStruct.dart' as TestAPI;
import './EmptyStruct2.dart' as TestAPI;
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
import './Results.dart' as TestAPI;
import './Results_Error.dart' as TestAPI;
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
import './TestNonExportedProtocolEnum.dart' as TestAPI;
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
