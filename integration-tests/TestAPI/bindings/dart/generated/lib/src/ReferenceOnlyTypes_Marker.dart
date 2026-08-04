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

/// <!-- FishyJoes.exportReference(ReferenceOnlyTypes.Marker) -->
class ReferenceOnlyTypes_Marker extends SwiftReference {
    ReferenceOnlyTypes_Marker(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(ReferenceOnlyTypes_Marker(ref))
    );

    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    bool operator ==(
        Object other,
    ) =>
        identical(other, this) ||
        (other is TestAPI.ReferenceOnlyTypes_Marker &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_ReferenceOnlyTypes_Marker_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
    ;

    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ReferenceOnlyTypes_Marker_equals;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash;
}
