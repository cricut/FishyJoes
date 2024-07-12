// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.exportReference(Methods) -->
class Methods extends SwiftReference {
    Methods(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Methods(ref))
    );

    /// <!-- FishyJoes.export(garply) -->
    int get garply =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Methods_garply(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(instanceGet) -->
    int get instanceGet =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Methods_instanceGet(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
    int get instanceGetMethod =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Methods_instanceGetMethod(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(instanceModifiable) -->
    int get instanceModifiable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Methods_instanceModifiable(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    void set instanceModifiable(int value) {
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Methods_instanceModifiable(Loader.shared.env, _thisHandle.ptr, value, exn)
            )
        )
        ;
    }
    /// <!-- FishyJoes.export(instanceStored) -->
    int get instanceStored =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Methods_instanceStored(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    void set instanceStored(int value) {
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Methods_instanceStored(Loader.shared.env, _thisHandle.ptr, value, exn)
            )
        )
        ;
    }
    /// <!-- FishyJoes.export(staticGet) -->
    static int get staticGet =>
        check((exn) =>
            f__iota_get_TestAPI_Methods_staticGet(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
    static int get staticGetMethod =>
        check((exn) =>
            f__iota_get_TestAPI_Methods_staticGetMethod(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(staticModifiable) -->
    static int get staticModifiable =>
        check((exn) =>
            f__iota_get_TestAPI_Methods_staticModifiable(Loader.shared.env, exn)
        )
    ;
    static void set staticModifiable(int value) {
        check((exn) =>
            f__iota_set_TestAPI_Methods_staticModifiable(Loader.shared.env, value, exn)
        )
        ;
    }
    /// <!-- FishyJoes.export(staticStored) -->
    static int get staticStored =>
        check((exn) =>
            f__iota_get_TestAPI_Methods_staticStored(Loader.shared.env, exn)
        )
    ;
    static void set staticStored(int value) {
        check((exn) =>
            f__iota_set_TestAPI_Methods_staticStored(Loader.shared.env, value, exn)
        )
        ;
    }
    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Methods create(
    ) =>
        consumeCreatedRef<TestAPI.Methods>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(doublePlusGood) -->
    int doublePlusGood(
        int a,
        double b,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_doublePlusGood(Loader.shared.env, _thisHandle.ptr, a, b, _exn))
        )
    ;

    /// <!-- FishyJoes.export(async42) -->
    Future<int> async42(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_async42(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(asyncYield) -->
    Future<int> asyncYield(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_asyncYield(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(asyncSleep) -->
    Future<int> asyncSleep(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_asyncSleep(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(asyncVoid) -->
    Future<void> asyncVoid(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_asyncVoid(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(asyncDouble) -->
    Future<double> asyncDouble(
        double d,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<double>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_asyncDouble(Loader.shared.env, _thisHandle.ptr, d, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(asyncMultipleArgs) -->
    Future<int> asyncMultipleArgs(
        int i,
        Future<int> Function() j,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(j, (_jHandle) =>
                consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_asyncMultipleArgs(Loader.shared.env, _thisHandle.ptr, i, _jHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(asyncThrowing) -->
    Future<void> asyncThrowing(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_asyncThrowing(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(asyncCallbackFunc0) -->
    Future<int> asyncCallbackFunc0(
        Future<int> Function() callback,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(callback, (_callbackHandle) =>
                consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_asyncCallbackFunc0(Loader.shared.env, _thisHandle.ptr, _callbackHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(staticAsync42) -->
    static Future<int> staticAsync42(
    ) =>
        consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsync42(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(staticAsyncYield) -->
    static Future<int> staticAsyncYield(
    ) =>
        consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsyncYield(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(staticAsyncSleep) -->
    static Future<int> staticAsyncSleep(
    ) =>
        consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsyncSleep(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(staticAsyncVoid) -->
    static Future<void> staticAsyncVoid(
    ) =>
        consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsyncVoid(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(staticAsyncDouble) -->
    static Future<double> staticAsyncDouble(
        double d,
    ) =>
        consumeCreatedRef<Future<double>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsyncDouble(Loader.shared.env, d, _exn)))
    ;

    /// <!-- FishyJoes.export(staticAsyncMultipleArgs) -->
    static Future<int> staticAsyncMultipleArgs(
        int i,
        Future<int> Function() j,
    ) =>
        GCRef.using(j, (_jHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsyncMultipleArgs(Loader.shared.env, i, _jHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(staticAsyncThrowing) -->
    static Future<void> staticAsyncThrowing(
    ) =>
        consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsyncThrowing(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(staticAsyncCallbackFunc0) -->
    static Future<int> staticAsyncCallbackFunc0(
        Future<int> Function() callback,
    ) =>
        GCRef.using(callback, (_callbackHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Methods_staticAsyncCallbackFunc0(Loader.shared.env, _callbackHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_async42;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef callback,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_asyncCallbackFunc0;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        double d,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_asyncDouble;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int i,
        UnownedRef j,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_asyncMultipleArgs;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_asyncSleep;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_asyncThrowing;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_asyncVoid;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_asyncYield;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_create;
    static late int Function(
        Env env,
        UnownedRef _this,
        int a,
        double b,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_doublePlusGood;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsync42;
    static late CreatedRef Function(
        Env env,
        UnownedRef callback,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsyncCallbackFunc0;
    static late CreatedRef Function(
        Env env,
        double d,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsyncDouble;
    static late CreatedRef Function(
        Env env,
        int i,
        UnownedRef j,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsyncMultipleArgs;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsyncSleep;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsyncThrowing;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsyncVoid;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_staticAsyncYield;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_garply;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_instanceGet;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_instanceGetMethod;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_instanceModifiable;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_instanceStored;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_staticGet;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_staticGetMethod;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_staticModifiable;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Methods_staticStored;
    static late void Function(
        Env env,
        UnownedRef _this,
        int instanceModifiable,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Methods_instanceModifiable;
    static late void Function(
        Env env,
        UnownedRef _this,
        int instanceStored,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Methods_instanceStored;
    static late void Function(
        Env env,
        int staticModifiable,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Methods_staticModifiable;
    static late void Function(
        Env env,
        int staticStored,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Methods_staticStored;
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
