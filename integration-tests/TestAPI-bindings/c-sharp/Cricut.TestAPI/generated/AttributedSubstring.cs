using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(AttributedSubstring) -->
    /// </summary>
    public class AttributedSubstring : SwiftReference {
        internal AttributedSubstring(ConsumedRef reference): base(reference) {}

        /// <summary>
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

        /// <summary>
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
        /// <!-- FishyJoes.export(setAttributes) -->
        /// </summary>
        public void SetAttributes(
            Cricut.TestAPI.AttributeContainer attributes
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __cs_AttributedSubstringASDF_setAttributes(_thisHandle.ptr, _attributesHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedSubstringASDF_setAttributes(
            UnownedRef self,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(mergeAttributes) -->
        /// </summary>
        public void MergeAttributes(
            Cricut.TestAPI.AttributeContainer attributes,
            Cricut.TestAPI.AttributedString.AttributeMergePolicy? mergePolicy = null
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            using var _mergePolicyHandle = new GCRef(mergePolicy);
            Check((out CreatedRef _exn) => __cs_AttributedSubstringASDF_mergeAttributes(_thisHandle.ptr, _attributesHandle.ptr, _mergePolicyHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedSubstringASDF_mergeAttributes(
            UnownedRef self,
            UnownedRef attributes,
            UnownedRef mergePolicy,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(replaceAttributes) -->
        /// </summary>
        public void ReplaceAttributes(
            Cricut.TestAPI.AttributeContainer attributes,
            Cricut.TestAPI.AttributeContainer /* with */ others
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            using var _othersHandle = new GCRef(others);
            Check((out CreatedRef _exn) => __cs_AttributedSubstringASDF_replaceAttributes(_thisHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedSubstringASDF_replaceAttributes(
            UnownedRef self,
            UnownedRef attributes,
            UnownedRef others,
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
