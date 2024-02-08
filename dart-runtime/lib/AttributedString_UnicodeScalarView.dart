// ignore_for_file: unnecessary_import

import 'AttributedString_Index.dart';
import 'dart:ffi' as ffi;
import 'runtime.dart';

/// A view into the underlying storage of the attributed string, as Unicode scalars.
/// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
class AttributedString_UnicodeScalarView extends SwiftReference with Iterable<int> {
    AttributedString_UnicodeScalarView(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributedString_UnicodeScalarView(ref))
    );

    /// The position of the first Unicode scalar in a nonempty attributed string or substring.
    /// <!-- FishyJoes.export(startIndex) -->
    AttributedString_Index get startIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The past-the-end position — the position one greater than the last valid subscript argument.
    /// <!-- FishyJoes.export(endIndex) -->
    AttributedString_Index get endIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// Obtains the index of the Unicode scalar before the scalar referenced by another index in the view's attributed string or substring.
    /// 
    /// - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
    /// - Returns The index of the Unicode scalar before the one referenced by `index`.
    ///     If `index` is `startIndex` an exception is thrown.
    ///     If `index` is `endIndex`, the index to the last Unicode scalar in the view's attributed string or substring is returned.
    /// 
    /// <!-- FishyJoes.export(indexBefore) -->
    AttributedString_Index indexBefore(
        AttributedString_Index /* before */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Index>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_UnicodeScalarView_indexBefore(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    /// Obtains the index of the Unicode scalar after the scalar referenced by another index in the view's attributed string or substring.
    /// 
    /// - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
    /// - Returns The index of the Unicode scalar before the one referenced by `index`.
    ///     If `index` is `endIndex` an exception is thrown.
    ///     If `index` is `startIndex`, the index to the first Unicode scalar in the view's attributed string or substring is returned.
    /// 
    /// <!-- FishyJoes.export(indexAfter) -->
    AttributedString_Index indexAfter(
        AttributedString_Index /* after */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Index>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_UnicodeScalarView_indexAfter(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    /// Obtains the Unicode scalar associated with an attributed string index.
    /// 
    /// - Parameter index The index of the desired Unicode scalar, between `startIndex` inclusive and `endIndex` exclusive.
    /// - Returns The Unicode scalar associated with `index`.
    ///     If `index` is `endIndex`, an exception is thrown.
    ///     If `index` is `startIndex`, the first Unicode scalar in the view's attributed string or substring is returned.
    /// 
    /// <!-- FishyJoes.export(elementAt) -->
    int elementAtIndex(
        AttributedString_Index /* at */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_UnicodeScalarView_elementAt(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn))
            )
        )
    ;

    int operator [](AttributedString_Index index) => elementAtIndex(index);
    
    @override
    Iterator<int> get iterator => AttributedString_UnicodeScalarView_Iterator(this);

    static late int Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_UnicodeScalarView_elementAt;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_UnicodeScalarView_indexAfter;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_UnicodeScalarView_indexBefore;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex;
}

class AttributedString_UnicodeScalarView_Iterator implements Iterator<int> {
    AttributedString_UnicodeScalarView view;
    AttributedString_Index? index;

    AttributedString_UnicodeScalarView_Iterator(AttributedString_UnicodeScalarView view) : 
        view = view,
        index = null {
    }
    
    @override
    int get current => view.elementAtIndex(index!);
  
    @override
    bool moveNext() {
        if (index == null) {
            index = view.startIndex;
            return index != view.endIndex;
        }
        index = view.indexAfter(index!);
        return index != view.endIndex;
    }
}
