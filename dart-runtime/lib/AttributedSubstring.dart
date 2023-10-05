import 'AttributedString_Index.dart';
import 'AttributedString_Runs.dart';
import 'AttributedString_CharacterView.dart';
import 'AttributedString_UnicodeScalarView.dart';
import 'AttributedString.dart';
import 'dart:ffi' as ffi;
import 'runtime.dart';

/// A type that represents a portion of an attributed string.
/// 
/// The attributed string for which the type represents a sub-portion can be accessed in the `base` property.
/// The indices offered in `startIndex` and `endIndex` are in the same index space as those in `base`,
/// so they can be used to find what part of `base` the substring represents.
/// 
/// <!-- FishyJoes.exportReference(AttributedSubstring) -->
class AttributedSubstring extends SwiftReference {
    AttributedSubstring(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributedSubstring(ref))
    );

    /// The attributed string that this substring references.
    /// 
    /// The `startIndex` and `endIndex` of this substring are comparable to `base.startIndex` and `base.endIndex` and are guaranteed to be bounded by them.
    /// As such, the portion of the base string represented by the substring is the range from `startIndex` inclusive to `endIndex` exclusive.
    /// 
    /// <!-- FishyJoes.export(base) -->
    AttributedString get base =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString>(f__iota_get_Foundation_AttributedSubstring_base(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// Text represented by the attributed substring.
    /// 
    /// See `runs` for the attribute information associated with the attributed substring's text.
    /// 
    /// <!-- FishyJoes.export(string) -->
    String get string =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_Foundation_AttributedSubstring_string(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The attributed runs of the attributed substring, as a view into the underlying string.
    /// 
    /// This view provides access to the attribute information associated with the attributed substring.
    /// 
    /// See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
    /// are associated with a particular position in the attributed substring.
    /// 
    /// For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
    /// and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
    /// 
    /// <!-- FishyJoes.export(runs) -->
    AttributedString_Runs get runs =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Runs>(f__iota_get_Foundation_AttributedSubstring_runs(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The characters of the attributed substring, as a view into the underlying string.
    /// <!-- FishyJoes.export(characters) -->
    AttributedString_CharacterView get characters =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_CharacterView>(f__iota_get_Foundation_AttributedSubstring_characters(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The Unicode scalars of the attributed substring, as a view into the underlying string.
    /// <!-- FishyJoes.export(unicodeScalars) -->
    AttributedString_UnicodeScalarView get unicodeScalars =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_UnicodeScalarView>(f__iota_get_Foundation_AttributedSubstring_unicodeScalars(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The position of the first character in a nonempty attributed substring.
    /// 
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
    /// 
    /// <!-- FishyJoes.export(startIndex) -->
    AttributedString_Index get startIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedSubstring_startIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.
    /// 
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
    /// 
    /// <!-- FishyJoes.export(endIndex) -->
    AttributedString_Index get endIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedSubstring_endIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// An attributed substring representing the full content of the attributed substring.
    /// <!-- FishyJoes.export(substring) -->
    AttributedSubstring get substring =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedSubstring>(f__iota_get_Foundation_AttributedSubstring_substring(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_Foundation_AttributedSubstring_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// Obtains an attributed substring representing part of the attributed substring.
    /// 
    /// - Parameter range The portion of the attributed substring to be represented by the substring, bounded by `startIndex` and `endIndex`.
    /// - Returns A substring of `base` over `range`.
    /// 
    /// <!-- FishyJoes.export(substringForRange) -->
    AttributedSubstring substringForRange(
        SwiftRange<AttributedString_Index> /* for */ range,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                consumeCreatedRef<AttributedSubstring>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedSubstring_substringForRange(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _exn)))
            )
        )
    ;

    /// Creates an attributed substring with an empty base attributed string.
    /// <!-- FishyJoes.export(createEmpty) -->
    static AttributedSubstring createEmpty(
    ) =>
        consumeCreatedRef<AttributedSubstring>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedSubstring_createEmpty(Loader.shared.env, _exn)))
    ;

    bool operator ==(
        Object? other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as AttributedSubstring, (otherHandle) =>
                check((exn) => f__iota_Foundation_AttributedSubstring_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedSubstring_createEmpty;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedSubstring_equals;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedSubstring_substringForRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_base;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_characters;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_endIndex;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_runs;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_startIndex;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_string;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_substring;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedSubstring_unicodeScalars;
}
