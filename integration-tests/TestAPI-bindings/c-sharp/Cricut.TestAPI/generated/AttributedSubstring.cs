using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para>A type that represents a portion of an attributed string.</para>
    /// <para></para>
    /// <para>The attributed string for which the type represents a sub-portion can be accessed in the `base` property.</para>
    /// <para>The indices offered in `startIndex` and `endIndex` are in the same index space as those in `base`,</para>
    /// <para>so they can be used to find what part of `base` the substring represents.</para>
    /// <para></para>
    /// <!-- FishyJoes.exportReference(AttributedSubstring) -->
    /// </summary>
    public class AttributedSubstring : SwiftReference {
        internal AttributedSubstring(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <para>The attributed string that this substring references.</para>
        /// <para></para>
        /// <para>The `startIndex` and `endIndex` of this substring are comparable to `base.startIndex` and `base.endIndex` and are guaranteed to be bounded by them.</para>
        /// <para>As such, the portion of the base string represented by the substring is the range from `startIndex` inclusive to `endIndex` exclusive.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(base) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString GetBase() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_Base(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_Base(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>Text represented by the attributed substring.</para>
        /// <para></para>
        /// <para>See `runs` for the attribute information associated with the attributed substring's text.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(string) -->
        /// </summary>
        public string GetString() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_String(thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_String(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The attributed runs of the attributed substring, as a view into the underlying string.</para>
        /// <para></para>
        /// <para>This view provides access to the attribute information associated with the attributed substring.</para>
        /// <para></para>
        /// <para>See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that</para>
        /// <para>are associated with a particular position in the attributed substring.</para>
        /// <para></para>
        /// <para>For example, `s.runs.first().attributes` yields the attributes in the first run of `s`</para>
        /// <para>and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(runs) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Runs GetRuns() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_Runs(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Runs>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_Runs(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The characters of the attributed substring, as a view into the underlying string.</para>
        /// <!-- FishyJoes.export(characters) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.CharacterView GetCharacters() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_Characters(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.CharacterView>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_Characters(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The Unicode scalars of the attributed substring, as a view into the underlying string.</para>
        /// <!-- FishyJoes.export(unicodeScalars) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.UnicodeScalarView GetUnicodeScalars() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_UnicodeScalars(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.UnicodeScalarView>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_UnicodeScalars(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>The position of the first character in a nonempty attributed substring.</para>
        /// <para></para>
        /// <para>See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(startIndex) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Index GetStartIndex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_StartIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.</para>
        /// <para></para>
        /// <para>See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(endIndex) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Index GetEndIndex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_EndIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>An attributed substring representing the full content of the attributed substring.</para>
        /// <!-- FishyJoes.export(substring) -->
        /// </summary>
        public Cricut.TestAPI.AttributedSubstring GetSubstring() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedSubstringASDF_Substring(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedSubstring>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedSubstringASDF_Substring(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>Obtains an attributed substring representing part of the attributed substring.</para>
        /// <para></para>
        /// <para>- Parameter range The portion of the attributed substring to be represented by the substring, bounded by `startIndex` and `endIndex`.</para>
        /// <para>- Returns A substring of `base` over `range`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(substringForRange) -->
        /// </summary>
        public Cricut.TestAPI.AttributedSubstring SubstringForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> /* for */ range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_AttributedSubstringASDF_substringForRange(_thisHandle.ptr, _rangeHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedSubstring>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedSubstringASDF_substringForRange(
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Creates an attributed substring with an empty base attributed string.</para>
        /// <!-- FishyJoes.export(createEmpty) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedSubstring CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __cs_AttributedSubstringASDF_createEmpty(out _exn)).Consume<Cricut.TestAPI.AttributedSubstring>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedSubstringASDF_createEmpty(
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributedSubstring);
            return Check((out CreatedRef exn) => __cs_AttributedSubstringASDF_equals(thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_AttributedSubstringASDF_equals(
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_AttributedSubstringASDF_hash(_thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_AttributedSubstringASDF_hash(
            UnownedRef self,
            out CreatedRef exn
        );

        static AttributedSubstring() { _TypeSetup._ensureLoaded(); }
    }
}
