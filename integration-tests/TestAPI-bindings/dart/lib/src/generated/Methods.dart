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

    static int ffi_get_staticGet(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        Methods.staticGet
    ) ?? 0;

    static int ffi_get_staticGetMethod(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        Methods.staticGetMethod
    ) ?? 0;

    static int ffi_get_staticModifiable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        Methods.staticModifiable
    ) ?? 0;
    static void ffi_set_staticModifiable(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        Methods.staticModifiable = newValue;
    });

    static int ffi_get_staticStored(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        Methods.staticStored
    ) ?? 0;
    static void ffi_set_staticStored(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        Methods.staticStored = newValue;
    });

    static int ffi_get_instanceGet(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Methods>(obj).instanceGet
    ) ?? 0;

    static int ffi_get_garply(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Methods>(obj).garply
    ) ?? 0;

    static int ffi_get_instanceGetMethod(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Methods>(obj).instanceGetMethod
    ) ?? 0;

    static int ffi_get_instanceModifiable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Methods>(obj).instanceModifiable
    ) ?? 0;
    static void ffi_set_instanceModifiable(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Methods>(obj).instanceModifiable = newValue;
    });

    static int ffi_get_instanceStored(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Methods>(obj).instanceStored
    ) ?? 0;
    static void ffi_set_instanceStored(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Methods>(obj).instanceStored = newValue;
    });

    static CreatedRef ffi_create(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.create(
            )
        )
    );

    static int ffi_doublePlusGood(
        UnownedRef obj,
        int a,
        double b,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Methods>(obj).doublePlusGood(
            a,
            b
        )
    ) ?? 0;

    static CreatedRef ffi_async42(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).async42(
            )
        )
    );

    static CreatedRef ffi_asyncYield(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).asyncYield(
            )
        )
    );

    static CreatedRef ffi_asyncSleep(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).asyncSleep(
            )
        )
    );

    static CreatedRef ffi_asyncVoid(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).asyncVoid(
            )
        )
    );

    static CreatedRef ffi_asyncDouble(
        UnownedRef obj,
        double d,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).asyncDouble(
                d
            )
        )
    );

    static CreatedRef ffi_asyncMultipleArgs(
        UnownedRef obj,
        int i,
        Future<int> Function() j,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).asyncMultipleArgs(
                i,
                j
            )
        )
    );

    static CreatedRef ffi_asyncThrowing(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).asyncThrowing(
            )
        )
    );

    static CreatedRef ffi_asyncCallbackFunc0(
        UnownedRef obj,
        Future<int> Function() callback,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Methods>(obj).asyncCallbackFunc0(
                callback
            )
        )
    );

    static CreatedRef ffi_staticAsync42(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsync42(
            )
        )
    );

    static CreatedRef ffi_staticAsyncYield(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsyncYield(
            )
        )
    );

    static CreatedRef ffi_staticAsyncSleep(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsyncSleep(
            )
        )
    );

    static CreatedRef ffi_staticAsyncVoid(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsyncVoid(
            )
        )
    );

    static CreatedRef ffi_staticAsyncDouble(
        UnownedRef obj,
        double d,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsyncDouble(
                d
            )
        )
    );

    static CreatedRef ffi_staticAsyncMultipleArgs(
        UnownedRef obj,
        int i,
        Future<int> Function() j,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsyncMultipleArgs(
                i,
                j
            )
        )
    );

    static CreatedRef ffi_staticAsyncThrowing(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsyncThrowing(
            )
        )
    );

    static CreatedRef ffi_staticAsyncCallbackFunc0(
        UnownedRef obj,
        Future<int> Function() callback,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Methods.staticAsyncCallbackFunc0(
                callback
            )
        )
    );

    @override
    String toString() => 'Methods(staticGet: $staticGet, staticGetMethod: $staticGetMethod, staticModifiable: $staticModifiable, staticStored: $staticStored, instanceGet: $instanceGet, garply: $garply, instanceGetMethod: $instanceGetMethod, instanceModifiable: $instanceModifiable, instanceStored: $instanceStored)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Methods &&
            (
                const DeepCollectionEquality().equals(other.instanceGet, instanceGet) &&
                const DeepCollectionEquality().equals(other.garply, garply) &&
                const DeepCollectionEquality().equals(other.instanceGetMethod, instanceGetMethod) &&
                const DeepCollectionEquality().equals(other.instanceModifiable, instanceModifiable) &&
                const DeepCollectionEquality().equals(other.instanceStored, instanceStored)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(staticGet), 
        const DeepCollectionEquality().hash(staticGetMethod), 
        const DeepCollectionEquality().hash(staticModifiable), 
        const DeepCollectionEquality().hash(staticStored), 
        const DeepCollectionEquality().hash(instanceGet), 
        const DeepCollectionEquality().hash(garply), 
        const DeepCollectionEquality().hash(instanceGetMethod), 
        const DeepCollectionEquality().hash(instanceModifiable), 
        const DeepCollectionEquality().hash(instanceStored)
    );

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
    /// <!-- FishyJoes.export(instanceGet) -->
    int get instanceGet =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Methods_instanceGet(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(garply) -->
    int get garply =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Methods_garply(Loader.shared.env, _thisHandle.ptr, exn)
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
