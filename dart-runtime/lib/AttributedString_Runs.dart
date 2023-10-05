import 'AttributedString_Index.dart';
import 'AttributedString_Runs_Index.dart';
import 'AttributedString_Runs_Run.dart';
import 'dart:ffi' as ffi;
import 'runtime.dart';

/// An iterable view into segments of the attributed string or substring, each of which indicates where a run of identical attributes begins or ends.
/// <!-- FishyJoes.exportReference(AttributedString.Runs) -->
class AttributedString_Runs extends SwiftReference {
    AttributedString_Runs(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributedString_Runs(ref))
    );

    /// The position of the first run in a nonempty attributed string or substring.
    /// <!-- FishyJoes.export(startIndex) -->
    AttributedString_Runs_Index get startIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Runs_Index>(f__iota_get_Foundation_AttributedString_Runs_startIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The past-the-end position — the position one greater than the last valid subscript argument.
    /// <!-- FishyJoes.export(endIndex) -->
    AttributedString_Runs_Index get endIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Runs_Index>(f__iota_get_Foundation_AttributedString_Runs_endIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_Foundation_AttributedString_Runs_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// Obtains the run index before another index.
    /// 
    /// - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
    /// - Returns The index of the run before `index`.
    ///     If `index` is `startIndex` an exception is thrown.
    ///     If `index` is `endIndex`, the last valid index is returned.
    /// 
    /// <!-- FishyJoes.export(indexBefore) -->
    AttributedString_Runs_Index indexBefore(
        AttributedString_Runs_Index /* before */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Runs_Index>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_Runs_indexBefore(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    /// Obtains the run index after another index.
    /// 
    /// - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
    /// - Returns The index of the run after `index`.
    ///     If `index` is `endIndex`, an exception is thrown.
    ///     If `index` is `startIndex`, the first valid index is returned.
    /// 
    /// <!-- FishyJoes.export(indexAfter) -->
    AttributedString_Runs_Index indexAfter(
        AttributedString_Runs_Index /* after */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Runs_Index>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_Runs_indexAfter(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    /// Obtains the run descriptor at a run index.
    /// 
    /// - Parameter index The index of the desired run, between `startIndex` inclusive and `endIndex` exclusive.
    /// - Returns The descriptor for the run at `index`.
    ///      If `index` is `endIndex`, an exception is thrown.
    ///      If `index` is `startIndex`, the first valid run descriptor is returned.
    /// 
    /// <!-- FishyJoes.export(elementAt) -->
    AttributedString_Runs_Run elementAt(
        AttributedString_Runs_Index /* at */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Runs_Run>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_Runs_elementAt(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    /// Obtains the run descriptor associated with an attributed string index.
    /// 
    /// - Parameter index The index of the desired position in the attributed string or substring that this object is a view for,
    ///              between its `startIndex` inclusive and `endIndex` exclusive.
    /// - Returns The descriptor for the run whose `range` contains `index`.
    ///     If `index` is `endIndex` of the view's attributed string or substring, an exception is thrown.
    ///     If `index` is `startIndex` of the view's attributed string or substring, the first valid run descriptor is returned.
    /// 
    /// <!-- FishyJoes.export(elementAtPosition) -->
    AttributedString_Runs_Run elementAtPosition(
        AttributedString_Index /* at */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Runs_Run>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_Runs_elementAtPosition(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    bool operator ==(
        Object? other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as AttributedString_Runs, (otherHandle) =>
                check((exn) => f__iota_Foundation_AttributedString_Runs_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_elementAt;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_elementAtPosition;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_equals;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_indexAfter;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_Runs_indexBefore;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_Runs_endIndex;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_Runs_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_Runs_startIndex;
}
