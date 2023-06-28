import './AssociatedDataEnum.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Functions_TheError.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:dart_runtime/runtime.dart';
import 'package:dart_runtime/utilities.dart' as utils;
import 'package:ffi/ffi.dart' as ffi;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
class Structs_ReferenceStruct extends SwiftReference {
    Structs_ReferenceStruct(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Structs_ReferenceStruct(ref))
    );

    /// <!-- FishyJoes.export(immutable) -->
    String get immutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__dart_get_Structs_ReferenceStruct_immutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(mutable) -->
    String get mutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__dart_get_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    void set mutable(String value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__dart_set_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
        ;
    }
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__dart_get_Structs_ReferenceStruct_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_ReferenceStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_ReferenceStruct>(check((OutCreatedRef _exn) => f__dart_Structs_ReferenceStruct_create(Loader.shared.env, _exn)))
    ;

    bool operator ==(
        Object? other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as TestAPI.Structs_ReferenceStruct, (otherHandle) =>
                check((exn) => f__dart_Structs_ReferenceStruct_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__dart_Structs_ReferenceStruct_create;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__dart_Structs_ReferenceStruct_equals;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__dart_get_Structs_ReferenceStruct_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__dart_get_Structs_ReferenceStruct_immutable;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__dart_get_Structs_ReferenceStruct_mutable;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef mutable,
        OutCreatedRef _exn
    ) f__dart_set_Structs_ReferenceStruct_mutable;
}
