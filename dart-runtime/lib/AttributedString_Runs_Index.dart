import 'dart:ffi' as ffi;
import 'runtime.dart';

/// A type that represents the position of a descriptor for a run within an attributed string's view of runs.
/// <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
class AttributedString_Runs_Index extends SwiftReference implements Comparable<dynamic> {
    AttributedString_Runs_Index(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributedString_Runs_Index(ref))
    );

    @override
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_Foundation_AttributedString_Runs_Index_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    @override
    bool operator ==(
        Object other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as AttributedString_Runs_Index, (otherHandle) =>
                check((exn) => f__iota_Foundation_AttributedString_Runs_Index_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    @override
    int compareTo(other) {
        return GCRef.using(this, (thisHandle) =>
            GCRef.using(other, (otherHandle) =>
                check((exn) => f__iota_Foundation_AttributedString_Runs_Index_compare(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))));
    }

    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_Index_equals;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_Runs_Index_hash;
    static late int Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_Index_compare;
}
