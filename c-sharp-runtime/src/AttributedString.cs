using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Collections;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    /// <summary>A string with associated attributes for portions of its text.</summary>
    /// <remarks>
    ///     See `text` or `characters` for access to the text of an attributed string.
    ///     See `runs` for access to the attribute information associated with the attributed string's text.
    /// </remarks>
    /// <!-- FishyJoes.exportReference(AttributedString) -->
    public partial class AttributedString : SwiftReference {
        static AttributedString() { Loader.ensureLoaded(); }
        internal AttributedString(ConsumedRef reference): base(reference) {}

        /// <summary>Text represented by the attributed string.</summary>
        /// <remarks>
        ///     See `runs` for the attribute information associated with the attributed string's text.
        /// </remarks>
        /// <!-- FishyJoes.export(string) -->
        public string String {
            get {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedString_String(Loader.env, _thisHandle.ptr, out exn).Consume<string>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedString_String(
            IntPtr envRef, 
            UnownedRef self, 
            out CreatedRef exn
        );

        /// <summary>The attributed runs of the attributed string, as a view into the underlying string.</summary>
        /// <remarks>
        ///     This view provides access to the attribute information associated with the attributed string.
        /// 
        ///     See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
        ///     are associated with a particular position in the attributed string.
        /// 
        ///     For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
        ///     and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
        /// </remarks>
        /// <!-- FishyJoes.export(runs) -->
        public Cricut.FishyJoesRuntime.AttributedString.RunsView Runs {
            get {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedString_Runs(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedString_Runs(
            IntPtr envRef, 
            UnownedRef self, 
            out CreatedRef exn
        );

        /// <summary>The characters of the attributed string, as a view into the underlying string.</summary>
        /// <!-- FishyJoes.export(characters) -->
        public Cricut.FishyJoesRuntime.AttributedString.CharacterView Characters {
            get {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedString_Characters(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.CharacterView>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedString_Characters(
            IntPtr envRef, 
            UnownedRef self, 
            out CreatedRef exn
        );

        /// <summary>The Unicode scalars of the attributed string, as a view into the underlying string.</summary>
        /// <!-- FishyJoes.export(unicodeScalars) -->
        public Cricut.FishyJoesRuntime.AttributedString.UnicodeScalarView UnicodeScalars {
            get {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedString_UnicodeScalars(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.UnicodeScalarView>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedString_UnicodeScalars(
            IntPtr envRef, 
            UnownedRef self, 
            out CreatedRef exn
        );

        /// <summary>An attributed substring representing the full content of the attributed string.</summary>
        /// <!-- FishyJoes.export(substring) -->
        public Cricut.FishyJoesRuntime.AttributedSubstring Substring {
            get {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedString_Substring(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedSubstring>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedString_Substring(
            IntPtr envRef, 
            UnownedRef self, 
            out CreatedRef exn
        );

        /// <summary>The position of the first character in a nonempty attributed string.</summary>
        /// <remarks>
        ///     See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
        /// </remarks>
        /// <!-- FishyJoes.export(startIndex) -->
        public Cricut.FishyJoesRuntime.AttributedString.Index StartIndex {
            get {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedString_StartIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedString_StartIndex(
            IntPtr envRef, 
            UnownedRef self, 
            out CreatedRef exn
        );

        /// <summary>An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.</summary>
        /// <remarks>
        ///     See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
        /// </remarks>
        /// <!-- FishyJoes.export(endIndex) -->
        public Cricut.FishyJoesRuntime.AttributedString.Index EndIndex {
            get {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedString_EndIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedString_EndIndex(
            IntPtr envRef, 
            UnownedRef self, 
            out CreatedRef exn
        );

        /// <summary>Obtains an attributed substring representing part of the attributed string.</summary>
        /// <param name="range">The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.</param>
        /// <!-- FishyJoes.export(substringForRange) -->
        public Cricut.FishyJoesRuntime.AttributedSubstring SubstringForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> /* for */ range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_substringForRange(Loader.env, _thisHandle.ptr, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedSubstring>();
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Foundation_AttributedString_substringForRange(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>Appends the text and any associated attributes of another attributed string to the end of this one.</summary>
        /// <param name="attributedString">The attributed string containing the text and attributes to append.</param>
        /// <!-- FishyJoes.export(append) -->
        public void Append(
            Cricut.FishyJoesRuntime.AttributedString attributedString
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributedStringHandle = new GCRef(attributedString);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_append(Loader.env, _thisHandle.ptr, _attributedStringHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_append(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef attributedString,
            out CreatedRef exn
        );

        /// <summary>Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.</summary>
        /// <param name="substring">The substring containing the text and attributes to append.</param>
        /// <!-- FishyJoes.export(appendSubstring) -->
        public void AppendSubstring(
            Cricut.FishyJoesRuntime.AttributedSubstring substring
        ) {
            using var _thisHandle = new GCRef(this);
            using var _substringHandle = new GCRef(substring);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_appendSubstring(Loader.env, _thisHandle.ptr, _substringHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_appendSubstring(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef substring,
            out CreatedRef exn
        );

        /// <summary>Inserts the text and any associated attributes of another attributed string into this one at the specified position.</summary>
        /// <param name="attributedString">The attributed string containing the text and attributes to insert.</param>
        /// <param name="index">
        ///     Position at which the content of `attributedString` should be inserted, bounded by `startIndex` and `endIndex`.
        ///     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
        ///     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `append()`.
        /// </param>
        /// <!-- FishyJoes.export(insert) -->
        public void Insert(
            Cricut.FishyJoesRuntime.AttributedString attributedString,
            Cricut.FishyJoesRuntime.AttributedString.Index /* at */ index
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributedStringHandle = new GCRef(attributedString);
            using var _indexHandle = new GCRef(index);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_insert(Loader.env, _thisHandle.ptr, _attributedStringHandle.ptr, _indexHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_insert(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef attributedString,
            UnownedRef index,
            out CreatedRef exn
        );

        /// <summary>Inserts the text and any associated attributes of a substring of an attributed string into this one at the specified position.</summary>
        /// <param name="substring">The substring of an attributed string containing the text and attributes to insert.</param>
        /// <param name="index">
        ///     Position at which the content of `substring` should be inserted, bounded by `startIndex` and `endIndex`.
        ///     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
        ///     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `appendSubstring()`.
        /// </param>
        /// <!-- FishyJoes.export(insertSubstring) -->
        public void InsertSubstring(
            Cricut.FishyJoesRuntime.AttributedSubstring substring,
            Cricut.FishyJoesRuntime.AttributedString.Index /* at */ index
        ) {
            using var _thisHandle = new GCRef(this);
            using var _substringHandle = new GCRef(substring);
            using var _indexHandle = new GCRef(index);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_insertSubstring(Loader.env, _thisHandle.ptr, _substringHandle.ptr, _indexHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_insertSubstring(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef substring,
            UnownedRef index,
            out CreatedRef exn
        );

        /// <summary>Replaces a portion of the text and associated attributes of the attributed string with content from another one.</summary>
        /// <param name="range"> The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.</param>
        /// <param name="attributedString"> The attributed string containing the text and attributes that replaces the content in `range`.</param>
        /// <!-- FishyJoes.export(replaceSubrange) -->
        public void ReplaceSubrange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> range,
            Cricut.FishyJoesRuntime.AttributedString /* with */ attributedString
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributedStringHandle = new GCRef(attributedString);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_replaceSubrange(Loader.env, _thisHandle.ptr, _rangeHandle.ptr, _attributedStringHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_replaceSubrange(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributedString,
            out CreatedRef exn
        );

        /// <summary>Replaces a portion of the text and associated attributes of the attributed string with content from a substring of another one.</summary>
        /// <param name="range">The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.</param>
        /// <param name="substring">The substring of an attributed string containing the text and attributes that replaces the content in `range`.</param>
        /// <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
        public void ReplaceSubrangeWithSubstring(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> range,
            Cricut.FishyJoesRuntime.AttributedSubstring /* with */ substring
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _substringHandle = new GCRef(substring);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_replaceSubrangeWithSubstring(Loader.env, _thisHandle.ptr, _rangeHandle.ptr, _substringHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_replaceSubrangeWithSubstring(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef range,
            UnownedRef substring,
            out CreatedRef exn
        );

        /// <summary>Removes a portion of the text and associated attributes from the attributed string.</summary>
        /// <param name="range">The portion of the attributed string to remove, bounded by `startIndex` and `endIndex`.</param>
        /// <!-- FishyJoes.export(removeSubrange) -->
        public void RemoveSubrange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_removeSubrange(Loader.env, _thisHandle.ptr, _rangeHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_removeSubrange(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>Associates attributes with the content of the entire attributed string, replacing any existing attribute information.</summary>
        /// <param name="attributes">The attributes which will subsequently apply to all text in the attributed string.</param>
        /// <!-- FishyJoes.export(setAttributes) -->
        public void SetAttributes(
            Cricut.FishyJoesRuntime.AttributeContainer attributes
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_setAttributes(Loader.env, _thisHandle.ptr, _attributesHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_setAttributes(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>Associates attributes with the content of a portion of the attributed string, replacing any existing attribute information.</summary>
        /// <param name="range">The portion of the attributed string whose attributes are to be replaced, bounded by `startIndex` and `endIndex`.</param>
        /// <param name="attributes">The attributes which will subsequently apply to the text in `range`.</param>
        /// <!-- FishyJoes.export(setAttributesForRange) -->
        public void SetAttributesForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> /* for */ range,
            Cricut.FishyJoesRuntime.AttributeContainer attributes
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_setAttributesForRange(Loader.env, _thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_setAttributesForRange(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>Associates attributes with the content of the entire attributed string, merging with any existing attribute information.</summary>
        /// <param name="attributes">The attributes which will subsequently apply to all text in the attributed string.</param>
        /// <param name="keepCurrent">
        ///     For attributes in `attributes` that already have a value in the attributed string,
        ///     passing `true` retains the current value of the attribute,
        ///     passing `false` replaces the value of the attribute with the one in `attributes`.
        /// </param>
        /// <!-- FishyJoes.export(mergeAttributes) -->
        public void MergeAttributes(
            Cricut.FishyJoesRuntime.AttributeContainer attributes,
            bool keepCurrent = false
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_mergeAttributes(Loader.env, _thisHandle.ptr, _attributesHandle.ptr, keepCurrent, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_mergeAttributes(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef attributes,
            bool keepCurrent,
            out CreatedRef exn
        );

        /// <summary>Associates attributes with the content of a portion of the attributed string, merging with any existing attribute information.</summary>
        /// <param name="range">The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.</param>
        /// <param name="attributes">The attributes which will subsequently apply to the text in `range`.</param>
        /// <param name="keepCurrent">
        ///     For attributes in `attributes` that already have a value in `range` in the attributed string,
        ///     passing `true` retains the current value of the attribute,
        ///     passing `false` replaces the value of the attribute with the one in `attributes`.
        /// </param>
        /// <!-- FishyJoes.export(mergeAttributesForRange) -->
        public void MergeAttributesForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> /* for */ range,
            Cricut.FishyJoesRuntime.AttributeContainer attributes,
            bool keepCurrent = false
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_mergeAttributesForRange(Loader.env, _thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, keepCurrent, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_mergeAttributesForRange(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributes,
            bool keepCurrent,
            out CreatedRef exn
        );

        /// <summary>Replaces occurrences of attributes in one attribute container with those in another attribute container.</summary>
        /// <param name="attributes">The existing attributes to replace.</param>
        /// <param name="others">The new attributes to apply.</param>
        /// <!-- FishyJoes.export(replaceAttributes) -->
        public void ReplaceAttributes(
            Cricut.FishyJoesRuntime.AttributeContainer attributes,
            Cricut.FishyJoesRuntime.AttributeContainer /* with */ others
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            using var _othersHandle = new GCRef(others);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_replaceAttributes(Loader.env, _thisHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_replaceAttributes(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef attributes,
            UnownedRef others,
            out CreatedRef exn
        );

        /// <summary>Replaces occurrences of attributes in one attribute container with those in another attribute container.</summary>
        /// <param name="range">The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.</param>
        /// <param name="attributes">The existing attributes to replace.</param>
        /// <param name="others">The new attributes to apply.</param>
        /// <!-- FishyJoes.export(replaceAttributesForRange) -->
        public void ReplaceAttributesForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> /* for */ range,
            Cricut.FishyJoesRuntime.AttributeContainer attributes,
            Cricut.FishyJoesRuntime.AttributeContainer /* with */ others
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributesHandle = new GCRef(attributes);
            using var _othersHandle = new GCRef(others);
            Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_replaceAttributesForRange(Loader.env, _thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_Foundation_AttributedString_replaceAttributesForRange(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributes,
            UnownedRef others,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var _thisHandle = new GCRef(this);
            using var _otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributedString);
            return Check((out CreatedRef exn) => __iota_Foundation_AttributedString_equals(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_Foundation_AttributedString_equals(
            IntPtr envRef, 
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_hash(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_Foundation_AttributedString_hash(
            IntPtr envRef, 
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>Creates an attributed string containing the empty string as its text with no associated attributes.</summary>
        /// <!-- FishyJoes.export(createEmpty) -->
        public static Cricut.FishyJoesRuntime.AttributedString CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_createEmpty(Loader.env, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString>();
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Foundation_AttributedString_createEmpty(
            IntPtr envRef, 
            out CreatedRef exn
        );

        /// <summary>Creates an attributed string containing a string as its text, all associated with the specified attributes.</summary>
        /// <param name="_string">A string containing the text to serve as the content of the attributed string.</param>
        /// <param name="attributes">Attributes to associate with the full range of the attributed string.</param>
        /// <!-- FishyJoes.export(create) -->
        public static Cricut.FishyJoesRuntime.AttributedString Create(
            string _string,
            Cricut.FishyJoesRuntime.AttributeContainer? attributes = null
        ) {
            using var _stringHandle = new GCRef(_string);
            using var _attributesHandle = new GCRef(attributes);
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_create(Loader.env, _stringHandle.ptr, _attributesHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString>();
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Foundation_AttributedString_create(
            IntPtr envRef, 
            UnownedRef _string,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>Creates an attributed string drawing its the text and attributes from a substring of another attributed string.</summary>
        /// <param name="substring">A substring of another attributed string whose content is used for the created attributed string.</param>
        /// <!-- FishyJoes.export(createFromSubstring) -->
        public static Cricut.FishyJoesRuntime.AttributedString CreateFromSubstring(
            Cricut.FishyJoesRuntime.AttributedSubstring substring
        ) {
            using var _substringHandle = new GCRef(substring);
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_createFromSubstring(Loader.env, _substringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString>();
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Foundation_AttributedString_createFromSubstring(
            IntPtr envRef, 
            UnownedRef substring,
            out CreatedRef exn
        );
    }

    // Convenience Interface
    public partial class AttributedString : ICloneable {
        /// <summary>Synonym for `AttributedString.CreateEmpty()`.</summary>
        public AttributedString(): base(new ConsumedRef(IntPtr.Zero)) { 
            var temp = AttributedString.CreateEmpty();
            reference = temp.reference;
            temp.reference = IntPtr.Zero;
        }

        /// <summary>Synonym for `AttributedString.Create()`.</summary>
        public AttributedString(string _string, AttributeContainer? attributes = null): base(new ConsumedRef(IntPtr.Zero)) { 
            var temp = AttributedString.Create(_string, attributes);
            reference = temp.reference;
            temp.reference = IntPtr.Zero;
        }

        /// <summary>Synonym for `AttributedString.CreateFromSubstring()`.</summary>
        public AttributedString(AttributedSubstring substring): base(new ConsumedRef(IntPtr.Zero)) { 
            var temp = AttributedString.CreateFromSubstring(substring);
            reference = temp.reference;
            temp.reference = IntPtr.Zero;
        }

        /// <summary>Creates a deep clone of an attributed string.</summary>
        public AttributedString(AttributedString attributedString): base(new ConsumedRef(IntPtr.Zero)) {
            // TODO: Faster! private cloneBox function inside SwiftReference?
            var clone = AttributedString.CreateEmpty();
            foreach (var run in attributedString.Runs) { 
                clone.Append(AttributedString.CreateFromSubstring(attributedString.SubstringForRange(run.Range)));
            }
            reference = clone.reference;
            clone.reference = IntPtr.Zero;
        }

        public object Clone() => new AttributedString(this);

        public static explicit operator AttributedString(AttributedSubstring substring) => AttributedString.CreateFromSubstring(substring);
        public static explicit operator AttributedSubstring(AttributedString attributedString) => attributedString.Substring;

        public static explicit operator string(AttributedString attributedString) => attributedString.String;
        public static explicit operator AttributedString(string _string) => AttributedString.Create(_string);

        public AttributedSubstring this[SwiftRange<AttributedString.Index> range] { get => SubstringForRange(range); }

        public static AttributedString operator +(AttributedString a, AttributedString b) {
            var s = new AttributedString();
            s.Append(a);
            s.Append(b);
            return s;
        }

        public static AttributedString operator +(AttributedString a, AttributedSubstring b) {
            var s = new AttributedString();
            s.Append(a);
            s.AppendSubstring(b);
            return s;
        }

        public static AttributedString operator +(AttributedSubstring a, AttributedString b) {
            var s = new AttributedString();
            s.AppendSubstring(a);
            s.Append(b);
            return s;
        }

        public static AttributedString operator +(string a, AttributedString b) {
            var s = new AttributedString();
            s.Append(new AttributedString(a));
            s.Append(b);
            return s;
        }

        public static AttributedString operator +(AttributedString a, string b) {
            var s = new AttributedString();
            s.Append(a);
            s.Append(new AttributedString(b));
            return s;
        }
    }

    public partial class AttributedString {
        /// <summary>A type that represents the position of a character or code unit within an attributed string.</summary>
        /// <!-- FishyJoes.exportReference(AttributedString.Index) -->
        public partial class Index : SwiftReference, IComparable<Index>, IEquatable<Index> {
            static Index() { Loader.ensureLoaded(); }
            internal Index(ConsumedRef reference): base(reference) {}

            public bool Equals(
                Index? other
            ) {
                using var _thisHandle = new GCRef(this);
                using var _otherHandle = new GCRef(other);
                return Check((out CreatedRef exn) => __iota_Foundation_AttributedString_Index_equals(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out exn));
            }

            public override bool Equals(object? other) => Equals(other as Index);

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __iota_Foundation_AttributedString_Index_equals(
                IntPtr envRef, 
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Index_hash(Loader.env, _thisHandle.ptr, out _exn));
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_Foundation_AttributedString_Index_hash(
                IntPtr envRef, 
                UnownedRef self,
                out CreatedRef exn
            );

            public int CompareTo(
                Index? other
            ) {
                using var _thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributedString.Index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Index_compare(Loader.env, _thisHandle.ptr, otherHandle.ptr, out _exn));
            }
            
            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_Foundation_AttributedString_Index_compare(
                IntPtr envRef, 
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );
        }
    }

    public partial class AttributedString {
        // Convenience Interface
        public partial class Index {
            public static bool operator > (Index lhs, Index rhs) => lhs.CompareTo(rhs) > 0;
            public static bool operator < (Index lhs, Index rhs) => lhs.CompareTo(rhs) < 0;
            public static bool operator >= (Index lhs, Index rhs) => lhs.CompareTo(rhs) >= 0;
            public static bool operator <= (Index lhs, Index rhs) => lhs.CompareTo(rhs) <= 0;
            public static bool operator == (Index lhs, Index rhs) => lhs.CompareTo(rhs) == 0;
            public static bool operator != (Index lhs, Index rhs) => !(lhs == rhs);
        }
    }
    
    public partial class AttributedString {
        /// <summary>An iterable view into segments of the attributed string or substring, each of which indicates where a run of identical attributes begins or ends.</summary>
        /// <!-- FishyJoes.exportReference(AttributedString.Runs) -->
        public partial class RunsView : SwiftReference {
            static RunsView() { Loader.ensureLoaded(); }
            internal RunsView(ConsumedRef reference): base(reference) {}

            /// <summary>The position of the first run in a nonempty attributed string or substring.</summary>
            /// <!-- FishyJoes.export(startIndex) -->
            public Cricut.FishyJoesRuntime.AttributedString.RunsView.Index StartIndex {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_Foundation_AttributedString_Runs_StartIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView.Index>()
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Foundation_AttributedString_Runs_StartIndex(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            /// <summary>The past-the-end position — the position one greater than the last valid subscript argument.</summary>
            /// <!-- FishyJoes.export(endIndex) -->
            public Cricut.FishyJoesRuntime.AttributedString.RunsView.Index EndIndex {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_Foundation_AttributedString_Runs_EndIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView.Index>()
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Foundation_AttributedString_Runs_EndIndex(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            /// <summary>Obtains the run index before another index.</summary>
            /// <param name="index">The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.</param>
            /// <returns>
            ///     The index of the run before `index`.
            ///     If `index` is `startIndex` an exception is thrown.
            ///     If `index` is `endIndex`, the last valid index is returned.
            /// </returns>
            /// <!-- FishyJoes.export(indexBefore) -->
            public Cricut.FishyJoesRuntime.AttributedString.RunsView.Index IndexBefore(
                Cricut.FishyJoesRuntime.AttributedString.RunsView.Index /* before */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_indexBefore(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView.Index>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_Runs_indexBefore(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>Obtains the run index after another index.</summary>
            /// <param name="index">The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.</param>
            /// <returns>
            ///     The index of the run after `index`.
            ///     If `index` is `endIndex`, an exception is thrown.
            ///     If `index` is `startIndex`, the first valid index is returned.
            /// </returns>
            /// <!-- FishyJoes.export(indexAfter) -->
            public Cricut.FishyJoesRuntime.AttributedString.RunsView.Index IndexAfter(
                Cricut.FishyJoesRuntime.AttributedString.RunsView.Index /* after */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_indexAfter(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView.Index>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_Runs_indexAfter(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>Obtains the run descriptor at a run index.</summary>
            /// <param name="index">The index of the desired run, between `startIndex` inclusive and `endIndex` exclusive.</param>
            /// <returns>
            ///     The descriptor for the run at `index`.
            ///      If `index` is `endIndex`, an exception is thrown.
            ///      If `index` is `startIndex`, the first valid run descriptor is returned.
            /// </returns>
            /// <!-- FishyJoes.export(elementAt) -->
            public Cricut.FishyJoesRuntime.AttributedString.RunsView.Run ElementAt(
                Cricut.FishyJoesRuntime.AttributedString.RunsView.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_elementAt(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView.Run>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_Runs_elementAt(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>Obtains the run descriptor associated with an attributed string index.</summary>
            /// <param name="index">
            ///     The index of the desired position in the attributed string or substring that this object is a view for,
            ///     between its `startIndex` inclusive and `endIndex` exclusive.
            /// </param>
            /// <returns>
            ///     The descriptor for the run whose `range` contains `index`.
            ///     If `index` is `endIndex` of the view's attributed string or substring, an exception is thrown.
            ///     If `index` is `startIndex` of the view's attributed string or substring, the first valid run descriptor is returned.
            /// </returns>
            /// <!-- FishyJoes.export(elementAtPosition) -->
            public Cricut.FishyJoesRuntime.AttributedString.RunsView.Run ElementAtPosition(
                Cricut.FishyJoesRuntime.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_elementAtPosition(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView.Run>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_Runs_elementAtPosition(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            public override bool Equals(
                object? other
            ) {
                using var _thisHandle = new GCRef(this);
                using var _otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributedString.RunsView);
                return Check((out CreatedRef exn) => __iota_Foundation_AttributedString_Runs_equals(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out exn));
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __iota_Foundation_AttributedString_Runs_equals(
                IntPtr envRef, 
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_hash(Loader.env, _thisHandle.ptr, out _exn));
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_Foundation_AttributedString_Runs_hash(
                IntPtr envRef, 
                UnownedRef self,
                out CreatedRef exn
            );
        }
    }

    public partial class AttributedString {
        // Convenience Interface
        public partial class RunsView : IEnumerable<RunsView.Run> {
            public IEnumerator<RunsView.Run> GetEnumerator(
            ) {
                for (var index = StartIndex; index < EndIndex; index = IndexAfter(index)) {
                    yield return ElementAt(index);
                }
            }

            IEnumerator IEnumerable.GetEnumerator() => (IEnumerator)GetEnumerator();

            public RunsView.Run this[AttributedString.RunsView.Index index] { get => ElementAt(index); }
            public RunsView.Run this[AttributedString.Index index] { get => ElementAtPosition(index); }
        }
    }

    public partial class AttributedString {
        public partial class RunsView {
            /// <summary>A type that represents the position of a descriptor for a run within an attributed string's view of runs.</summary>
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
            public class Index : SwiftReference, IComparable<Index>, IEquatable<Index> {
                static Index() { Loader.ensureLoaded(); }
                internal Index(ConsumedRef reference): base(reference) {}

                public bool Equals(
                    Index? other
                ) {
                    using var _thisHandle = new GCRef(this);
                    using var _otherHandle = new GCRef(other);
                    return Check((out CreatedRef exn) => __iota_Foundation_AttributedString_Runs_Index_equals(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out exn));
                }

                public override bool Equals(object? other) => Equals(other as Index);

                [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern bool __iota_Foundation_AttributedString_Runs_Index_equals(
                    IntPtr envRef, 
                    UnownedRef lhs,
                    UnownedRef rhs,
                    out CreatedRef exn
                );

                public override int GetHashCode(
                ) {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_Index_hash(Loader.env, _thisHandle.ptr, out _exn));
                }

                [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern int __iota_Foundation_AttributedString_Runs_Index_hash(
                    IntPtr envRef, 
                    UnownedRef self,
                    out CreatedRef exn
                );

                public int CompareTo(
                    Index? other
                ) {
                    using var _thisHandle = new GCRef(this);
                    using var otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributedString.RunsView.Index);
                    return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_Index_compare(Loader.env, _thisHandle.ptr, otherHandle.ptr, out _exn));
                }
                
                [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern int __iota_Foundation_AttributedString_Runs_Index_compare(
                    IntPtr envRef, 
                    UnownedRef lhs,
                    UnownedRef rhs,
                    out CreatedRef exn
                );

                #region Convenience

                public static bool operator > (Index lhs, Index rhs) => lhs.CompareTo(rhs) > 0;
                public static bool operator < (Index lhs, Index rhs) => lhs.CompareTo(rhs) < 0;
                public static bool operator >= (Index lhs, Index rhs) => lhs.CompareTo(rhs) >= 0;
                public static bool operator <= (Index lhs, Index rhs) => lhs.CompareTo(rhs) <= 0;
                public static bool operator == (Index lhs, Index rhs) => lhs.CompareTo(rhs) == 0;
                public static bool operator != (Index lhs, Index rhs) => !(lhs == rhs);

                #endregion
            }
        }
    }

    public partial class AttributedString {
        public partial class RunsView {
            /// <summary>Description of a run of attributes within an attributed string or substring.</summary>
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
            public class Run : SwiftReference {
                static Run() { Loader.ensureLoaded(); }
                internal Run(ConsumedRef reference): base(reference) {}

                /// <summary>The range of the portion of the attributed string that this run description represents.</summary>
                /// <!-- FishyJoes.export(range) -->
                public Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> Range {
                    get {
                        using var _thisHandle = new GCRef(this);
                        return Check((out CreatedRef exn) =>
                            __iota_get_Foundation_AttributedString_Runs_Run_Range(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index>>()
                        );
                    }
                }

                [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern CreatedRef __iota_get_Foundation_AttributedString_Runs_Run_Range(
                    IntPtr envRef, 
                    UnownedRef self, 
                    out CreatedRef exn
                );

                /// <summary>The attributes associated with of the portion of the attributed string that this run description represents.</summary>
                /// <!-- FishyJoes.export(attributes) -->
                public Cricut.FishyJoesRuntime.AttributeContainer Attributes {
                    get {
                        using var _thisHandle = new GCRef(this);
                        return Check((out CreatedRef exn) =>
                            __iota_get_Foundation_AttributedString_Runs_Run_Attributes(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributeContainer>()
                        );
                    }
                }

                [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern CreatedRef __iota_get_Foundation_AttributedString_Runs_Run_Attributes(
                    IntPtr envRef, 
                    UnownedRef self, 
                    out CreatedRef exn
                );

                public override bool Equals(
                    object? other
                ) {
                    using var _thisHandle = new GCRef(this);
                    using var _otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributedString.RunsView.Run);
                    return Check((out CreatedRef exn) => __iota_Foundation_AttributedString_Runs_Run_equals(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out exn));
                }

                [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern bool __iota_Foundation_AttributedString_Runs_Run_equals(
                    IntPtr envRef, 
                    UnownedRef lhs,
                    UnownedRef rhs,
                    out CreatedRef exn
                );

                public override int GetHashCode(
                ) {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_Runs_Run_hash(Loader.env, _thisHandle.ptr, out _exn));
                }

                [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern int __iota_Foundation_AttributedString_Runs_Run_hash(
                    IntPtr envRef, 
                    UnownedRef self,
                    out CreatedRef exn
                );
            }
        }
    }

    public partial class AttributedString {
        /// <summary>A view into the underlying storage of an attributed string or substring, as Unicode characters.</summary>
        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
        public partial class CharacterView : SwiftReference {
            static CharacterView() { Loader.ensureLoaded(); }
            internal CharacterView(ConsumedRef reference): base(reference) {}

            /// <summary>The position of the first character in a nonempty attributed string or substring.</summary>
            /// <!-- FishyJoes.export(startIndex) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index StartIndex {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_Foundation_AttributedString_CharacterView_StartIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Foundation_AttributedString_CharacterView_StartIndex(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            /// <summary>The past-the-end position — the position one greater than the last valid subscript argument.</summary>
            /// <!-- FishyJoes.export(endIndex) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index EndIndex {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_Foundation_AttributedString_CharacterView_EndIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Foundation_AttributedString_CharacterView_EndIndex(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            /// <summary>Obtains the index of the character before the character referenced by another index in the view's attributed string or substring.</summary>
            /// <param name="index">The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.</param>
            /// <returns>
            ///     The index of the character before the one referenced by `index`.
            ///     If `index` is `startIndex` an exception is thrown.
            ///     If `index` is `endIndex`, the index to the last character in the view's attributed string or substring is returned.
            /// </returns>
            /// <!-- FishyJoes.export(indexBefore) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index IndexBefore(
                Cricut.FishyJoesRuntime.AttributedString.Index /* before */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_CharacterView_indexBefore(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_CharacterView_indexBefore(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>Obtains the index of the character after the character referenced by another index in the view's attributed string or substring.</summary>
            /// <param name="index">The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.</param>
            /// <returns>
            ///     The index of the character before the one referenced by `index`.
            ///     If `index` is `endIndex` an exception is thrown.
            ///     If `index` is `startIndex`, the index to the first character in the view's attributed string or substring is returned.
            /// </returns>
            /// <!-- FishyJoes.export(indexAfter) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index IndexAfter(
                Cricut.FishyJoesRuntime.AttributedString.Index /* after */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_CharacterView_indexAfter(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_CharacterView_indexAfter(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>Obtains the character associated with an attributed string index.</summary>
            /// <param name="index">The index of the desired character, between `startIndex` inclusive and `endIndex` exclusive.</param>
            /// <returns>
            ///     The character associated with `index`.
            ///     If `index` is `endIndex`, an exception is thrown.
            ///     If `index` is `startIndex`, the first character in the view's attributed string or substring is returned.
            /// </returns>
            /// <!-- FishyJoes.export(elementAt) -->
            public string ElementAt(
                Cricut.FishyJoesRuntime.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_CharacterView_elementAt(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<string>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_CharacterView_elementAt(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );
        }
    }

    public partial class AttributedString {
        // Convenience Interface
        public partial class CharacterView : IEnumerable<string> {
            public IEnumerator<string> GetEnumerator(
            ) {
                for (var index = StartIndex; index < EndIndex; index = IndexAfter(index)) {
                    yield return ElementAt(index);
                }
            }

            IEnumerator IEnumerable.GetEnumerator() => (IEnumerator)GetEnumerator();

            public string this[AttributedString.Index index] { get => ElementAt(index); }
        }
    }

    public partial class AttributedString {
        /// <summary>A view into the underlying storage of the attributed string, as Unicode scalars.</summary>
        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
        public partial class UnicodeScalarView : SwiftReference {
            static UnicodeScalarView() { Loader.ensureLoaded(); }
            internal UnicodeScalarView(ConsumedRef reference): base(reference) {}

            /// <summary>The position of the first Unicode scalar in a nonempty attributed string or substring.</summary>
            /// <!-- FishyJoes.export(startIndex) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index StartIndex {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_Foundation_AttributedString_UnicodeScalarView_StartIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Foundation_AttributedString_UnicodeScalarView_StartIndex(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            /// <summary>The past-the-end position — the position one greater than the last valid subscript argument.</summary>
            /// <!-- FishyJoes.export(endIndex) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index EndIndex {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_Foundation_AttributedString_UnicodeScalarView_EndIndex(Loader.env, _thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Foundation_AttributedString_UnicodeScalarView_EndIndex(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            /// <summary>Obtains the index of the Unicode scalar before the scalar referenced by another index in the view's attributed string or substring.</summary>
            /// <param name="index">The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.</param>
            /// <returns>
            ///     The index of the Unicode scalar before the one referenced by `index`.
            ///     If `index` is `startIndex` an exception is thrown.
            ///     If `index` is `endIndex`, the index to the last Unicode scalar in the view's attributed string or substring is returned.
            /// </returns>
            /// <!-- FishyJoes.export(indexBefore) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index IndexBefore(
                Cricut.FishyJoesRuntime.AttributedString.Index /* before */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_UnicodeScalarView_indexBefore(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_UnicodeScalarView_indexBefore(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>Obtains the index of the Unicode scalar after the scalar referenced by another index in the view's attributed string or substring.</summary>
            /// <param name="index">The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.</param>
            /// <returns>
            ///     The index of the Unicode scalar before the one referenced by `index`.
            ///     If `index` is `endIndex` an exception is thrown.
            ///     If `index` is `startIndex`, the index to the first Unicode scalar in the view's attributed string or substring is returned.
            /// </returns>
            /// <!-- FishyJoes.export(indexAfter) -->
            public Cricut.FishyJoesRuntime.AttributedString.Index IndexAfter(
                Cricut.FishyJoesRuntime.AttributedString.Index /* after */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_UnicodeScalarView_indexAfter(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Foundation_AttributedString_UnicodeScalarView_indexAfter(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>Obtains the Unicode scalar associated with an attributed string index.</summary>
            /// <param name="index">The index of the desired Unicode scalar, between `startIndex` inclusive and `endIndex` exclusive.</param>
            /// <returns>
            ///     The Unicode scalar associated with `index`.
            ///     If `index` is `endIndex`, an exception is thrown.
            ///     If `index` is `startIndex`, the first Unicode scalar in the view's attributed string or substring is returned.
            /// </returns>
            /// <!-- FishyJoes.export(elementAt) -->
            public uint ElementAt(
                Cricut.FishyJoesRuntime.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_UnicodeScalarView_elementAt(Loader.env, _thisHandle.ptr, _indexHandle.ptr, out _exn));
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern uint __iota_Foundation_AttributedString_UnicodeScalarView_elementAt(
                IntPtr envRef, 
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );
        }
    }

    
    public partial class AttributedString {
        // Convenience Interface
        public partial class UnicodeScalarView : IEnumerable<UInt32> {
            public IEnumerator<UInt32> GetEnumerator(
            ) {
                for (var index = StartIndex; index < EndIndex; index = IndexAfter(index)) {
                    yield return ElementAt(index);
                }
            }

            IEnumerator IEnumerable.GetEnumerator() => (IEnumerator)GetEnumerator();

            public UInt32 this[AttributedString.Index index] { get => ElementAt(index); }
        }
    }
}
