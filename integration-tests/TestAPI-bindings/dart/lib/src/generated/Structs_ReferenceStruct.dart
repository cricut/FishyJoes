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

/// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
class Structs_ReferenceStruct extends SwiftReference {
    Structs_ReferenceStruct(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Structs_ReferenceStruct(ref))
    );

    static CreatedRef ffi_get_immutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_ReferenceStruct>(obj).immutable
        )
    );

    static CreatedRef ffi_get_mutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_ReferenceStruct>(obj).mutable
        )
    );
    static void ffi_set_mutable(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_ReferenceStruct>(obj).mutable = consumeRef<String>(newValue);
    });

    static int ffi_get_hashCode(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Structs_ReferenceStruct>(obj).hashCode
    ) ?? 0;

    /// <!-- FishyJoes.export(immutable) -->
    String get immutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Structs_ReferenceStruct_immutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(mutable) -->
    String get mutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    void set mutable(String value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
        ;
    }
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Structs_ReferenceStruct_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_ReferenceStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_ReferenceStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_ReferenceStruct_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(asyncGetMutable) -->
    Future<String> asyncGetMutable(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    bool operator ==(
        Object? other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as TestAPI.Structs_ReferenceStruct, (otherHandle) =>
                check((exn) => f__iota_TestAPI_Structs_ReferenceStruct_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_ReferenceStruct_create;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_ReferenceStruct_equals;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Structs_ReferenceStruct_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Structs_ReferenceStruct_immutable;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Structs_ReferenceStruct_mutable;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef mutable,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Structs_ReferenceStruct_mutable;
}
