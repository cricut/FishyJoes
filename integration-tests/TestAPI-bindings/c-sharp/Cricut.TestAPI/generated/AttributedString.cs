using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para>A string with associated attributes for portions of its text.</para>
    /// <para></para>
    /// <para>See `text` or `characters` for access to the text of an attributed string.</para>
    /// <para>See `runs` for access to the attribute information associated with the attributed string's text.</para>
    /// <para></para>
    /// <!-- FishyJoes.exportReference(AttributedString) -->
    /// </summary>
    public class AttributedString : SwiftReference {
        internal AttributedString(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <para>Text represented by the attributed string.</para>
        /// <para></para>
        /// <para>See `runs` for the attribute information associated with the attributed string's text.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(string) -->
        /// </summary>
        public string GetString() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_String(thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_String(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The attributed runs of the attributed string, as a view into the underlying string.</para>
        /// <para></para>
        /// <para>This view provides access to the attribute information associated with the attributed string.</para>
        /// <para></para>
        /// <para>See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that</para>
        /// <para>are associated with a particular position in the attributed string.</para>
        /// <para></para>
        /// <para>For example, `s.runs.first().attributes` yields the attributes in the first run of `s`</para>
        /// <para>and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(runs) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Runs GetRuns() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_Runs(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Runs>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_Runs(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The characters of the attributed string, as a view into the underlying string.</para>
        /// <!-- FishyJoes.export(characters) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.CharacterView GetCharacters() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_Characters(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.CharacterView>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_Characters(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The Unicode scalars of the attributed string, as a view into the underlying string.</para>
        /// <!-- FishyJoes.export(unicodeScalars) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.UnicodeScalarView GetUnicodeScalars() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_UnicodeScalars(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.UnicodeScalarView>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_UnicodeScalars(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>An attributed substring representing the full content of the attributed string.</para>
        /// <!-- FishyJoes.export(substring) -->
        /// </summary>
        public Cricut.TestAPI.AttributedSubstring GetSubstring() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_Substring(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedSubstring>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_Substring(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The position of the first character in a nonempty attributed string.</para>
        /// <para></para>
        /// <para>See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(startIndex) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Index GetStartIndex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_StartIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.</para>
        /// <para></para>
        /// <para>See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(endIndex) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Index GetEndIndex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_EndIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>Obtains an attributed substring representing part of the attributed string.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(substringForRange) -->
        /// </summary>
        public Cricut.TestAPI.AttributedSubstring SubstringForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> /* for */ range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_substringForRange(_thisHandle.ptr, _rangeHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedSubstring>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_substringForRange(
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Appends the text and any associated attributes of another attributed string to the end of this one.</para>
        /// <para>- Parameter attributedString The attributed string containing the text and attributes to append.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(append) -->
        /// </summary>
        public void Append(
            Cricut.TestAPI.AttributedString attributedString
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributedStringHandle = new GCRef(attributedString);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_append(_thisHandle.ptr, _attributedStringHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_append(
            UnownedRef self,
            UnownedRef attributedString,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.</para>
        /// <para>- Parameter subtring The substring containing the text and attributes to append.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(appendSubstring) -->
        /// </summary>
        public void AppendSubstring(
            Cricut.TestAPI.AttributedSubstring substring
        ) {
            using var _thisHandle = new GCRef(this);
            using var _substringHandle = new GCRef(substring);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_appendSubstring(_thisHandle.ptr, _substringHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_appendSubstring(
            UnownedRef self,
            UnownedRef substring,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Inserts the text and any associated attributes of another attributed string into this one at the specified position.</para>
        /// <para></para>
        /// <para>- Parameter attributedString The attributed string containing the text and attributes to insert.</para>
        /// <para>- Parameter index Position at which the content of `attributedString` should be inserted, bounded by `startIndex` and `endIndex`.</para>
        /// <para>    If `index` is `startIndex` the content will be inserted before all content of this attributed string.</para>
        /// <para>    If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `append()`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(insert) -->
        /// </summary>
        public void Insert(
            Cricut.TestAPI.AttributedString attributedString,
            Cricut.TestAPI.AttributedString.Index /* at */ index
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributedStringHandle = new GCRef(attributedString);
            using var _indexHandle = new GCRef(index);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_insert(_thisHandle.ptr, _attributedStringHandle.ptr, _indexHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_insert(
            UnownedRef self,
            UnownedRef attributedString,
            UnownedRef index,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Inserts the text and any associated attributes of a substring of an attributed string into this one at the specified position.</para>
        /// <para></para>
        /// <para>- Parameter substring The substring of an attributed string containing the text and attributes to insert.</para>
        /// <para>- Parameter index Position at which the content of `substring` should be inserted, bounded by `startIndex` and `endIndex`.</para>
        /// <para>    If `index` is `startIndex` the content will be inserted before all content of this attributed string.</para>
        /// <para>    If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `appendSubstring()`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(insertSubstring) -->
        /// </summary>
        public void InsertSubstring(
            Cricut.TestAPI.AttributedSubstring substring,
            Cricut.TestAPI.AttributedString.Index /* at */ index
        ) {
            using var _thisHandle = new GCRef(this);
            using var _substringHandle = new GCRef(substring);
            using var _indexHandle = new GCRef(index);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_insertSubstring(_thisHandle.ptr, _substringHandle.ptr, _indexHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_insertSubstring(
            UnownedRef self,
            UnownedRef substring,
            UnownedRef index,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Replaces a portion of the text and associated attributes of the attributed string with content from another one.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.</para>
        /// <para>- Parameter attributedString The attributed string containing the text and attributes that replaces the content in `range`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(replaceSubrange) -->
        /// </summary>
        public void ReplaceSubrange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> range,
            Cricut.TestAPI.AttributedString /* with */ attributedString
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributedStringHandle = new GCRef(attributedString);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_replaceSubrange(_thisHandle.ptr, _rangeHandle.ptr, _attributedStringHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_replaceSubrange(
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributedString,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Replaces a portion of the text and associated attributes of the attributed string with content from a substring of another one.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.</para>
        /// <para>- Parameter substring The substring of an attributed string containing the text and attributes that replaces the content in `range`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
        /// </summary>
        public void ReplaceSubrangeWithSubstring(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> range,
            Cricut.TestAPI.AttributedSubstring /* with */ substring
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _substringHandle = new GCRef(substring);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_replaceSubrangeWithSubstring(_thisHandle.ptr, _rangeHandle.ptr, _substringHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_replaceSubrangeWithSubstring(
            UnownedRef self,
            UnownedRef range,
            UnownedRef substring,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Removes a portion of the text and associated attributes from the attributed string.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed string to remove, bounded by `startIndex` and `endIndex`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(removeSubrange) -->
        /// </summary>
        public void RemoveSubrange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_removeSubrange(_thisHandle.ptr, _rangeHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_removeSubrange(
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Associates attributes with the content of the entire attributed string, replacing any existing attribute information.</para>
        /// <para></para>
        /// <para>- Parameter attributes The attributes which will subsequently apply to all text in the attributed string.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(setAttributes) -->
        /// </summary>
        public void SetAttributes(
            Cricut.TestAPI.AttributeContainer attributes
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_setAttributes(_thisHandle.ptr, _attributesHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_setAttributes(
            UnownedRef self,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Associates attributes with the content of a portion of the attributed string, replacing any existing attribute information.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed string whose attributes are to be replaced, bounded by `startIndex` and `endIndex`.</para>
        /// <para>- Parameter attributes The attributes which will subsequently apply to the text in `range`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(setAttributesForRange) -->
        /// </summary>
        public void SetAttributesForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> /* for */ range,
            Cricut.TestAPI.AttributeContainer attributes
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_setAttributesForRange(_thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_setAttributesForRange(
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Associates attributes with the content of the entire attributed string, merging with any existing attribute information.</para>
        /// <para></para>
        /// <para>- Parameter attributes The attributes which will subsequently apply to all text in the attributed string.</para>
        /// <para>- Parameter keepCurrent For attributes in `attributes` that already have a value in the attributed string,</para>
        /// <para>    passing `true` retains the current value of the attribute,</para>
        /// <para>    passing `false` replaces the value of the attribute with the one in `attributes`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(mergeAttributes) -->
        /// </summary>
        public void MergeAttributes(
            Cricut.TestAPI.AttributeContainer attributes,
            bool keepCurrent = false
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_mergeAttributes(_thisHandle.ptr, _attributesHandle.ptr, keepCurrent, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_mergeAttributes(
            UnownedRef self,
            UnownedRef attributes,
            bool keepCurrent,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Associates attributes with the content of a portion of the attributed string, merging with any existing attribute information.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.</para>
        /// <para>- Parameter attributes The attributes which will subsequently apply to the text in `range`.</para>
        /// <para>- Parameter keepCurrent For attributes in `attributes` that already have a value in `range` in the attributed string,</para>
        /// <para>    passing `true` retains the current value of the attribute,</para>
        /// <para>    passing `false` replaces the value of the attribute with the one in `attributes`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(mergeAttributesForRange) -->
        /// </summary>
        public void MergeAttributesForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> /* for */ range,
            Cricut.TestAPI.AttributeContainer attributes,
            bool keepCurrent = false
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_mergeAttributesForRange(_thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, keepCurrent, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_mergeAttributesForRange(
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributes,
            bool keepCurrent,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Replaces occurrences of attributes in one attribute container with those in another attribute container.</para>
        /// <para></para>
        /// <para>- Parameter attributes The existing attributes to replace.</para>
        /// <para>- Parameter others The new attributes to apply.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(replaceAttributes) -->
        /// </summary>
        public void ReplaceAttributes(
            Cricut.TestAPI.AttributeContainer attributes,
            Cricut.TestAPI.AttributeContainer /* with */ others
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            using var _othersHandle = new GCRef(others);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_replaceAttributes(_thisHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_replaceAttributes(
            UnownedRef self,
            UnownedRef attributes,
            UnownedRef others,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Replaces occurrences of attributes in one attribute container with those in another attribute container.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.</para>
        /// <para>- Parameter attributes The existing attributes to replace.</para>
        /// <para>- Parameter others The new attributes to apply.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(replaceAttributesForRange) -->
        /// </summary>
        public void ReplaceAttributesForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> /* for */ range,
            Cricut.TestAPI.AttributeContainer attributes,
            Cricut.TestAPI.AttributeContainer /* with */ others
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _attributesHandle = new GCRef(attributes);
            using var _othersHandle = new GCRef(others);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_replaceAttributesForRange(_thisHandle.ptr, _rangeHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_replaceAttributesForRange(
            UnownedRef self,
            UnownedRef range,
            UnownedRef attributes,
            UnownedRef others,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Creates an attributed string containing the empty string as its text with no associated attributes.</para>
        /// <!-- FishyJoes.export(createEmpty) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_createEmpty(out _exn)).Consume<Cricut.TestAPI.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_createEmpty(
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Creates an attributed string containing a string as its text, all associated with the specified attributes.</para>
        /// <para></para>
        /// <para>- Parameter string A string containing the text to serve as the content of the attributed string.</para>
        /// <para>- Parameter attributes Attributes to associate with the full range of the attributed string.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Create(
            string _string,
            Cricut.TestAPI.AttributeContainer? attributes = null
        ) {
            using var _stringHandle = new GCRef(_string);
            using var _attributesHandle = new GCRef(attributes);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_create(_stringHandle.ptr, _attributesHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_create(
            UnownedRef _string,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Creates an attributed string drawing its the text and attributes from a substring of another attributed string.</para>
        /// <para></para>
        /// <para>- Parameter substring A substring of another attributed string whose content is used for the created attributed string.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(createFromSubstring) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString CreateFromSubstring(
            Cricut.TestAPI.AttributedSubstring substring
        ) {
            using var _substringHandle = new GCRef(substring);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_createFromSubstring(_substringHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_createFromSubstring(
            UnownedRef substring,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributedString);
            return Check((out CreatedRef exn) => __cs_AttributedStringASDF_equals(thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_AttributedStringASDF_equals(
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_hash(_thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_AttributedStringASDF_hash(
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>An iterable view into segments of the attributed string or substring, each of which indicates where a run of identical attributes begins or ends.</para>
        /// <!-- FishyJoes.exportReference(AttributedString.Runs) -->
        /// </summary>
        public class Runs : SwiftReference {
            internal Runs(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <para>The position of the first run in a nonempty attributed string or substring.</para>
            /// <!-- FishyJoes.export(startIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index GetStartIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_Runs_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Runs.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_StartIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <para>The past-the-end position — the position one greater than the last valid subscript argument.</para>
            /// <!-- FishyJoes.export(endIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index GetEndIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_Runs_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Runs.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_EndIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <para>Obtains the run index before another index.</para>
            /// <para></para>
            /// <para>- Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.</para>
            /// <para>- Returns The index of the run before `index`.</para>
            /// <para>    If `index` is `startIndex` an exception is thrown.</para>
            /// <para>    If `index` is `endIndex`, the last valid index is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(indexBefore) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index IndexBefore(
                Cricut.TestAPI.AttributedString.Runs.Index /* before */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_indexBefore(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_indexBefore(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Obtains the run index after another index.</para>
            /// <para></para>
            /// <para>- Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.</para>
            /// <para>- Returns The index of the run after `index`.</para>
            /// <para>    If `index` is `endIndex`, an exception is thrown.</para>
            /// <para>    If `index` is `startIndex`, the first valid index is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(indexAfter) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index IndexAfter(
                Cricut.TestAPI.AttributedString.Runs.Index /* after */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_indexAfter(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_indexAfter(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Obtains the run descriptor at a run index.</para>
            /// <para></para>
            /// <para>- Parameter index The index of the desired run, between `startIndex` inclusive and `endIndex` exclusive.</para>
            /// <para>- Returns The descriptor for the run at `index`.</para>
            /// <para>     If `index` is `endIndex`, an exception is thrown.</para>
            /// <para>     If `index` is `startIndex`, the first valid run descriptor is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(elementAt) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Run ElementAt(
                Cricut.TestAPI.AttributedString.Runs.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_elementAt(_thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Run>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_elementAt(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Obtains the run descriptor associated with an attributed string index.</para>
            /// <para></para>
            /// <para>- Parameter index The index of the desired position in the attributed string or substring that this object is a view for,</para>
            /// <para>             between its `startIndex` inclusive and `endIndex` exclusive.</para>
            /// <para>- Returns The descriptor for the run whose `range` contains `index`.</para>
            /// <para>    If `index` is `endIndex` of the view's attributed string or substring, an exception is thrown.</para>
            /// <para>    If `index` is `startIndex` of the view's attributed string or substring, the first valid run descriptor is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(elementAtPosition) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Run ElementAtPosition(
                Cricut.TestAPI.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_elementAtPosition(_thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Run>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_elementAtPosition(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            public override bool Equals(
                object? other
            ) {
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributedString.Runs);
                return Check((out CreatedRef exn) => __cs_AttributedStringASDF_Runs_equals(thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __cs_AttributedStringASDF_Runs_equals(
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_hash(_thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __cs_AttributedStringASDF_Runs_hash(
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Description of a run of attributes within an attributed string or substring.</para>
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
            /// </summary>
            public class Run : SwiftReference {
                internal Run(ConsumedRef reference): base(reference) {}

                /// <summary>
                /// <para>The range of the portion of the attributed string that this run description represents.</para>
                /// <!-- FishyJoes.export(range) -->
                /// </summary>
                public Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> GetRange() {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributedStringASDF_Runs_Run_Range(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index>>()
                    );
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_Run_Range(UnownedRef self, out CreatedRef exn);

                /// <summary>
                /// <para>The attributes associated with of the portion of the attributed string that this run description represents.</para>
                /// <!-- FishyJoes.export(attributes) -->
                /// </summary>
                public Cricut.TestAPI.AttributeContainer GetAttributes() {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributedStringASDF_Runs_Run_Attributes(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributeContainer>()
                    );
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_Run_Attributes(UnownedRef self, out CreatedRef exn);

                public override bool Equals(
                    object? other
                ) {
                    using var thisHandle = new GCRef(this);
                    using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributedString.Runs.Run);
                    return Check((out CreatedRef exn) => __cs_AttributedStringASDF_Runs_Run_equals(thisHandle.ptr, otherHandle.ptr, out exn));
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern bool __cs_AttributedStringASDF_Runs_Run_equals(
                    UnownedRef lhs,
                    UnownedRef rhs,
                    out CreatedRef exn
                );

                public override int GetHashCode(
                ) {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_Run_hash(_thisHandle.ptr, out _exn));
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern int __cs_AttributedStringASDF_Runs_Run_hash(
                    UnownedRef self,
                    out CreatedRef exn
                );

                static Run() { _TypeSetup._ensureLoaded(); }
            }

            /// <summary>
            /// <para>A type that represents the position of a descriptor for a run within an attributed string's view of runs.</para>
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
            /// </summary>
            public class Index : SwiftReference {
                internal Index(ConsumedRef reference): base(reference) {}

                public override bool Equals(
                    object? other
                ) {
                    using var thisHandle = new GCRef(this);
                    using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributedString.Runs.Index);
                    return Check((out CreatedRef exn) => __cs_AttributedStringASDF_Runs_Index_equals(thisHandle.ptr, otherHandle.ptr, out exn));
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern bool __cs_AttributedStringASDF_Runs_Index_equals(
                    UnownedRef lhs,
                    UnownedRef rhs,
                    out CreatedRef exn
                );

                public override int GetHashCode(
                ) {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_Index_hash(_thisHandle.ptr, out _exn));
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern int __cs_AttributedStringASDF_Runs_Index_hash(
                    UnownedRef self,
                    out CreatedRef exn
                );

                static Index() { _TypeSetup._ensureLoaded(); }
            }
            static Runs() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <para>A type that represents the position of a character or code unit within an attributed string.</para>
        /// <!-- FishyJoes.exportReference(AttributedString.Index) -->
        /// </summary>
        public class Index : SwiftReference {
            internal Index(ConsumedRef reference): base(reference) {}

            public override bool Equals(
                object? other
            ) {
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributedString.Index);
                return Check((out CreatedRef exn) => __cs_AttributedStringASDF_Index_equals(thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __cs_AttributedStringASDF_Index_equals(
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Index_hash(_thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __cs_AttributedStringASDF_Index_hash(
                UnownedRef self,
                out CreatedRef exn
            );

            static Index() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <para>A view into the underlying storage of an attributed string or substring, as Unicode characters.</para>
        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
        /// </summary>
        public class CharacterView : SwiftReference {
            internal CharacterView(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <para>The position of the first character in a nonempty attributed string or substring.</para>
            /// <!-- FishyJoes.export(startIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetStartIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_CharacterView_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_CharacterView_StartIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <para>The past-the-end position — the position one greater than the last valid subscript argument.</para>
            /// <!-- FishyJoes.export(endIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetEndIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_CharacterView_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_CharacterView_EndIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <para>Obtains the index of the character before the character referenced by another index in the view's attributed string or substring.</para>
            /// <para></para>
            /// <para>- Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.</para>
            /// <para>- Returns The index of the character before the one referenced by `index`.</para>
            /// <para>    If `index` is `startIndex` an exception is thrown.</para>
            /// <para>    If `index` is `endIndex`, the index to the last character in the view's attributed string or substring is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(indexBefore) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexBefore(
                Cricut.TestAPI.AttributedString.Index /* before */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_CharacterView_indexBefore(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_CharacterView_indexBefore(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Obtains the index of the character after the character referenced by another index in the view's attributed string or substring.</para>
            /// <para></para>
            /// <para>- Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.</para>
            /// <para>- Returns The index of the character before the one referenced by `index`.</para>
            /// <para>    If `index` is `endIndex` an exception is thrown.</para>
            /// <para>    If `index` is `startIndex`, the index to the first character in the view's attributed string or substring is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(indexAfter) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexAfter(
                Cricut.TestAPI.AttributedString.Index /* after */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_CharacterView_indexAfter(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_CharacterView_indexAfter(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Obtains the character associated with an attributed string index.</para>
            /// <para></para>
            /// <para>- Parameter index The index of the desired character, between `startIndex` inclusive and `endIndex` exclusive.</para>
            /// <para>- Returns The character associated with `index`.</para>
            /// <para>    If `index` is `endIndex`, an exception is thrown.</para>
            /// <para>    If `index` is `startIndex`, the first character in the view's attributed string or substring is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(elementAt) -->
            /// </summary>
            public string ElementAt(
                Cricut.TestAPI.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_CharacterView_elementAt(_thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<string>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_CharacterView_elementAt(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            static CharacterView() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <para>A view into the underlying storage of the attributed string, as Unicode scalars.</para>
        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
        /// </summary>
        public class UnicodeScalarView : SwiftReference {
            internal UnicodeScalarView(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <para>The position of the first Unicode scalar in a nonempty attributed string or substring.</para>
            /// <!-- FishyJoes.export(startIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetStartIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_UnicodeScalarView_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_UnicodeScalarView_StartIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <para>The past-the-end position — the position one greater than the last valid subscript argument.</para>
            /// <!-- FishyJoes.export(endIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetEndIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_UnicodeScalarView_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_UnicodeScalarView_EndIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <para>Obtains the index of the Unicode scalar before the scalar referenced by another index in the view's attributed string or substring.</para>
            /// <para></para>
            /// <para>- Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.</para>
            /// <para>- Returns The index of the Unicode scalar before the one referenced by `index`.</para>
            /// <para>    If `index` is `startIndex` an exception is thrown.</para>
            /// <para>    If `index` is `endIndex`, the index to the last Unicode scalar in the view's attributed string or substring is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(indexBefore) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexBefore(
                Cricut.TestAPI.AttributedString.Index /* before */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_indexBefore(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_UnicodeScalarView_indexBefore(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Obtains the index of the Unicode scalar after the scalar referenced by another index in the view's attributed string or substring.</para>
            /// <para></para>
            /// <para>- Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.</para>
            /// <para>- Returns The index of the Unicode scalar before the one referenced by `index`.</para>
            /// <para>    If `index` is `endIndex` an exception is thrown.</para>
            /// <para>    If `index` is `startIndex`, the index to the first Unicode scalar in the view's attributed string or substring is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(indexAfter) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexAfter(
                Cricut.TestAPI.AttributedString.Index /* after */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_indexAfter(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_UnicodeScalarView_indexAfter(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Obtains the Unicode scalar associated with an attributed string index.</para>
            /// <para></para>
            /// <para>- Parameter index The index of the desired Unicode scalar, between `startIndex` inclusive and `endIndex` exclusive.</para>
            /// <para>- Returns The Unicode scalar associated with `index`.</para>
            /// <para>    If `index` is `endIndex`, an exception is thrown.</para>
            /// <para>    If `index` is `startIndex`, the first Unicode scalar in the view's attributed string or substring is returned.</para>
            /// <para></para>
            /// <!-- FishyJoes.export(elementAt) -->
            /// </summary>
            public uint ElementAt(
                Cricut.TestAPI.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_elementAt(_thisHandle.ptr, _indexHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern uint __cs_AttributedStringASDF_UnicodeScalarView_elementAt(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            static UnicodeScalarView() { _TypeSetup._ensureLoaded(); }
        }
        static AttributedString() { _TypeSetup._ensureLoaded(); }
    }
}
