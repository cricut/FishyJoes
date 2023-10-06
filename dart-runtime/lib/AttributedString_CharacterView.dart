import './AttributedString_Index.dart';
import 'dart:ffi' as ffi;
import 'runtime.dart';

/// A view into the underlying storage of an attributed string or substring, as Unicode characters.
/// <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
class AttributedString_CharacterView extends SwiftReference with Iterable<String> {
    AttributedString_CharacterView(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributedString_CharacterView(ref))
    );

    /// The position of the first character in a nonempty attributed string or substring.
    /// <!-- FishyJoes.export(startIndex) -->
    AttributedString_Index get startIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedString_CharacterView_startIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The past-the-end position — the position one greater than the last valid subscript argument.
    /// <!-- FishyJoes.export(endIndex) -->
    AttributedString_Index get endIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedString_CharacterView_endIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// Obtains the index of the character before the character referenced by another index in the view's attributed string or substring.
    /// 
    /// - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
    /// - Returns The index of the character before the one referenced by `index`.
    ///     If `index` is `startIndex` an exception is thrown.
    ///     If `index` is `endIndex`, the index to the last character in the view's attributed string or substring is returned.
    /// 
    /// <!-- FishyJoes.export(indexBefore) -->
    AttributedString_Index indexBefore(
        AttributedString_Index /* before */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Index>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_CharacterView_indexBefore(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    /// Obtains the index of the character after the character referenced by another index in the view's attributed string or substring.
    /// 
    /// - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
    /// - Returns The index of the character before the one referenced by `index`.
    ///     If `index` is `endIndex` an exception is thrown.
    ///     If `index` is `startIndex`, the index to the first character in the view's attributed string or substring is returned.
    /// 
    /// <!-- FishyJoes.export(indexAfter) -->
    AttributedString_Index indexAfter(
        AttributedString_Index /* after */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<AttributedString_Index>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_CharacterView_indexAfter(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    /// Obtains the character associated with an attributed string index.
    /// 
    /// - Parameter index The index of the desired character, between `startIndex` inclusive and `endIndex` exclusive.
    /// - Returns The character associated with `index`.
    ///     If `index` is `endIndex`, an exception is thrown.
    ///     If `index` is `startIndex`, the first character in the view's attributed string or substring is returned.
    /// 
    /// <!-- FishyJoes.export(elementAt) -->
    String elementAtIndex(
        AttributedString_Index /* at */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(index, (_indexHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_CharacterView_elementAt(Loader.shared.env, _thisHandle.ptr, _indexHandle.ptr, _exn)))
            )
        )
    ;

    Iterator<String> get iterator => AttributedString_CharacterView_Iterator(this);

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_CharacterView_elementAt;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_CharacterView_indexAfter;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_CharacterView_indexBefore;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_CharacterView_endIndex;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_CharacterView_startIndex;
}

class AttributedString_CharacterView_Iterator implements Iterator<String> {
    AttributedString_CharacterView view;
    AttributedString_Index? index;

    AttributedString_CharacterView_Iterator(AttributedString_CharacterView view) : 
        view = view,
        index = null {
    }
    
    @override
    String get current => view.elementAtIndex(index!);
  
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
