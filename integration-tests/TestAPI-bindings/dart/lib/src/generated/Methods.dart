import './AssociatedDataEnum.dart' as TestAPI;
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
import './Functions_TheError.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
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

/// <!-- FishyJoes.exportReference(Methods) -->
class Methods extends SwiftReference {
    Methods(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Methods(ref))
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
    static set staticModifiable(int value) {
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
    static set staticStored(int value) {
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
    set instanceModifiable(int value) {
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
    set instanceStored(int value) {
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

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Methods_create;
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
