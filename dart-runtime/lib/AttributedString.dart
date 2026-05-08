// ignore_for_file: unnecessary_import

import 'AttributeContainer.dart';
import 'AttributedString_Index.dart';
import 'AttributedString_Runs.dart';
import 'AttributedString_CharacterView.dart';
import 'AttributedString_UnicodeScalarView.dart';
import 'AttributedSubstring.dart';
import 'dart:ffi' as ffi;
import 'runtime.dart';

/// A string with associated attributes for portions of its text.
/// 
/// See `text` or `characters` for access to the text of an attributed string.
/// See `runs` for access to the attribute information associated with the attributed string's text.
/// 
/// <!-- FishyJoes.exportReference(AttributedString) -->
class AttributedString extends SwiftReference {
    AttributedString(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributedString(ref))
    );

    /// Text represented by the attributed string.
    /// 
    /// See `runs` for the attribute information associated with the attributed string's text.
    /// 
    /// <!-- FishyJoes.export(string) -->
    String get string =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_Foundation_AttributedString_string(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The attributed runs of the attributed string, as a view into the underlying string.
    /// 
    /// This view provides access to the attribute information associated with the attributed string.
    /// 
    /// See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
    /// are associated with a particular position in the attributed string.
    /// 
    /// For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
    /// and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
    /// 
    /// <!-- FishyJoes.export(runs) -->
    AttributedString_Runs get runs =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Runs>(f__iota_get_Foundation_AttributedString_runs(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The characters of the attributed string, as a view into the underlying string.
    /// <!-- FishyJoes.export(characters) -->
    AttributedString_CharacterView get characters =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_CharacterView>(f__iota_get_Foundation_AttributedString_characters(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The Unicode scalars of the attributed string, as a view into the underlying string.
    /// <!-- FishyJoes.export(unicodeScalars) -->
    AttributedString_UnicodeScalarView get unicodeScalars =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_UnicodeScalarView>(f__iota_get_Foundation_AttributedString_unicodeScalars(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// An attributed substring representing the full content of the attributed string.
    /// <!-- FishyJoes.export(substring) -->
    AttributedSubstring get substring =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedSubstring>(f__iota_get_Foundation_AttributedString_substring(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// The position of the first character in a nonempty attributed string.
    /// 
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
    /// 
    /// <!-- FishyJoes.export(startIndex) -->
    AttributedString_Index get startIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedString_startIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.
    /// 
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
    /// 
    /// <!-- FishyJoes.export(endIndex) -->
    AttributedString_Index get endIndex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<AttributedString_Index>(f__iota_get_Foundation_AttributedString_endIndex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    @override
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_Foundation_AttributedString_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// Obtains an attributed substring representing part of the attributed string.
    /// 
    /// - Parameter range The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.
    /// 
    /// <!-- FishyJoes.export(substringForRange) -->
    AttributedSubstring substringForRange(
        SwiftRange<AttributedString_Index> /* for */ range,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                consumeCreatedRef<AttributedSubstring>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_substringForRange(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _exn)))
            )
        )
    ;

    /// Appends the text and any associated attributes of another attributed string to the end of this one.
    /// - Parameter attributedString The attributed string containing the text and attributes to append.
    /// 
    /// <!-- FishyJoes.export(append) -->
    void append(
        AttributedString attributedString,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(attributedString, (_attributedStringHandle) =>
                check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_append(Loader.shared.env, _thisHandle.ptr, _attributedStringHandle.ptr, _exn))
            )
        )
    ;

    /// Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.
    /// - Parameter subtring The substring containing the text and attributes to append.
    /// 
    /// <!-- FishyJoes.export(appendSubstring) -->
    void appendSubstring(
        AttributedSubstring substring,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(substring, (_substringHandle) =>
                check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_appendSubstring(Loader.shared.env, _thisHandle.ptr, _substringHandle.ptr, _exn))
            )
        )
    ;

    /// Inserts the text and any associated attributes of another attributed string into this one at the specified position.
    /// 
    /// - Parameter attributedString The attributed string containing the text and attributes to insert.
    /// - Parameter index Position at which the content of `attributedString` should be inserted, bounded by `startIndex` and `endIndex`.
    ///     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
    ///     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `append()`.
    /// 
    /// <!-- FishyJoes.export(insert) -->
    void insert(
        AttributedString attributedString,
        AttributedString_Index /* at */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(attributedString, (_attributedStringHandle) =>
                GCRef.using(index, (_indexHandle) =>
                    check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_insert(Loader.shared.env, _thisHandle.ptr, _attributedStringHandle.ptr, _indexHandle.ptr, _exn))
                )
            )
        )
    ;

    /// Inserts the text and any associated attributes of a substring of an attributed string into this one at the specified position.
    /// 
    /// - Parameter substring The substring of an attributed string containing the text and attributes to insert.
    /// - Parameter index Position at which the content of `substring` should be inserted, bounded by `startIndex` and `endIndex`.
    ///     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
    ///     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `appendSubstring()`.
    /// 
    /// <!-- FishyJoes.export(insertSubstring) -->
    void insertSubstring(
        AttributedSubstring substring,
        AttributedString_Index /* at */ index,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(substring, (_substringHandle) =>
                GCRef.using(index, (_indexHandle) =>
                    check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_insertSubstring(Loader.shared.env, _thisHandle.ptr, _substringHandle.ptr, _indexHandle.ptr, _exn))
                )
            )
        )
    ;

    /// Replaces a portion of the text and associated attributes of the attributed string with content from another one.
    /// 
    /// - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributedString The attributed string containing the text and attributes that replaces the content in `range`.
    /// 
    /// <!-- FishyJoes.export(replaceSubrange) -->
    void replaceSubrange(
        SwiftRange<AttributedString_Index> range,
        AttributedString /* with */ attributedString,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                GCRef.using(attributedString, (_attributedStringHandle) =>
                    check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_replaceSubrange(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _attributedStringHandle.ptr, _exn))
                )
            )
        )
    ;

    /// Replaces a portion of the text and associated attributes of the attributed string with content from a substring of another one.
    /// 
    /// - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
    /// - Parameter substring The substring of an attributed string containing the text and attributes that replaces the content in `range`.
    /// 
    /// <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
    void replaceSubrangeWithSubstring(
        SwiftRange<AttributedString_Index> range,
        AttributedSubstring /* with */ substring,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                GCRef.using(substring, (_substringHandle) =>
                    check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_replaceSubrangeWithSubstring(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _substringHandle.ptr, _exn))
                )
            )
        )
    ;

    /// Removes a portion of the text and associated attributes from the attributed string.
    /// 
    /// - Parameter range The portion of the attributed string to remove, bounded by `startIndex` and `endIndex`.
    /// 
    /// <!-- FishyJoes.export(removeSubrange) -->
    void removeSubrange(
        SwiftRange<AttributedString_Index> range,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_removeSubrange(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _exn))
            )
        )
    ;

    /// Associates attributes with the content of the entire attributed string, replacing any existing attribute information.
    /// 
    /// - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.
    /// 
    /// <!-- FishyJoes.export(setAttributes) -->
    void setAttributes(
        AttributeContainer attributes,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(attributes, (_attributesHandle) =>
                check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_setAttributes(Loader.shared.env, _thisHandle.ptr, _attributesHandle.ptr, _exn))
            )
        )
    ;

    /// Associates attributes with the content of a portion of the attributed string, replacing any existing attribute information.
    /// 
    /// - Parameter range The portion of the attributed string whose attributes are to be replaced, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributes The attributes which will subsequently apply to the text in `range`.
    /// 
    /// <!-- FishyJoes.export(setAttributesForRange) -->
    void setAttributesForRange(
        SwiftRange<AttributedString_Index> /* for */ range,
        AttributeContainer attributes,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                GCRef.using(attributes, (_attributesHandle) =>
                    check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_setAttributesForRange(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, _exn))
                )
            )
        )
    ;

    /// Associates attributes with the content of the entire attributed string, merging with any existing attribute information.
    /// 
    /// - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.
    /// - Parameter keepCurrent For attributes in `attributes` that already have a value in the attributed string,
    ///     passing `true` retains the current value of the attribute,
    ///     passing `false` replaces the value of the attribute with the one in `attributes`.
    /// 
    /// <!-- FishyJoes.export(mergeAttributes) -->
    void mergeAttributes(
        AttributeContainer attributes,
        {
            bool keepCurrent = false,
        }
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(attributes, (_attributesHandle) =>
                check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_mergeAttributes(Loader.shared.env, _thisHandle.ptr, _attributesHandle.ptr, keepCurrent, _exn))
            )
        )
    ;

    /// Associates attributes with the content of a portion of the attributed string, merging with any existing attribute information.
    /// 
    /// - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributes The attributes which will subsequently apply to the text in `range`.
    /// - Parameter keepCurrent For attributes in `attributes` that already have a value in `range` in the attributed string,
    ///     passing `true` retains the current value of the attribute,
    ///     passing `false` replaces the value of the attribute with the one in `attributes`.
    /// 
    /// <!-- FishyJoes.export(mergeAttributesForRange) -->
    void mergeAttributesForRange(
        SwiftRange<AttributedString_Index> /* for */ range,
        AttributeContainer attributes,
        {
            bool keepCurrent = false,
        }
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                GCRef.using(attributes, (_attributesHandle) =>
                    check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_mergeAttributesForRange(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, keepCurrent, _exn))
                )
            )
        )
    ;

    /// Replaces occurrences of attributes in one attribute container with those in another attribute container.
    /// 
    /// - Parameter attributes The existing attributes to replace.
    /// - Parameter others The new attributes to apply.
    /// 
    /// <!-- FishyJoes.export(replaceAttributes) -->
    void replaceAttributes(
        AttributeContainer attributes,
        AttributeContainer /* with */ others,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(attributes, (_attributesHandle) =>
                GCRef.using(others, (_othersHandle) =>
                    check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_replaceAttributes(Loader.shared.env, _thisHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, _exn))
                )
            )
        )
    ;

    /// Replaces occurrences of attributes in one attribute container with those in another attribute container.
    /// 
    /// - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributes The existing attributes to replace.
    /// - Parameter others The new attributes to apply.
    /// 
    /// <!-- FishyJoes.export(replaceAttributesForRange) -->
    void replaceAttributesForRange(
        SwiftRange<AttributedString_Index> /* for */ range,
        AttributeContainer attributes,
        AttributeContainer /* with */ others,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(range, (_rangeHandle) =>
                GCRef.using(attributes, (_attributesHandle) =>
                    GCRef.using(others, (_othersHandle) =>
                        check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_replaceAttributesForRange(Loader.shared.env, _thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, _exn))
                    )
                )
            )
        )
    ;

    /// Creates an attributed string containing the empty string as its text with no associated attributes.
    /// <!-- FishyJoes.export(createEmpty) -->
    static AttributedString createEmpty(
    ) =>
        consumeCreatedRef<AttributedString>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_createEmpty(Loader.shared.env, _exn)))
    ;

    /// Creates an attributed string containing a string as its text, all associated with the specified attributes.
    /// 
    /// - Parameter string A string containing the text to serve as the content of the attributed string.
    /// - Parameter attributes Attributes to associate with the full range of the attributed string.
    /// 
    /// <!-- FishyJoes.export(create) -->
    static AttributedString create(
        String string,
        {
            AttributeContainer? attributes = null,
        }
    ) =>
        GCRef.using(string, (_stringHandle) =>
            GCRef.using(attributes, (_attributesHandle) =>
                consumeCreatedRef<AttributedString>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_create(Loader.shared.env, _stringHandle.ptr, _attributesHandle.ptr, _exn)))
            )
        )
    ;

    /// Creates an attributed string drawing its the text and attributes from a substring of another attributed string.
    /// 
    /// - Parameter substring A substring of another attributed string whose content is used for the created attributed string.
    /// 
    /// <!-- FishyJoes.export(createFromSubstring) -->
    static AttributedString createFromSubstring(
        AttributedSubstring substring,
    ) =>
        GCRef.using(substring, (_substringHandle) =>
            consumeCreatedRef<AttributedString>(check((OutCreatedRef _exn) => f__iota_Foundation_AttributedString_createFromSubstring(Loader.shared.env, _substringHandle.ptr, _exn)))
        )
    ;

    AttributedString clone() => AttributedString.createFromSubstring(substring);

    @override
    bool operator ==(
        Object other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as AttributedString, (otherHandle) =>
                check((exn) => f__iota_Foundation_AttributedString_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    AttributedSubstring operator [](SwiftRange<AttributedString_Index> range) => substringForRange(range);

    AttributedString operator +(Object? other) {
        var attributedString = AttributedString.createFromSubstring(substring);
        if (other is AttributedString) {
            attributedString.append(other);
        } else if (other is AttributedSubstring) {
            attributedString.appendSubstring(other);
        } else if (other is String) {
            attributedString.append(AttributedString.create(other));
        } else {
            attributedString.append(AttributedString.create(other.toString()));
        }
        return attributedString;
    }

    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef attributedString,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_append;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef substring,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_appendSubstring;
    static late CreatedRef Function(
        Env env,
        UnownedRef string,
        UnownedRef attributes,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_create;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_createEmpty;
    static late CreatedRef Function(
        Env env,
        UnownedRef substring,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_createFromSubstring;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_equals;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef attributedString,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_insert;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef substring,
        UnownedRef index,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_insertSubstring;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef attributes,
        bool keepCurrent,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_mergeAttributes;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        UnownedRef attributes,
        bool keepCurrent,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_mergeAttributesForRange;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_removeSubrange;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef attributes,
        UnownedRef others,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_replaceAttributes;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        UnownedRef attributes,
        UnownedRef others,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_replaceAttributesForRange;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        UnownedRef attributedString,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_replaceSubrange;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        UnownedRef substring,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_replaceSubrangeWithSubstring;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef attributes,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_setAttributes;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        UnownedRef attributes,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_setAttributesForRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef range,
        OutCreatedRef _exn
    ) f__iota_Foundation_AttributedString_substringForRange;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_characters;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_endIndex;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_runs;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_startIndex;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_string;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_substring;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_Foundation_AttributedString_unicodeScalars;
}
