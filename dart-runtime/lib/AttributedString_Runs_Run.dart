// ignore_for_file: unnecessary_import

import 'AttributedString_Index.dart';
import 'AttributeContainer.dart';
import 'dart:ffi' as ffi;
import 'runtime.dart';

/// Description of a run of attributes within an attributed string or substring.
/// <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
class AttributedString_Runs_Run extends SwiftReference {
    AttributedString_Runs_Run(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributedString_Runs_Run(ref))
    );

    /// The range of the portion of the attributed string that this run description represents.
    /// <!-- FishyJoes.export(range) -->
    SwiftRange<AttributedString_Index> get range =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<SwiftRange<AttributedString_Index>>(f__iota_get_Foundation_AttributedString_Runs_Run_range(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;

    /// The attributes associated with of the portion of the attributed string that this run description represents.
    /// <!-- FishyJoes.export(attributes) -->
    AttributeContainer get attributes =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributeContainer>(f__iota_get_Foundation_AttributedString_Runs_Run_attributes(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;

    @override
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_Foundation_AttributedString_Runs_Run_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;

    @override
    bool operator ==(
        Object? other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as AttributedString_Runs_Run, (otherHandle) =>
                check((exn) => f__iota_Foundation_AttributedString_Runs_Run_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_Run_equals;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_Runs_Run_attributes;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_Runs_Run_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_Runs_Run_range;
}
